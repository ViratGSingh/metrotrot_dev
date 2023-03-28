// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'nearby_metro_cubit.dart';

enum NearbyMetroStatus {
  check,
  initial,
  loading,
  loaded,
  locDenied,
  locPermDenied,
  error,
  offline
}

class NearbyMetroState extends Equatable {
  final NearbyMetroStatus status;
  final FromMetro metro;
  final User? user;
  final String distance;
  bool isOffline;
  NearbyMetroState(
      {required this.status,
      required this.metro,
      required this.distance,
      this.user,
      this.isOffline = false});

  @override
  List<Object> get props => [status, metro];

  factory NearbyMetroState.initial() {
    return NearbyMetroState(
        status: NearbyMetroStatus.initial,
        metro: FromMetro.initial(),
        user: FirebaseAuth.instance.currentUser,
        distance: "N/A");
  }
  NearbyMetroState copyWith(
      {NearbyMetroStatus? status,
      User? user,
      FromMetro? metro,
      String? distance,
      bool? isOffline}) {
    return NearbyMetroState(
        status: status ?? this.status,
        metro: metro ?? this.metro,
        isOffline: isOffline ?? this.isOffline,
        user:user??this.user,
        distance: distance ?? this.distance);
  }
}
