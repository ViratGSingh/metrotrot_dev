part of 'favourites_cubit.dart';

enum FavouritesPlaceStatus { loading, loaded, error }


class FavouritesState extends Equatable {
  final List<SavedFromRecommendation> fromLocations;
  final List<SavedToRecommendation> toLocations;
  final FavouritesPlaceStatus pageStatus;
  const FavouritesState(
      {required this.fromLocations,
      required this.toLocations,
      this.pageStatus = FavouritesPlaceStatus.loaded});

  @override
  List<Object> get props => [fromLocations, toLocations, pageStatus];

  factory FavouritesState.initial() {
    return const FavouritesState(fromLocations: [], toLocations: [], pageStatus:FavouritesPlaceStatus.loaded);
  }

  FavouritesState copyWith(
      {List<SavedFromRecommendation>? fromLocations,
      List<SavedToRecommendation>? toLocations,
      FavouritesPlaceStatus? pageStatus}) {
    return FavouritesState(
        fromLocations: fromLocations ?? this.fromLocations,
        toLocations: toLocations ?? this.toLocations,
        pageStatus: pageStatus ?? this.pageStatus);
  }
}
