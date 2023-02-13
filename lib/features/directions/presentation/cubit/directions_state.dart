part of 'directions_cubit.dart';

enum DirectionsStatus { loading, loaded, error }

class DirectionsState extends Equatable {
  final MetroRoute routeData;
  final DirectionsStatus status;
  final bool isOffline;
  const DirectionsState({
    required this.routeData,
    required this.status,
    required this.isOffline,
  });

  @override
  List<Object> get props => [routeData, status];

  factory DirectionsState.initial() {
    return DirectionsState(
        routeData: MetroRoute.initial(),
        status: DirectionsStatus.loaded,
        isOffline: false);
  }

  DirectionsState copyWith(
      {MetroRoute? routeData, DirectionsStatus? status, bool? isOffline}) {
    return DirectionsState(
        routeData: routeData ?? this.routeData,
        status: status ?? this.status,
        isOffline: isOffline ?? this.isOffline);
  }
}
