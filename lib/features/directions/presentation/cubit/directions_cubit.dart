import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/models/route.dart';
import 'package:app/features/directions/data/repositories/directions_repository.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/models/directions.dart';

part 'directions_state.dart';

class DirectionsCubit extends Cubit<DirectionsState> {
  final DirectionsRepository directionsRepository;
  DirectionsCubit({required this.directionsRepository})
      : super(DirectionsState.initial());
  getDirections(FromMetro fromMetro, DestMetro toMetro, String destName,
      String destAddress, bool isOffline) async {
    emit(
        state.copyWith(status: DirectionsStatus.loading, isOffline: isOffline));
    MetroRoute route = MetroRoute.initial();
    if (isOffline == false) {
      route = await directionsRepository.fetchRoute(
          fromMetro, toMetro, destName, destAddress, isOffline);
      final isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
      final destination = Directions()
        ..time = DateTime.now()
        ..fromId = fromMetro.placeId
        ..toId = toMetro.placeId
        ..destMain = destName
        ..destSecondary = destAddress
        ..destContent =
            "${destName.toString().toLowerCase()} ${destAddress.toLowerCase()}"
        ..fromMain = fromMetro.name
        ..fromSecondary = fromMetro.vicinity
        ..fromContent =
            "${fromMetro.name.toString().toLowerCase()} ${fromMetro.vicinity.toLowerCase()}"
        ..fromData = fromMetro.data
        ..toData = toMetro.data
        ..directions = route.data;

      await isar.writeTxn(() async {
        await isar.directions.put(destination);
      });
    } else {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? offRoute = await isar.directions
          .filter()
          .fromIdEqualTo(fromMetro.placeId)
          .toIdEqualTo(toMetro.placeId)
          .sortByTimeDesc()
          .findFirst();
      route = MetroRoute.fromJson(offRoute!.directions.toString());
    }
    emit(state.copyWith(
        status: DirectionsStatus.loaded,
        routeData: route,
        isOffline: isOffline));
  }
}
