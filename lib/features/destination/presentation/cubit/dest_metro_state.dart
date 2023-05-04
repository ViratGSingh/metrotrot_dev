// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dest_metro_cubit.dart';

enum DestMetroStatus { check, initial, loading, loaded, error, offline, updating, updated }

class DestMetroState extends Equatable {
  final DestMetroStatus status;
  final DestMetro metro;
  final String distance;
  bool isOffline;
  bool isLiked;
  DestMetroState(
      {required this.status,
      required this.metro,
      required this.distance,
      required this.isLiked,
      this.isOffline = false});

  @override
  List<Object> get props => [status, metro];

  factory DestMetroState.initial() {
    return DestMetroState(
        status: DestMetroStatus.initial,
        metro: DestMetro.initial(),
        isLiked:false,
        distance: "N/A");
  }
  DestMetroState copyWith(
      {DestMetroStatus? status,
      DestMetro? metro,
      String? distance,
      bool? isLiked,
      bool? isOffline}) {
    return DestMetroState(
        status: status ?? this.status,
        metro: metro ?? this.metro,
        isOffline: isOffline ?? this.isOffline,
        isLiked: isLiked ?? this.isLiked,
        distance: distance ?? this.distance);
  }
}
