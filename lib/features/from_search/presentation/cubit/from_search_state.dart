// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'from_search_cubit.dart';

enum FromSearchPlaceStatus { loading, loaded, error }

enum FromSearchStationStatus { loading, loaded, error }

class FromSearchState extends Equatable {
  final List<FromRecommendation> locations;
  final List<FromRecommendation> stations;
  final FromSearchStationStatus stationStatus;
  final FromSearchPlaceStatus placeStatus;
  const FromSearchState(
      {required this.locations,
      required this.stations,
      this.stationStatus = FromSearchStationStatus.loaded,
      this.placeStatus = FromSearchPlaceStatus.loaded});

  @override
  List<Object> get props => [locations, stationStatus, placeStatus];

  factory FromSearchState.initial() {
    return const FromSearchState(locations: [], stations: []);
  }

  FromSearchState copyWith(
      {List<FromRecommendation>? locations,
      List<FromRecommendation>? stations,
      FromSearchStationStatus? stationStatus,
      FromSearchPlaceStatus? placeStatus}) {
    return FromSearchState(
        locations: locations ?? this.locations,
        stations: stations ?? this.stations,
        stationStatus: stationStatus ?? this.stationStatus,
        placeStatus: placeStatus ?? this.placeStatus);
  }
}
