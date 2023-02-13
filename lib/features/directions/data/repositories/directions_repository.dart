import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/datasources/directions_service.dart';
import 'package:app/features/directions/data/models/route.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';

class DirectionsRepository {
  final DirectionsService directionsService;

  const DirectionsRepository({required this.directionsService});

  Future<MetroRoute> fetchRoute(FromMetro fromMetro, DestMetro toMetro,
      String destName, String destAddress, bool isOffline) async {
    final MetroRoute route = await directionsService.getDirections(
        fromMetro, toMetro, destName, destAddress);

    return route;
  }
}
