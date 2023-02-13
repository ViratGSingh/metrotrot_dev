// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dest_metro_cubit.dart';

enum DestMetroStatus { check, initial, loading, loaded, error, offline }

class DestMetroState extends Equatable {
  final DestMetroStatus status;
  final DestMetro metro;
  final String distance;
  bool isOffline;
  DestMetroState(
      {required this.status,
      required this.metro,
      required this.distance,
      this.isOffline = false});

  @override
  List<Object> get props => [status, metro];

  factory DestMetroState.initial() {
    return DestMetroState(
        status: DestMetroStatus.initial,
        metro: DestMetro.initial(),
        distance: "N/A");
  }
  DestMetroState copyWith(
      {DestMetroStatus? status,
      DestMetro? metro,
      String? distance,
      bool? isOffline}) {
    return DestMetroState(
        status: status ?? this.status,
        metro: metro ?? this.metro,
        isOffline: isOffline ?? this.isOffline,
        distance: distance ?? this.distance);
  }
}
