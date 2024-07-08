import 'dart:convert';

import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:app/features/from_search/data/models/from_recommendation.dart';
import 'package:app/features/from_search/data/repositories/from_search_repository.dart';
import 'package:app/features/home/data/models/directions.dart';

part 'from_search_state.dart';

class FromSearchCubit extends Cubit<FromSearchState> {
  final FromSearchRepository fromSearchRepository;
  FromSearchCubit({required this.fromSearchRepository})
      : super(FromSearchState.initial());

  Future<List<FromRecommendation>> getSuggestedStations(String location) async {
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
    final List<FromRecommendation> stationSuggestions = [];
    final String lowercaseQuery = location.toLowerCase();
    for (final station in metroStations) {
      FromRecommendation stationRecom = FromRecommendation(
          placeId: station["place_id"],
          main: station["name"],
          secondary: station["address"]);
      if ((station["name"] + station["address"])
          .toLowerCase()
          .contains(lowercaseQuery)) {
        if (stationSuggestions.contains(stationRecom) == false) {
          stationSuggestions.add(stationRecom);
        }
      }
    }
    return stationSuggestions;
  }

  Future<void> updateSavedFromRecommendation(
      FromRecommendation recommendation, bool isFavourite) async {
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
    final savedRecommendation = await isar.savedFromRecommendations
        .filter()
        .placeIdEqualTo(placeId)
        .findFirst();

    //If exists update
    if (savedRecommendation != null) {
      await isar.writeTxn(() async {
        savedRecommendation.isFavourite = isFavourite;
        await isar.savedFromRecommendations.put(savedRecommendation);
      });
    }
  }

  getSearchRecommendations(String location) async {
    emit(state.copyWith(
        stationStatus: FromSearchStationStatus.loading,
        placeStatus: FromSearchPlaceStatus.loading));
    List<FromRecommendation> predictions = [];
    List<FromRecommendation> stationSuggestions = [];

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

    List<FromRecommendation> favSavedPredictions = [];
    List<FromRecommendation> nonFavSavedPredictions = [];
    final savedRecommendations = await isar.savedFromRecommendations
        .filter()
        .fromContentContains(location, caseSensitive: false)
        .findAll();
    for (SavedFromRecommendation savedRecommendation in savedRecommendations) {
      FromRecommendation updSavedRecommendation = FromRecommendation(
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
      await fromSearchRepository
          .getSearchRecommendations(location)
          .then((value) async {
        predictions = value;
        for (FromRecommendation recommendation in predictions) {
          SavedFromRecommendation newPlace = SavedFromRecommendation()
            ..placeId = recommendation.placeId
            ..main = recommendation.main
            ..secondary = recommendation.secondary
            ..totaltaps = 1
            ..firstTapDate = DateTime.now()
            ..lastTapDate = DateTime.now()
            ..isFavourite = false
            ..fromContent = recommendation.main;
          await isar.writeTxn(() async {
            await isar.savedFromRecommendations.put(newPlace);
          });
        }
      });
    }
    emit(state.copyWith(
        stationStatus: FromSearchStationStatus.loaded,
        placeStatus: FromSearchPlaceStatus.loaded,
        locations: predictions.take(5).toList(),
        stations: stationSuggestions.take(5).toList()));
  }
}
