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
  offline,
  suggestLoading
}

class NearbyMetroState extends Equatable {
  final NearbyMetroStatus status;
  final FromMetro metro;
  final User? user;
  final String distance;
  final int selectedValue;
  final List<DestTapData>? destData;
  bool isOffline;
  NearbyMetroState(
      {required this.status,
      required this.metro,
      required this.distance,
      required this.selectedValue,
      this.user,
      this.destData,
      this.isOffline = false});

  @override
  List<Object> get props => [status, metro];

  factory NearbyMetroState.initial() {
    return NearbyMetroState(
        status: NearbyMetroStatus.initial,
        metro: FromMetro.initial(),
        user: FirebaseAuth.instance.currentUser,
        selectedValue: 1,
        distance: "N/A");
  }
  NearbyMetroState copyWith(
      {NearbyMetroStatus? status,
      User? user,
      FromMetro? metro,
      String? distance,
      int? selectedValue,
      List<DestTapData>? destData,
      bool? isOffline}) {
    return NearbyMetroState(
        status: status ?? this.status,
        metro: metro ?? this.metro,
        isOffline: isOffline ?? this.isOffline,
        user:user??this.user,
        destData: destData??this.destData,
        selectedValue: selectedValue??this.selectedValue,
        distance: distance ?? this.distance);
  }
}
