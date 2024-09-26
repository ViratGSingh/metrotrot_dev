// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'to_search_cubit.dart';

enum ToSearchPlaceStatus { loading, loaded, error }

enum ToSearchStationStatus { loading, loaded, error }

class ToSearchState extends Equatable {
  final List<ToRecommendation> locations;
  final List<ToRecommendation> stations;
  final ToSearchStationStatus stationStatus;
  final ToSearchPlaceStatus placeStatus;
  bool isRewardGranted;
  ToSearchState(
      {required this.locations,
      required this.stations,
      this.isRewardGranted = false,
      this.stationStatus = ToSearchStationStatus.loaded,
      this.placeStatus = ToSearchPlaceStatus.loaded});

  @override
  List<Object> get props => [locations,stations, isRewardGranted,  stationStatus, placeStatus];

  factory ToSearchState.initial() {
    return ToSearchState(locations: const [], stations: const [], isRewardGranted: false);
  }

  ToSearchState copyWith(
      {List<ToRecommendation>? locations,
      List<ToRecommendation>? stations,
      bool? isRewardGranted,
      ToSearchStationStatus? stationStatus,
      ToSearchPlaceStatus? placeStatus}) {
    return ToSearchState(
        locations: locations ?? this.locations,
        stations: stations ?? this.stations,
        isRewardGranted: isRewardGranted ?? this.isRewardGranted,
        stationStatus: stationStatus ?? this.stationStatus,
        placeStatus: placeStatus ?? this.placeStatus
        );
  }
}
