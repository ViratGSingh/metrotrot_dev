// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'from_search_cubit.dart';

enum FromSearchPlaceStatus { loading, loaded, error }

enum FromSearchStationStatus { loading, loaded, error }

class FromSearchState extends Equatable {
  final List<FromRecommendation> locations;
  final List<FromRecommendation> stations;
  final FromSearchStationStatus stationStatus;
  final FromSearchPlaceStatus placeStatus;
  bool isRewardGranted;
  FromSearchState(
      {required this.locations,
      required this.stations,
      this.isRewardGranted = false,
      this.stationStatus = FromSearchStationStatus.loaded,
      this.placeStatus = FromSearchPlaceStatus.loaded});

  @override
  List<Object> get props => [locations, stations, isRewardGranted,  stationStatus, placeStatus];

  factory FromSearchState.initial() {
    return FromSearchState(locations: [], stations: [], isRewardGranted: false);
  }

  FromSearchState copyWith(
      {List<FromRecommendation>? locations,
      List<FromRecommendation>? stations,
      FromSearchStationStatus? stationStatus,
      bool? isRewardGranted,
      FromSearchPlaceStatus? placeStatus}) {
    return FromSearchState(
        locations: locations ?? this.locations,
        stations: stations ?? this.stations,
        isRewardGranted:  isRewardGranted ?? this.isRewardGranted,
        stationStatus: stationStatus ?? this.stationStatus,
        placeStatus: placeStatus ?? this.placeStatus);
  }
}
