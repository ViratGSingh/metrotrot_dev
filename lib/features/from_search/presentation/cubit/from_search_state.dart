// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'from_search_cubit.dart';

enum FromSearchStatus { loading, loaded, error }

class FromSearchState extends Equatable {
  final List<FromRecommendation> locations;
  final FromSearchStatus status;
  const FromSearchState(
      {required this.locations, this.status = FromSearchStatus.loaded});

  @override
  List<Object> get props => [locations, status];

  factory FromSearchState.initial() {
    return const FromSearchState(locations: []);
  }

  FromSearchState copyWith(
      {List<FromRecommendation>? locations, FromSearchStatus? status}) {
    return FromSearchState(
        locations: locations ?? this.locations, status: status ?? this.status);
  }
}
