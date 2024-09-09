import 'package:app/features/from_search/data/datasources/from_search_service.dart';
import 'package:app/features/from_search/data/models/from_recommendation.dart';

class FromSearchRepository {
  final FromSearchService fromSearchService;

  const FromSearchRepository({required this.fromSearchService});

  Future getSearchRecommendations(String location) async {
    final List<FromRecommendation> predictions =
        await fromSearchService.getSearchRecommendations(location);

    return predictions;
  }

  Future getAltSearchRecommendations(String location) async {
    final List<FromRecommendation> predictions =
        await fromSearchService.getAltSearchRecommendations(location);

    return predictions;
  }

  Future<Map<String, dynamic>> fetchNearestMetro(String placeId) async {
    final nearestMetro = await fromSearchService.getNearestMetro(placeId);

    return nearestMetro;
  }
}
