// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:app/features/destination/presentation/widgets/warnings/main.dart';
import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/destination/data/repositories/dest_metro_repository.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/destination/presentation/widgets/errors/main.dart';

part 'dest_metro_state.dart';

class DestMetroCubit extends Cubit<DestMetroState> {
  final DestMetroRepository destMetroRepository;
  DestMetroCubit({required this.destMetroRepository})
      : super(
          DestMetroState.initial(),
        );

  Future changeDestStatus(String fromId, String destId, bool isOffline,
      BuildContext context) async {
    if (isOffline == false) {
      emit(state.copyWith(
          status: DestMetroStatus.updating, isOffline: isOffline));
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        //Login Popup
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return ErrorPopup(
        //         title: "Error!",
        //         message:
        //             "You aren't logged in right now, please make sure you are logged in to save your favourite destinations.",
        //         action: "To Login",
        //         actionFunc: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute<void>(
        //               builder: (BuildContext context) => const LoginPage(),
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   );
      } else {
        String userId = user.uid;
        bool isLiked = false;
        //Update if data is there
        FirebaseFirestore db = FirebaseFirestore.instance;
        String destSearchId = "${userId}_${fromId}_$destId";
        await db
            .collection("dest_history")
            .doc(destSearchId)
            .get()
            .then((value) {
          //Update User Info
          Map<String, dynamic>? destData = value.data();
          if (destData != null) {
            DestTapData savedDestData = DestTapData.fromMap(destData);
            if (savedDestData.isLiked == false) {
              isLiked = true;
            } else {
              isLiked = false;
            }
            savedDestData.isLiked = isLiked;
            db
                .collection("dest_history")
                .doc(destSearchId)
                .update(savedDestData.toMap())
                .onError((e, _) => print("Error updating document: $e"));
          }
        });
        emit(state.copyWith(
            status: DestMetroStatus.loaded,
            isOffline: isOffline,
            isLiked: isLiked));
      }
    } else {
      //In Offline Mode Error Popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return WarningPopup(
            title: "Warning!",
            message:
                "You are currently in offline mode, please make sure online mode is enabled at home.",
            action: "To Home",
            actionFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
          );
        },
      );
    }
  }

  Future getDestNearbyMetro(String placeId, String fromId, double fromLat,
      double fromLng, bool isOffline) async {
    String distance = "N/A";
    DestMetro nearbyMetro = DestMetro.initial();
    emit(state.copyWith(status: DestMetroStatus.loading, isOffline: isOffline));
    if (isOffline == false) {
      nearbyMetro = await destMetroRepository.fetchDestNearestMetro(placeId);
      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      final destLocation =
          Location(nearbyMetro.destLat, nearbyMetro.destLng); // User's location
      List<Map<String, dynamic>> metroStations = [];
      int metroLines = metroData["total_lines"];
      for (var i = 1; i <= metroLines; i++) {
        List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
        lineData.forEach((element) {
          Map<String, dynamic> stationData = element;
          metroStations.add(stationData);
        });
        //metroStations.addAll(lineData);
      }
      final coordinatesToCheck = metroStations;

      final closestLocation =
          findClosestStation(coordinatesToCheck, destLocation);
      //print(
      //    'Closest location is: (${closestLocation["name"]}, ${closestLocation["address"]})');
      List lineKeys = closestLocation["interchange_data"]["lines"];
      List<String> lines = [];
      List<String> startStations = [];
      List<String> endStations = [];
      List<String> colourCodes = [];
      lineKeys.forEach((element) {
        Map<String, dynamic> lineData = metroData["data"][element];
        lines.add(lineData["name"]);
        startStations.add(lineData["stations"][0]["name"]);
        endStations.add(lineData["stations"].last["name"]);
        colourCodes.add(lineData["colour_code"]);
      });
      // final FromMetro nearbyMetro = await nearbyMetroRepository.fetchNearestMetro(
      //     accPos.latitude, accPos.longitude);
      nearbyMetro = DestMetro(
          destName: "",
          destAddress: "",
          businessStatus:
              closestLocation["is_interchange"] == true ? "Yes" : "No",
          destLat: nearbyMetro.destLat,
          destLng: nearbyMetro.destLng,
          nearbyMetroLat: closestLocation["coordinates"]["lat"],
          nearbyMetroLng: closestLocation["coordinates"]["lng"],
          name: closestLocation["name"],
          placeId: closestLocation["place_id"],
          rating: "",
          userRatingsTotal: "",
          vicinity: closestLocation["address"],
          data: "",
          metro: metroData["name"],
          lines: lines,
          colourCodes: colourCodes,
          startStations: startStations,
          endStations: endStations);
      distance = Geolocator.distanceBetween(
              nearbyMetro.nearbyMetroLat,
              nearbyMetro.nearbyMetroLng,
              nearbyMetro.destLat,
              nearbyMetro.destLng)
          .toStringAsFixed(0);
    } else {
      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      int metroLines = metroData["total_lines"];
      Map<String, dynamic> metroStation = {};
      for (var i = 1; i <= metroLines; i++) {
        List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
        lineData.forEach((element) {
          Map<String, dynamic> stationData = element;
          if (stationData["place_id"] == placeId) {
            metroStation = stationData;
          }
        });
        //metroStations.addAll(lineData);
      }
      List lineKeys = metroStation["interchange_data"]["lines"];
      List<String> lines = [];
      List<String> startStations = [];
      List<String> endStations = [];
      List<String> colourCodes = [];
      lineKeys.forEach((element) {
        Map<String, dynamic> lineData = metroData["data"][element];
        lines.add(lineData["name"]);
        startStations.add(lineData["stations"][0]["name"]);
        endStations.add(lineData["stations"].last["name"]);
        colourCodes.add(lineData["colour_code"]);
      });
      nearbyMetro = DestMetro(
          destName: "",
          destAddress: "",
          businessStatus: metroStation["is_interchange"] == true ? "Yes" : "No",
          destLat: metroStation["coordinates"]["lat"],
          destLng: metroStation["coordinates"]["lng"],
          nearbyMetroLat: metroStation["coordinates"]["lat"],
          nearbyMetroLng: metroStation["coordinates"]["lng"],
          name: metroStation["name"],
          placeId: metroStation["place_id"],
          rating: "",
          userRatingsTotal: "",
          vicinity: metroStation["address"],
          data: "",
          metro: metroData["name"],
          lines: lines,
          colourCodes: colourCodes,
          startStations: startStations,
          endStations: endStations);
      distance = "0";
    }
    // String distance = "N/A";
    // bool isLiked = false;
    // DestMetro info = DestMetro.initial();

    // if (isOffline == false) {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    //   Directions? recom = await isar.directions
    //       .where()
    //       .filter()
    //       .toIdEqualTo(placeId)
    //       .sortByTimeDesc()
    //       .findFirst();
    //   if (recom == null) {
    //     info = await destMetroRepository.fetchDestNearestMetro(placeId);
    //   } else {
    //     info = DestMetro.fromJson(recom!.toData.toString());
    //   }

    //   distance = Geolocator.distanceBetween(info.destLat, info.destLng,
    //           info.nearbyMetroLat, info.nearbyMetroLng)
    //       .toStringAsFixed(0);
    //   //Check if destination is liked
    //   User? user = FirebaseAuth.instance.currentUser;
    //   if (user == null) {
    //     //Login Popup
    //   } else {
    //     String userId = user.uid;
    //     //Update if data is there
    //     FirebaseFirestore db = FirebaseFirestore.instance;
    //     String destSearchId = "${userId}_${fromId}_$placeId";
    //     await db
    //         .collection("dest_history")
    //         .doc(destSearchId)
    //         .get()
    //         .then((value) {
    //       Map<String, dynamic>? savedData = value.data();
    //       if (savedData != null) {
    //         DestTapData savedDestData = DestTapData.fromMap(savedData);
    //         if (savedDestData.isLiked == true) {
    //           isLiked = true;
    //         } else {
    //           isLiked = false;
    //         }
    //       }
    //     });
    //   }
    // } else {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    //   Directions? recom = await isar.directions
    //       .where()
    //       .filter()
    //       .toIdEqualTo(placeId)
    //       .sortByTimeDesc()
    //       .findFirst();
    //   info = DestMetro.fromJson(recom!.toData.toString());
    //   distance = Geolocator.distanceBetween(info.destLat, info.destLng,
    //           info.nearbyMetroLat, info.nearbyMetroLng)
    //       .toStringAsFixed(0);
    //   isLiked = false;
    //}
    emit(state.copyWith(
        status: DestMetroStatus.loaded,
        metro: nearbyMetro,
        isOffline: isOffline,
        distance: distance,
        isLiked: false));
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);
}

double distance(Location a, Location b) {
  const R = 6371; // Radius of the earth in km
  final dLat = _toRadians(b.latitude - a.latitude);
  final dLon = _toRadians(b.longitude - a.longitude);
  final lat1 = _toRadians(a.latitude);
  final lat2 = _toRadians(b.latitude);

  final x = sin(dLat / 2) * sin(dLat / 2) +
      sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
  final y = 2 * atan2(sqrt(x), sqrt(1 - x));
  final distanceInKm = R * y; // Distance in km

  return distanceInKm;
}

double _toRadians(double degrees) {
  return degrees * (pi / 180);
}

Map<String, dynamic> findClosestStation(
    List<Map<String, dynamic>> locations, Location userLocation) {
  Map<String, dynamic> closestLocation = {};
  double minDistance = double.infinity;

  for (var i = 0; i < locations.length; i++) {
    final Location stationLoc = Location(
        locations[i]["coordinates"]["lat"], locations[i]["coordinates"]["lng"]);
    final distanceToLocation = distance(userLocation, stationLoc);
    //print(locations[i]);
    if (distanceToLocation < minDistance) {
      closestLocation = locations[i];
      minDistance = distanceToLocation;
      closestLocation["distance"] = minDistance;
    }
  }

  return closestLocation;
}
