part of 'dest_history_cubit.dart';
enum DestHistoryStatus { check, initial, loading, loaded, error, offline }

class DestHistoryState extends Equatable {
  final DestHistoryStatus status;
  final FromMetro fromMetro;
  bool isOffline;
  DestHistoryState(
      {
      required this.status,
      required this.fromMetro,
      this.isOffline = false});

  @override
  List<Object> get props => [fromMetro, isOffline];

  factory DestHistoryState.initial() {
    return DestHistoryState(
        status: DestHistoryStatus.initial,
        fromMetro: FromMetro.initial()
        );
  }
  DestHistoryState copyWith(
      {DestHistoryStatus? status,
      FromMetro? fromMetro,
      bool? isOffline}) {
    return DestHistoryState(
        status: status ?? this.status,
        fromMetro: fromMetro ?? this.fromMetro,
        isOffline: isOffline ?? this.isOffline,);
  }
}