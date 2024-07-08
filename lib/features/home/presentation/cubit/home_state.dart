// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus {
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

class HomeState extends Equatable {
  final HomeStatus status;
  final FromMetro fromData;
  final DestMetro toData;
  final User? user;
  final String distance;
  final int selectedValue;
  final List<DestTapData>? destData;
  bool isOffline;
  HomeState(
      {required this.status,
      required this.fromData,
      required this.toData,
      required this.distance,
      required this.selectedValue,
      this.user,
      this.destData,
      this.isOffline = false});

  @override
  List<Object> get props => [status, fromData, toData];

  factory HomeState.initial() {
    return HomeState(
        status: HomeStatus.initial,
        fromData: FromMetro.initial(),
        toData: DestMetro.initial(),
        user: FirebaseAuth.instance.currentUser,
        selectedValue: 1,
        distance: "N/A");
  }
  HomeState copyWith(
      {HomeStatus? status,
      User? user,
      FromMetro? fromData,
      DestMetro? toData,
      String? distance,
      int? selectedValue,
      List<DestTapData>? destData,
      bool? isOffline}) {
    return HomeState(
        status: status ?? this.status,
        fromData: fromData ?? this.fromData,
        toData: toData ?? this.toData,
        isOffline: isOffline ?? this.isOffline,
        user: user ?? this.user,
        destData: destData ?? this.destData,
        selectedValue: selectedValue ?? this.selectedValue,
        distance: distance ?? this.distance);
  }
}
