import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar/isar.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesState.initial());


  Future<void> unFavSavedFromRecommendation(
      SavedFromRecommendation recommendation) async {
    String placeId = recommendation.placeId??"";
    final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ],
        directory: dir.path
        );
    //Check place id exists in From recommendations
    final favSavedFromRecommendation = await isar.savedFromRecommendations
        .filter()
        .placeIdEqualTo(placeId)
        .findFirst();

    //If exists update
    if (favSavedFromRecommendation != null) {
      await isar.writeTxn(() async {
        favSavedFromRecommendation.isFavourite = false;
        await isar.savedFromRecommendations.put(favSavedFromRecommendation);
      });
    }
  }

  Future<void> unFavSavedToRecommendation(
      SavedToRecommendation recommendation) async {
    String placeId = recommendation.placeId??"";
    SavedToRecommendation? favSavedToRecommendation;

  final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ],
        directory: dir.path
        );
    //Check place id exists in From recommendations
    favSavedToRecommendation = await isar.savedToRecommendations
        .filter()
        .placeIdEqualTo(placeId)
        .findFirst();

    //If exists update
    if (favSavedToRecommendation != null) {
      await isar.writeTxn(() async {
        favSavedToRecommendation?.isFavourite = false;
        await isar.savedToRecommendations.put(favSavedToRecommendation!);
      });
    }
  }


  Future<void> getFavRecommendations() async {
    emit(state.copyWith(pageStatus: FavouritesPlaceStatus.loading));
    List<SavedFromRecommendation> favSavedFromRecommemdations = [];
    List<SavedToRecommendation> favSavedToRecommemdations = [];

    //print(stationSuggestions);

  final dir = await getApplicationDocumentsDirectory();
    Isar isar = Isar.getInstance() ??
        await Isar.open([
          DirectionsSchema,
          SavedFromRecommendationSchema,
          SavedToRecommendationSchema,
          SavedFromMetroSchema,
          SavedDestMetroSchema
        ],
        directory: dir.path
        );

    //Suggested Places
    //Check for saved places

    favSavedFromRecommemdations = await isar.savedFromRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .findAll();

    favSavedToRecommemdations = await isar.savedToRecommendations
        .filter()
        .isFavouriteEqualTo(true)
        .findAll();

    emit(state.copyWith(
        pageStatus: FavouritesPlaceStatus.loaded,
        fromLocations: favSavedFromRecommemdations,
        toLocations: favSavedToRecommemdations));
  }

  late Mixpanel mixpanel;
  Future<void> initMixpanel() async {
    await dotenv.load(fileName: '.env');
    mixpanel = await Mixpanel.init(dotenv.env["MIXPANEL_PROJECT_ID"].toString(),
        trackAutomaticEvents: false);
  }
}
