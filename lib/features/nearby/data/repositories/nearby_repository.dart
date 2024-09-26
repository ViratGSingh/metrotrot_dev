import 'package:app/features/nearby/data/datasources/nearby_service.dart';
import 'package:app/features/nearby/data/models/recommendation.dart';

class NearbyRepository {
  final NearbyService nearbyMetroService;

  const NearbyRepository({required this.nearbyMetroService});

  Future<Map<String, dynamic>> getLocationInfo(String placeId) async {
    final nearestMetro = await nearbyMetroService.getLocationInfo(placeId);

    return nearestMetro;
  }

  Future getSearchRecommendations(String location) async {
    final List<Recommendation> predictions =
        await nearbyMetroService.getSearchRecommendations(location);

    return predictions;
  }
}
