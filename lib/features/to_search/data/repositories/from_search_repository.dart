import 'package:app/features/to_search/data/datasources/to_search_service.dart';
import 'package:app/features/to_search/data/models/recommendation.dart';

class ToSearchRepository {
  final ToSearchService toSearchService;
  const ToSearchRepository({required this.toSearchService});

  Future getSearchRecommendations(String location) async {
    final List<ToRecommendation> predictions =
        await toSearchService.getSearchRecommendations(location);

    return predictions;
  }
}
