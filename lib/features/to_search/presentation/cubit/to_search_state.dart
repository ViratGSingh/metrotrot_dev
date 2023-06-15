// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'to_search_cubit.dart';

enum ToSearchPlaceStatus { loading, loaded, error }

enum ToSearchStationStatus { loading, loaded, error }

class ToSearchState extends Equatable {
  final List<ToRecommendation> locations;
  final List<ToRecommendation> stations;
  final ToSearchStationStatus stationStatus;
  final ToSearchPlaceStatus placeStatus;
  const ToSearchState(
      {required this.locations,
      required this.stations,
      this.stationStatus = ToSearchStationStatus.loaded,
      this.placeStatus = ToSearchPlaceStatus.loaded});

  @override
  List<Object> get props => [locations, stationStatus, placeStatus];

  factory ToSearchState.initial() {
    return const ToSearchState(locations: [], stations: []);
  }

  ToSearchState copyWith(
      {List<ToRecommendation>? locations,
      List<ToRecommendation>? stations,
      ToSearchStationStatus? stationStatus,
      ToSearchPlaceStatus? placeStatus}) {
    return ToSearchState(
        locations: locations ?? this.locations,
        stations: stations ?? this.stations,
        stationStatus: stationStatus ?? this.stationStatus,
        placeStatus: placeStatus ?? this.placeStatus
        );
  }
}
