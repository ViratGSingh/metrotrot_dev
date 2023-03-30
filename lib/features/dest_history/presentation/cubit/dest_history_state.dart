part of 'dest_history_cubit.dart';
enum DestHistoryStatus { check, initial, loading, loaded, error, offline, update }

class DestHistoryState extends Equatable {
  final DestHistoryStatus status;
  final FromMetro fromMetro;
  final List<DestTapData> destData;
  bool isOffline;
  DestHistoryState(
      {
      required this.destData,
      required this.status,
      required this.fromMetro,
      this.isOffline = false});

  @override
  List<Object> get props => [fromMetro, isOffline, destData];

  factory DestHistoryState.initial() {
    return DestHistoryState(
        status: DestHistoryStatus.initial,
        fromMetro: FromMetro.initial(),
        destData: const []
        );
  }
  DestHistoryState copyWith(
      {DestHistoryStatus? status,
      FromMetro? fromMetro,
      List<DestTapData>? destData,
      bool? isOffline}) {
    return DestHistoryState(
        status: status ?? this.status,
        destData: destData ?? this.destData,
        fromMetro: fromMetro ?? this.fromMetro,
        isOffline: isOffline ?? this.isOffline,);
  }
}