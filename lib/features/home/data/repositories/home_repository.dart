import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/datasources/home_service.dart';

class HomeRepository {
  final HomeService nearbyMetroService;

  const HomeRepository({required this.nearbyMetroService});

  Future<FromMetro> fetchNearestMetro(double lat, double lng) async {
    final FromMetro nearestMetro =
        await nearbyMetroService.getNearestMetro(lat, lng);

    return nearestMetro;
  }

  Future<Map<String, dynamic>> fetchFromNearestMetro(String placeId) async {
    final nearestMetro = await nearbyMetroService.getFromNearestMetro(placeId);

    return nearestMetro;
  }
}
