// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/destination/presentation/widgets/errors/main.dart';
import 'package:app/features/login/presentation/pages/login.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  changeTab(int tabValue, bool isOffline, BuildContext context) async {

    int newSelectedValue = state.selectedValue;
    List<DestTapData> destData = [];
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (tabValue == 1) {
        newSelectedValue = tabValue;
      } else {
        newSelectedValue = state.selectedValue;
        //Login Popup
        String tabName = "";
        if(tabValue==2){
          tabName="recent";
        }else if(tabValue==3){
          tabName="liked";
        }else if(tabValue==4){
          tabName="suggested";
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorPopup(
              title: "Error!",
              message:
                  "You aren't logged in right now, please make sure you are logged in to see your $tabName routes.",
              action: "To Login",
              actionFunc: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              },
            );
          },
        );
      }
    } else {
      newSelectedValue = tabValue;
    }
    emit(
      state.copyWith(
          status: NearbyMetroStatus.suggestLoading,
          selectedValue: newSelectedValue,
          destData: destData,
          isOffline: isOffline),
    );

    if (user != null) {
      
      newSelectedValue = tabValue;
      //Recent Data
      print(newSelectedValue);
      if (newSelectedValue == 2) {
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db
            .collection("dest_history")
            .where("user_id", isEqualTo: user.uid)
            .orderBy("last_tapped_at", descending: true)
            .limit(5)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            destData.add(
              DestTapData.fromMap(
                element.data(),
              ),
            );
          });
        });
      }else if (newSelectedValue == 3) {
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db
            .collection("dest_history")
            .where("user_id", isEqualTo: user.uid)
            .where("is_liked", isEqualTo: true)
            .orderBy("last_tapped_at")
            .limit(5)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            destData.add(
              DestTapData.fromMap(
                element.data(),
              ),
            );
          });
        });
      }else if (newSelectedValue == 4) {
        FirebaseFirestore db = FirebaseFirestore.instance;
        await db
            .collection("dest_history")
            .where("user_id", isEqualTo: user.uid)
            .orderBy("total_taps", descending: true)
            .orderBy("last_tapped_at")
            .limit(5)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            destData.add(
              DestTapData.fromMap(
                element.data(),
              ),
            );
          });
        });
      }
      print(destData);
    }
    print(newSelectedValue);
    emit(
      state.copyWith(
          status: NearbyMetroStatus.loaded,
          selectedValue: newSelectedValue,
          destData: destData,
          isOffline: isOffline),
    );
  }

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

  getOfflineFromStation() async {
    User? user = FirebaseAuth.instance.currentUser;

    emit(state.copyWith(
        user: user, status: NearbyMetroStatus.loading, isOffline: true));
    var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    List<Directions> fromSearchRecoms = await isar.directions
        .filter()
        .timeLessThan(DateTime.now())
        .sortByTimeDesc()
        .distinctByFromId()
        .limit(5)
        .findAll();

    if (fromSearchRecoms.isEmpty == false) {
      Directions offDir = fromSearchRecoms[0];
      FromMetro nearbyMetro = FromMetro.fromJson(offDir.fromData.toString());
      // var locAccuracy = await Geolocator.getLocationAccuracy();

      // Position accPos;
      // if (locAccuracy == LocationAccuracyStatus.precise) {
      //   accPos = await Geolocator.getCurrentPosition();
      // } else {
      //   accPos = await Geolocator.getCurrentPosition(
      //       desiredAccuracy: LocationAccuracy.low);
      // }
      // var distance = Geolocator.distanceBetween(
      //     nearbyMetro.lat, nearbyMetro.lng, accPos.latitude, accPos.longitude);

      emit(state.copyWith(
          user: user,
          status: NearbyMetroStatus.loaded,
          metro: nearbyMetro,
          distance: "N/A",
          isOffline: true));
    } else {
      emit(state.copyWith(
          user: user,
          status: NearbyMetroStatus.locPermDenied,
          isOffline: true));
    }
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
      isOffline == false
          ? await getNearbyMetro()
          : await getOfflineFromStation();
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
    final FromMetro nearbyMetro = await nearbyMetroRepository.fetchNearestMetro(
        accPos.latitude, accPos.longitude);
    var distance = Geolocator.distanceBetween(
        nearbyMetro.lat, nearbyMetro.lng, accPos.latitude, accPos.longitude);

    emit(
      state.copyWith(
        status: NearbyMetroStatus.loaded,
        user: user,
        metro: nearbyMetro,
        isOffline: false,
        distance: distance.toStringAsFixed(0),
      ),
    );
  }

  Future getFromNearbyMetro(String placeId, bool isOffline) async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(state.copyWith(
        user: user, status: NearbyMetroStatus.loading, isOffline: isOffline));
    FromMetro nearbyMetro = FromMetro.initial();
    String distance = "N/A";
    if (isOffline == true) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? fromSearchRecoms = await isar.directions
          .filter()
          .timeLessThan(DateTime.now())
          .fromIdEqualTo(placeId)
          .sortByTimeDesc()
          .distinctByFromId()
          .findFirst();
      nearbyMetro = FromMetro.fromJson(fromSearchRecoms!.fromData.toString());
    } else {
      var status = await Permission.location.request();

      nearbyMetro = await nearbyMetroRepository.fetchFromNearestMetro(placeId);

      if (status.isGranted == true) {
        var locAccuracy = await Geolocator.getLocationAccuracy();
        Position accPos;
        if (locAccuracy == LocationAccuracyStatus.precise) {
          accPos = await Geolocator.getCurrentPosition();
        } else {
          accPos = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
        }
        distance = Geolocator.distanceBetween(nearbyMetro.lat, nearbyMetro.lng,
                accPos.latitude, accPos.longitude)
            .toStringAsFixed(0);
      }
    }
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
