// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';
import 'package:app/features/destination/presentation/widgets/errors/main.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/home/data/repositories/nearby_metro_repository.dart';
part 'nearby_metro_state.dart';

class NearbyMetroCubit extends Cubit<NearbyMetroState> {
  final NearbyMetroRepository nearbyMetroRepository;
  NearbyMetroCubit({required this.nearbyMetroRepository})
      : super(NearbyMetroState.initial());

  //Change Tab
  // changeTab(int tabValue, bool isOffline, BuildContext context) async {
  //   int newSelectedValue = state.selectedValue;
  //   List<DestTapData> destData = [];
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     if (tabValue == 1) {
  //       newSelectedValue = tabValue;
  //     } else {
  //       newSelectedValue = state.selectedValue;
  //       //Login Popup
  //       String tabName = "";
  //       if (tabValue == 2) {
  //         tabName = "recent";
  //       } else if (tabValue == 3) {
  //         tabName = "liked";
  //       } else if (tabValue == 4) {
  //         tabName = "suggested";
  //       }
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return ErrorPopup(
  //             title: "Error!",
  //             message:
  //                 "You aren't logged in right now, please make sure you are logged in to see your $tabName routes.",
  //             action: "To Login",
  //             actionFunc: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute<void>(
  //                   builder: (BuildContext context) => const LoginPage(),
  //                 ),
  //               );
  //             },
  //           );
  //         },
  //       );
  //     }
  //   } else {
  //     newSelectedValue = tabValue;
  //   }
  //   emit(
  //     state.copyWith(
  //         status: NearbyMetroStatus.suggestLoading,
  //         selectedValue: newSelectedValue,
  //         destData: destData,
  //         isOffline: isOffline),
  //   );

  //   if (user != null) {
  //     newSelectedValue = tabValue;
  //     //Recent Data
  //     print(newSelectedValue);
  //     if (newSelectedValue == 2) {
  //       FirebaseFirestore db = FirebaseFirestore.instance;
  //       await db
  //           .collection("dest_history")
  //           .where("user_id", isEqualTo: user.uid)
  //           .orderBy("last_tapped_at", descending: true)
  //           .limit(5)
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           destData.add(
  //             DestTapData.fromMap(
  //               element.data(),
  //             ),
  //           );
  //         });
  //       });
  //     } else if (newSelectedValue == 3) {
  //       FirebaseFirestore db = FirebaseFirestore.instance;
  //       await db
  //           .collection("dest_history")
  //           .where("user_id", isEqualTo: user.uid)
  //           .where("is_liked", isEqualTo: true)
  //           .orderBy("last_tapped_at")
  //           .limit(5)
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           destData.add(
  //             DestTapData.fromMap(
  //               element.data(),
  //             ),
  //           );
  //         });
  //       });
  //     } else if (newSelectedValue == 4) {
  //       FirebaseFirestore db = FirebaseFirestore.instance;
  //       await db
  //           .collection("dest_history")
  //           .where("user_id", isEqualTo: user.uid)
  //           .orderBy("total_taps", descending: true)
  //           .orderBy("last_tapped_at")
  //           .limit(5)
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           destData.add(
  //             DestTapData.fromMap(
  //               element.data(),
  //             ),
  //           );
  //         });
  //       });
  //     }
  //     print(destData);
  //   }
  //   print(newSelectedValue);
  //   emit(
  //     state.copyWith(
  //         status: NearbyMetroStatus.loaded,
  //         selectedValue: newSelectedValue,
  //         destData: destData,
  //         isOffline: isOffline),
  //   );
  // }

  saveDestinationInfo(
      String userId,
      bool isGuest,
      FromMetro fromMetro,
      String toPlaceId,
      String toMain,
      String toSecondary,
      double userLat,
      double userLng) async {
    DestTapData destData = DestTapData(
        userId: userId,
        isGuest: isGuest,
        fromMetroBusinessStatus: fromMetro.businessStatus,
        fromMetroLat: fromMetro.lat,
        fromMetroLng: fromMetro.lng,
        fromMetroName: fromMetro.name,
        fromMetroPlaceId: fromMetro.placeId,
        fromMetroRating: fromMetro.rating,
        fromMetroRatedUsers: fromMetro.userRatingsTotal,
        fromMetroAddress: fromMetro.vicinity,
        userLat: userLat,
        userLng: userLng,
        toPlaceId: toPlaceId,
        toName: toMain,
        toAddress: toSecondary,
        totalTaps: 1,
        firstTappedAt: DateTime.now(),
        lastTappedAt: DateTime.now());
    FirebaseFirestore db = FirebaseFirestore.instance;
    String destSearchId = "${userId}_${fromMetro.placeId}_$toPlaceId";
    db.collection("dest_history").doc(destSearchId).get().then((value) {
      if (value.exists) {
        //Update User Info
        Map<String, dynamic>? oldData = value.data();
        if (oldData != null) {
          DestTapData oldDestData = DestTapData.fromMap(oldData);
          destData.totalTaps = oldDestData.totalTaps + 1;
          destData.firstTappedAt = oldDestData.firstTappedAt;
          destData.isLiked = oldDestData.isLiked;
        }
        destData.lastTappedAt = DateTime.now();
        db
            .collection("dest_history")
            .doc(destSearchId)
            .update(destData.toMap())
            .onError((e, _) => print("Error writing document: $e"));
      } else {
        //Set First Time Info
        db
            .collection("dest_history")
            .doc(destSearchId)
            .set(destData.toMap())
            .onError((e, _) => print("Error writing document: $e"));
      }
    });
  }

  
  checkUserLocation(isOffline) async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(state.copyWith(
        user: user, status: NearbyMetroStatus.loading, isOffline: isOffline));
    var status = await Permission.location.request();

    if (status.isPermanentlyDenied) {
      emit(state.copyWith(
          user: user,
          status: NearbyMetroStatus.locPermDenied,
          isOffline: isOffline));
    }
    if (status.isDenied) {
      emit(state.copyWith(
          user: user,
          status: NearbyMetroStatus.locDenied,
          isOffline: isOffline));
    }

    if (status.isGranted || status.isLimited) {
      await getNearbyMetro();
    }
  }

  Future getNearbyMetro() async {
    User? user = FirebaseAuth.instance.currentUser;
    var locAccuracy = await Geolocator.getLocationAccuracy();
    Position accPos;
    if (locAccuracy == LocationAccuracyStatus.precise) {
      accPos = await Geolocator.getCurrentPosition();
    } else {
      accPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    }
    emit(state.copyWith(
        user: user, status: NearbyMetroStatus.loading, isOffline: false));
    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    int metroLines = metroData["total_lines"];
    //print(metroLines);
    final userLocation =
        Location(accPos.latitude, accPos.longitude); // User's location
    List<Map<String, dynamic>> metroStations = [];
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
        findClosestStation(coordinatesToCheck, userLocation);
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
    // var distance = Geolocator.distanceBetween(
    //     nearbyMetro.lat, nearbyMetro.lng, accPos.latitude, accPos.longitude);
    final FromMetro nearbyMetro = FromMetro(
        businessStatus:
            closestLocation["is_interchange"] == true ? "Yes" : "No",
        lat: closestLocation["coordinates"]["lat"],
        lng: closestLocation["coordinates"]["lng"],
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

    emit(
      state.copyWith(
        status: NearbyMetroStatus.loaded,
        user: user,
        metro: nearbyMetro,
        isOffline: false,
        distance: (closestLocation["distance"] * 1000).toStringAsFixed(0),
      ),
    );
  }

  Future getFromNearbyMetro(String placeId, bool isOffline) async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(state.copyWith(
        user: user, status: NearbyMetroStatus.loading, isOffline: isOffline));
    //FromMetro nearbyMetro = FromMetro.initial();
    String distance = "N/A";
    FromMetro nearbyMetro = FromMetro.initial();
    if (isOffline == false) {
      Map<String, dynamic> coordinates =
          await nearbyMetroRepository.fetchFromNearestMetro(placeId);
      print(coordinates);
      double lat = coordinates["lat"];
      double lng = coordinates["lng"];
      final metroResp =
          await rootBundle.loadString('assets/data/delhi_ncr.json');
      final metroData = json.decode(metroResp);
      int metroLines = metroData["total_lines"];
      //print(metroLines);
      final userLocation = Location(lat, lng); // User's location
      List<Map<String, dynamic>> metroStations = [];
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
          findClosestStation(coordinatesToCheck, userLocation);
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
      nearbyMetro = FromMetro(
          businessStatus:
              closestLocation["is_interchange"] == true ? "Yes" : "No",
          lat: closestLocation["coordinates"]["lat"],
          lng: closestLocation["coordinates"]["lng"],
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
           nearbyMetro.lat, nearbyMetro.lng, lat, lng).toStringAsFixed(0);
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
      nearbyMetro = FromMetro(
          businessStatus: metroStation["is_interchange"] == true ? "Yes" : "No",
          lat: metroStation["coordinates"]["lat"],
          lng: metroStation["coordinates"]["lng"],
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

    // if (isOffline == true) {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    //   Directions? fromSearchRecoms = await isar.directions
    //       .filter()
    //       .timeLessThan(DateTime.now())
    //       .fromIdEqualTo(placeId)
    //       .sortByTimeDesc()
    //       .distinctByFromId()
    //       .findFirst();
    //   nearbyMetro = FromMetro.fromJson(fromSearchRecoms!.fromData.toString());
    // } else {
    //   var status = await Permission.location.request();

    //   nearbyMetro = await nearbyMetroRepository.fetchFromNearestMetro(placeId);

    //   if (status.isGranted == true) {
    //     var locAccuracy = await Geolocator.getLocationAccuracy();
    //     Position accPos;
    //     if (locAccuracy == LocationAccuracyStatus.precise) {
    //       accPos = await Geolocator.getCurrentPosition();
    //     } else {
    //       accPos = await Geolocator.getCurrentPosition(
    //           desiredAccuracy: LocationAccuracy.low);
    //     }
    //     distance = Geolocator.distanceBetween(nearbyMetro.lat, nearbyMetro.lng,
    //             accPos.latitude, accPos.longitude)
    //         .toStringAsFixed(0);
    //   }
    // }
    emit(
      state.copyWith(
        user: user,
        status: NearbyMetroStatus.loaded,
        metro: nearbyMetro,
        isOffline: isOffline,
        distance: distance,
      ),
    );
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
