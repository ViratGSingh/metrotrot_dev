import 'package:app/features/destination/data/datasources/dest_metro_service.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';

class DestMetroRepository {
  final DestMetroService destMetroService;

  const DestMetroRepository({required this.destMetroService});

  Future<DestMetro> fetchDestNearestMetro(String placeId) async {
    final DestMetro nearestMetro =
        await destMetroService.getDestNearestMetro(placeId);

    return nearestMetro;
  }
}
