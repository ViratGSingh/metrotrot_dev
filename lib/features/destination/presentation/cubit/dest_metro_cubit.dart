// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isar/isar.dart';
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/destination/data/repositories/dest_metro_repository.dart';
import 'package:app/features/home/data/models/directions.dart';
part 'dest_metro_state.dart';

class DestMetroCubit extends Cubit<DestMetroState> {
  final DestMetroRepository destMetroRepository;
  DestMetroCubit({required this.destMetroRepository})
      : super(
          DestMetroState.initial(),
        );

  Future getDestNearbyMetro(
      String placeId, double fromLat, double fromLng, bool isOffline) async {
    emit(state.copyWith(status: DestMetroStatus.loading, isOffline: isOffline));
    String distance = "N/A";
    DestMetro info = DestMetro.initial();
    if (isOffline == false) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? recom = await isar.directions
          .where()
          .filter()
          .toIdEqualTo(placeId)
          .sortByTimeDesc()
          .findFirst();
      if (recom == null) {
        info = await destMetroRepository.fetchDestNearestMetro(placeId);
      } else {
        info = DestMetro.fromJson(recom!.toData.toString());
      }

      distance = Geolocator.distanceBetween(info.destLat, info.destLng,
              info.nearbyMetroLat, info.nearbyMetroLng)
          .toStringAsFixed(0);
    } else {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? recom = await isar.directions
          .where()
          .filter()
          .toIdEqualTo(placeId)
          .sortByTimeDesc()
          .findFirst();
      info = DestMetro.fromJson(recom!.toData.toString());
      distance = Geolocator.distanceBetween(info.destLat, info.destLng,
              info.nearbyMetroLat, info.nearbyMetroLng)
          .toStringAsFixed(0);
    }
    emit(
      state.copyWith(
        status: DestMetroStatus.loaded,
        metro: info,
        isOffline: isOffline,
        distance: distance,
      ),
    );
  }

  
}
