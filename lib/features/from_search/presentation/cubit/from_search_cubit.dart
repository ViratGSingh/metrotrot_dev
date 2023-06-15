import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:app/features/from_search/data/models/recommendation.dart';
import 'package:app/features/from_search/data/repositories/from_search_repository.dart';
import 'package:app/features/home/data/models/directions.dart';

part 'from_search_state.dart';

class FromSearchCubit extends Cubit<FromSearchState> {
  final FromSearchRepository fromSearchRepository;
  FromSearchCubit({required this.fromSearchRepository})
      : super(FromSearchState.initial());


  Future<List<FromRecommendation>> getSuggestedStations(String location)async{
    //Get Stations
    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    List<Map<String, dynamic>> metroStations = [];
    int metroLines= metroData["total_lines"];
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
      if ((station["name"]+station["address"]).toLowerCase().contains(lowercaseQuery)) {
        if (stationSuggestions.contains(stationRecom) == false) {
        stationSuggestions.add(stationRecom);
      }
    }
    }
    return stationSuggestions;
    
  }
  getSearchRecommendations(String location, bool isOffline) async {
    emit(state.copyWith(stationStatus: FromSearchStationStatus.loading,placeStatus: FromSearchPlaceStatus.loading));
    List<FromRecommendation> predictions = [];
    List<FromRecommendation> stationSuggestions = [];

    stationSuggestions = await getSuggestedStations(location); 
    //print(stationSuggestions);

    fromSearchRepository.getSearchRecommendations(location).then((value) {
      predictions = value;
      //print(predictions);
      emit(state.copyWith(
        stationStatus: FromSearchStationStatus.loaded,
        placeStatus: FromSearchPlaceStatus.loaded,
        locations: predictions.take(5).toList(),
        stations: stationSuggestions.take(5).toList()));
  



    });

    // if (isOffline == false) {
    //   if (location.isEmpty == true) {
    //     var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
    //     var recoms = await isar.directions
    //         .filter()
    //         .timeLessThan(DateTime.now())
    //         .sortByTimeDesc()
    //         .distinctByFromId()
    //         .limit(5)
    //         .findAll();
    //     recoms.forEach((recom) {
    //       predictions.add(
    //         FromRecommendation.fromJson(
    //           recom.fromData.toString(),
    //         ),
    //       );
    //     });
    //   } else {
    //     predictions =
    //         await fromSearchRepository.getSearchRecommendations(location);
    //   }
    // } else {
    //   var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
    //   if (location.isEmpty == false) {
    //     var recoms = await isar.directions
    //         .filter()
    //         .timeLessThan(DateTime.now())
    //         .fromContentWordsElementStartsWith(location)
    //         .sortByTimeDesc()
    //         .distinctByFromId()
    //         .limit(5)
    //         .findAll();
    //     recoms.forEach((recom) {
    //       predictions.add(
    //         FromRecommendation.fromJson(
    //           recom.fromData.toString(),
    //         ),
    //       );
    //     });
    //   } else {
    //     var recoms = await isar.directions
    //         .filter()
    //         .timeLessThan(DateTime.now())
    //         .sortByTimeDesc()
    //         .distinctByFromId()
    //         .limit(5)
    //         .findAll();
    //     recoms.forEach((recom) {
    //       predictions.add(
    //         FromRecommendation.fromJson(
    //           recom.fromData.toString(),
    //         ),
    //       );
    //     });
    //   }
    // }
    emit(state.copyWith(
        stationStatus: FromSearchStationStatus.loaded,
        placeStatus: FromSearchPlaceStatus.loading,
        //locations: predictions.take(5).toList(),
        stations: stationSuggestions.take(5).toList()));
  }
}
