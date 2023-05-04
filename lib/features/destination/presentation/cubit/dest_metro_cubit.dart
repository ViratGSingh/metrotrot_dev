// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/destination/presentation/widgets/warnings/main.dart';
import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/login/presentation/pages/login.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorPopup(
              title: "Error!",
              message:
                  "You aren't logged in right now, please make sure you are logged in to save your favourite destinations.",
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
    emit(state.copyWith(status: DestMetroStatus.loading, isOffline: isOffline));
    String distance = "N/A";
    bool isLiked = false;
    DestMetro info = DestMetro.initial();
    if (isOffline == false) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? recom = await isar.directions
          .where()
          .filter()
          .toIdEqualTo(placeId)
          .sortByTimeDesc()
          .findFirst();
      if (recom == null) {
        info = await destMetroRepository.fetchDestNearestMetro(placeId);
      } else {
        info = DestMetro.fromJson(recom!.toData.toString());
      }

      distance = Geolocator.distanceBetween(info.destLat, info.destLng,
              info.nearbyMetroLat, info.nearbyMetroLng)
          .toStringAsFixed(0);
      //Check if destination is liked
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        //Login Popup
      } else {
        String userId = user.uid;
        //Update if data is there
        FirebaseFirestore db = FirebaseFirestore.instance;
        String destSearchId = "${userId}_${fromId}_$placeId";
        await db
            .collection("dest_history")
            .doc(destSearchId)
            .get()
            .then((value) {
          Map<String, dynamic>? savedData = value.data();
          if (savedData != null) {
            DestTapData savedDestData = DestTapData.fromMap(savedData);
            if (savedDestData.isLiked == true) {
              isLiked = true;
            } else {
              isLiked = false;
            }
          }
        });
      }
    } else {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? recom = await isar.directions
          .where()
          .filter()
          .toIdEqualTo(placeId)
          .sortByTimeDesc()
          .findFirst();
      info = DestMetro.fromJson(recom!.toData.toString());
      distance = Geolocator.distanceBetween(info.destLat, info.destLng,
              info.nearbyMetroLat, info.nearbyMetroLng)
          .toStringAsFixed(0);
      isLiked = false;
    }
    emit(
      state.copyWith(
          status: DestMetroStatus.loaded,
          metro: info,
          isOffline: isOffline,
          distance: distance,
          isLiked: isLiked),
    );
  }
}
