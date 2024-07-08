import 'dart:convert';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:uuid/uuid.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/data/models/dest_tap_data.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/to_search/data/models/recommendation.dart';
import 'package:app/features/to_search/data/repositories/from_search_repository.dart';

part 'to_search_state.dart';

class ToSearchCubit extends Cubit<ToSearchState> {
  final ToSearchRepository toSearchRepository;
  ToSearchCubit({required this.toSearchRepository})
      : super(ToSearchState.initial());

  Future<void> updateDestFavRecommendation(
      ToRecommendation recommendation, bool isFavourite) async {
    String placeId = recommendation.placeId;
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ]);
    //Check place id exists in From recommendations
    final savedRecommendation = await isar.savedToRecommendations
        .filter()
        .placeIdEqualTo(placeId)
        .findFirst();

    //If exists update
    if (savedRecommendation != null) {
      await isar.writeTxn(() async {
        savedRecommendation.isFavourite = isFavourite;
        await isar.savedToRecommendations.put(savedRecommendation);
      });
    }
  }

  Future<List<ToRecommendation>> getSuggestedStations(String location) async {
    //Get Stations
    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    List<Map<String, dynamic>> metroStations = [];
    int metroLines = metroData["total_lines"];
    for (var i = 1; i <= metroLines; i++) {
      List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
      lineData.forEach((element) {
        Map<String, dynamic> stationData = element;
        if (metroStations.contains(stationData) == false) {
          metroStations.add(stationData);
        } else {
          //print(stationData);
        }
      });
      //metroStations.addAll(lineData);
    }

    //Suggested Stations
    final List<ToRecommendation> stationSuggestions = [];
    final String lowercaseQuery = location.toLowerCase();
    for (final station in metroStations) {
      if ((station["name"] + station["address"])
          .toLowerCase()
          .contains(lowercaseQuery)) {
        ToRecommendation stationRecom = ToRecommendation(
            placeId: station["place_id"],
            main: station["name"],
            secondary: station["address"]);
        if (stationSuggestions.contains(stationRecom) == false) {
          stationSuggestions.add(stationRecom);
        }
      }
    }
    return stationSuggestions;
  }

  getSearchRecommendations(
      //String userId, String fromPlaceId,
      String location,
      bool isOffline,
      double lat,
      double lng) async {
    emit(state.copyWith(
        stationStatus: ToSearchStationStatus.loading,
        placeStatus: ToSearchPlaceStatus.loading));
    List<ToRecommendation> predictions = [];
    List<ToRecommendation> stationSuggestions = [];

    stationSuggestions = await getSuggestedStations(location);
    //print(stationSuggestions);
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ]);

    //Suggested Places
    //Check for saved places

    List<ToRecommendation> favSavedPredictions = [];
    List<ToRecommendation> nonFavSavedPredictions = [];
    final savedRecommendations = await isar.savedToRecommendations
        .filter()
        .destContentContains(location, caseSensitive: false)
        .findAll();
    for (SavedToRecommendation savedRecommendation in savedRecommendations) {
      ToRecommendation updSavedRecommendation = ToRecommendation(
          placeId: savedRecommendation.placeId ?? "",
          main: savedRecommendation.main ?? "",
          secondary: savedRecommendation.secondary ?? "",
          isFavourite: savedRecommendation.isFavourite ?? false);
      if (updSavedRecommendation.isFavourite == true) {
        favSavedPredictions.add(updSavedRecommendation);
      } else {
        nonFavSavedPredictions.add(updSavedRecommendation);
      }
    }
    //Add all fav saved recommendations
    predictions.addAll(favSavedPredictions);
    predictions.addAll(nonFavSavedPredictions);
    //Get new places
    if (predictions.isEmpty == true) {
      await toSearchRepository
          .getSearchRecommendations(location)
          .then((value) async {
        predictions = value;
        for (ToRecommendation recommendation in predictions) {
          SavedToRecommendation newPlace = SavedToRecommendation()
            ..placeId = recommendation.placeId
            ..main = recommendation.main
            ..secondary = recommendation.secondary
            ..totaltaps = 1
            ..firstTapDate = DateTime.now()
            ..lastTapDate = DateTime.now()
            ..isFavourite = false
            ..destContent = recommendation.main;
          await isar.writeTxn(() async {
            await isar.savedToRecommendations.put(newPlace);
          });
        }
      });
    }
    emit(state.copyWith(
        stationStatus: ToSearchStationStatus.loaded,
        placeStatus: ToSearchPlaceStatus.loaded,
        locations: predictions.take(5).toList(),
        stations: stationSuggestions.take(5).toList()));
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
    String destSearchId = const Uuid().v4();
    //"${userId}_${fromMetro.placeId}_$toPlaceId";
    db
        .collection("dest_history")
        .doc(destSearchId)
        .set(destData.toMap())
        .onError((e, _) => print("Error writing document: $e"));
    // db.collection("dest_history").doc(destSearchId).get().then((value) {
    //   // if (value.exists) {
    //   //   //Update User Info
    //   //   Map<String, dynamic>? oldData = value.data();
    //   //   if (oldData != null) {
    //   //     DestTapData oldDestData = DestTapData.fromMap(oldData);
    //   //     destData.totalTaps = oldDestData.totalTaps + 1;
    //   //     destData.firstTappedAt = oldDestData.firstTappedAt;
    //   //     destData.isLiked = oldDestData.isLiked;
    //   //   }
    //   //   destData.lastTappedAt = DateTime.now();
    //   //   db
    //   //       .collection("dest_history")
    //   //       .doc(destSearchId)
    //   //       .update(destData.toMap())
    //   //       .onError((e, _) => print("Error writing document: $e"));
    //   // }
    //    //else {
    //     //Set First Time Info
    //     db
    //         .collection("dest_history")
    //         .doc(destSearchId)
    //         .set(destData.toMap())
    //         .onError((e, _) => print("Error writing document: $e"));
    //   //}
    // });
  }
}
