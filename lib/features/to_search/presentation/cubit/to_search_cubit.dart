import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/to_search/data/models/recommendation.dart';
import 'package:app/features/to_search/data/repositories/from_search_repository.dart';

part 'to_search_state.dart';

class ToSearchCubit extends Cubit<ToSearchState> {
  final ToSearchRepository toSearchRepository;
  ToSearchCubit({required this.toSearchRepository})
      : super(ToSearchState.initial());

  getSearchRecommendations(
      String location, bool isOffline, double lat, double lng) async {
    emit(state.copyWith(status: ToSearchStatus.loading));
    List<ToRecommendation> predictions = [];
    if (isOffline == false) {
      predictions =
          await toSearchRepository.getSearchRecommendations(location, lat, lng);
    } else {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
      var recoms;
      if (location.isEmpty == true) {
        recoms = await isar.directions
            .where()
            .sortByTimeDesc()
            .distinctByDestContent()
            .limit(5)
            .findAll();
      } else {
        recoms = await isar.directions
            .where()
            .contentWordsElementStartsWith(location)
            .distinctByDestContent()
            .limit(5)
            .findAll();
      }

      recoms.forEach((Directions recom) {
        ToRecommendation dest = ToRecommendation.fromJson(
          recom.toData.toString(),
        );
        dest.main = recom.destMain.toString();
        dest.secondary = recom.destSecondary.toString();

        predictions.add(dest);
      });
    }
    emit(state.copyWith(status: ToSearchStatus.loaded, locations: predictions));
  }
}
