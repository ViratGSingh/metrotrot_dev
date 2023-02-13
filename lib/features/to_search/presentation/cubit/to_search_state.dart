// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'to_search_cubit.dart';

enum ToSearchStatus { loading, loaded, error }

class ToSearchState extends Equatable {
  final List<ToRecommendation> locations;
  final ToSearchStatus status;
  const ToSearchState(
      {required this.locations, this.status = ToSearchStatus.loaded});

  @override
  List<Object> get props => [locations, status];

  factory ToSearchState.initial() {
    return const ToSearchState(locations: []);
  }

  ToSearchState copyWith(
      {List<ToRecommendation>? locations, ToSearchStatus? status}) {
    return ToSearchState(
        locations: locations ?? this.locations, status: status ?? this.status);
  }
}
