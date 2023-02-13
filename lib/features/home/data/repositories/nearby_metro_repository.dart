import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/datasources/nearby_metro_service.dart';

class NearbyMetroRepository {
  final NearbyMetroService nearbyMetroService;

  const NearbyMetroRepository({required this.nearbyMetroService});

  Future<FromMetro> fetchNearestMetro(double lat, double lng) async {
    final FromMetro nearestMetro =
        await nearbyMetroService.getNearestMetro(lat, lng);

    return nearestMetro;
  }

  Future<FromMetro> fetchFromNearestMetro(String placeId) async {
    final FromMetro nearestMetro =
        await nearbyMetroService.getFromNearestMetro(placeId);

    return nearestMetro;
  }
}
