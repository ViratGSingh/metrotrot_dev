part of 'nearby_cubit.dart';

enum NearbyStatus {
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

class NearbyState extends Equatable {
  final NearbyStatus status;
  final List<Map<String, dynamic>> closestMetros;
  final String locationName;
  final String locationAddress;
  bool isOffline;
  NearbyState(
      {required this.status,
      this.closestMetros = const [],
      this.locationName = "",
      this.locationAddress = "",
      this.isOffline = false});

  @override
  List<Object> get props =>
      [status, closestMetros, locationName, locationAddress, isOffline];

  factory NearbyState.initial() {
    return NearbyState(
        status: NearbyStatus.initial,
        closestMetros: const [],
        locationName: "",
        locationAddress: "",
        isOffline: false);
  }
  NearbyState copyWith(
      {NearbyStatus? status,
      List<Map<String, dynamic>>? closestMetros,
      String? locationName,
      String? locationAddress,
      bool? isOffline}) {
    return NearbyState(
      status: status ?? this.status,
      closestMetros: closestMetros ?? this.closestMetros,
      locationName: locationName ?? this.locationName,
      locationAddress: locationAddress ?? this.locationAddress,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
