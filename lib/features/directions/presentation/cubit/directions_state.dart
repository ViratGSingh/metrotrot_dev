part of 'directions_cubit.dart';

enum DirectionsStatus { loading, loaded, error }

enum UserPriorityStatus { stops, interchanges, best }

class DirectionsState extends Equatable {
  final MetroRoute routeData;
  final DirectionsStatus status;
  final bool isOffline;
  final UserPriorityStatus priority;
  const DirectionsState({
    required this.routeData,
    required this.status,
    required this.isOffline,
    this.priority = UserPriorityStatus.stops
  });

  @override
  List<Object> get props => [routeData, status];

  factory DirectionsState.initial() {
    return DirectionsState(
        routeData: MetroRoute.initial(),
        status: DirectionsStatus.loaded,
        priority: UserPriorityStatus.best,
        isOffline: false);
  }

  DirectionsState copyWith(
      {MetroRoute? routeData, DirectionsStatus? status, bool? isOffline, UserPriorityStatus? priority}) {
    return DirectionsState(
        routeData: routeData ?? this.routeData,
        status: status ?? this.status,
        priority: priority ?? this.priority,
        isOffline: isOffline ?? this.isOffline);
  }
}
