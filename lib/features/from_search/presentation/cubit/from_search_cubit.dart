import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:app/features/from_search/data/models/recommendation.dart';
import 'package:app/features/from_search/data/repositories/from_search_repository.dart';
import 'package:app/features/home/data/models/directions.dart';

part 'from_search_state.dart';

class FromSearchCubit extends Cubit<FromSearchState> {
  final FromSearchRepository fromSearchRepository;
  FromSearchCubit({required this.fromSearchRepository})
      : super(FromSearchState.initial());

  getSearchRecommendations(String location, bool isOffline) async {
    emit(state.copyWith(status: FromSearchStatus.loading));
    List<FromRecommendation> predictions = [];

    if (isOffline == false) {
      if (location.isEmpty == true) {
        var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
        var recoms = await isar.directions
            .filter()
            .timeLessThan(DateTime.now())
            .sortByTimeDesc()
            .distinctByFromId()
            .limit(5)
            .findAll();
        recoms.forEach((recom) {
          predictions.add(
            FromRecommendation.fromJson(
              recom.fromData.toString(),
            ),
          );
        });
      } else {
        predictions =
            await fromSearchRepository.getSearchRecommendations(location);
      }
    } else {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
      if (location.isEmpty == false) {
        var recoms = await isar.directions
            .filter()
            .timeLessThan(DateTime.now())
            .fromContentWordsElementStartsWith(location)
            .sortByTimeDesc()
            .distinctByFromId()
            .limit(5)
            .findAll();
        recoms.forEach((recom) {
          predictions.add(
            FromRecommendation.fromJson(
              recom.fromData.toString(),
            ),
          );
        });
      } else {
        var recoms = await isar.directions
            .filter()
            .timeLessThan(DateTime.now())
            .sortByTimeDesc()
            .distinctByFromId()
            .limit(5)
            .findAll();
        recoms.forEach((recom) {
          predictions.add(
            FromRecommendation.fromJson(
              recom.fromData.toString(),
            ),
          );
        });
      }
    }
    emit(state.copyWith(
        status: FromSearchStatus.loaded, locations: predictions));
  }
}
