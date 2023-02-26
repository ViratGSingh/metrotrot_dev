// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/models/directions.dart';
import 'package:app/features/home/data/repositories/nearby_metro_repository.dart';

part 'nearby_metro_state.dart';

class NearbyMetroCubit extends Cubit<NearbyMetroState> {
  final NearbyMetroRepository nearbyMetroRepository;
  NearbyMetroCubit({required this.nearbyMetroRepository})
      : super(NearbyMetroState.initial());

  getOfflineFromStation() async {
    emit(state.copyWith(status: NearbyMetroStatus.loading, isOffline: true));
    var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

    List<Directions> fromSearchRecoms = await isar.directions
        .filter()
        .timeLessThan(DateTime.now())
        .sortByTimeDesc()
        .distinctByFromId()
        .limit(5)
        .findAll();

    if (fromSearchRecoms.isEmpty == false) {
      Directions offDir = fromSearchRecoms[0];
      FromMetro nearbyMetro = FromMetro.fromJson(offDir.fromData.toString());
      // var locAccuracy = await Geolocator.getLocationAccuracy();

      // Position accPos;
      // if (locAccuracy == LocationAccuracyStatus.precise) {
      //   accPos = await Geolocator.getCurrentPosition();
      // } else {
      //   accPos = await Geolocator.getCurrentPosition(
      //       desiredAccuracy: LocationAccuracy.low);
      // }
      // var distance = Geolocator.distanceBetween(
      //     nearbyMetro.lat, nearbyMetro.lng, accPos.latitude, accPos.longitude);

      emit(state.copyWith(
          status: NearbyMetroStatus.loaded,
          metro: nearbyMetro,
          distance: "N/A",
          isOffline: true));
    } else {
      emit(state.copyWith(
          status: NearbyMetroStatus.locPermDenied, isOffline: true));
    }
  }

  checkUserLocation(isOffline) async {
    emit(state.copyWith(
        status: NearbyMetroStatus.loading, isOffline: isOffline));
    var status = await Permission.location.request();
    print(status);
    if (status.isPermanentlyDenied) {
      emit(state.copyWith(
          status: NearbyMetroStatus.locPermDenied, isOffline: isOffline));
    }
    if (status.isDenied) {
      emit(state.copyWith(
          status: NearbyMetroStatus.locDenied, isOffline: isOffline));
    }

    if (status.isGranted || status.isLimited) {
      isOffline == false
          ? await getNearbyMetro()
          : await getOfflineFromStation();
    }
  }

  Future getNearbyMetro() async {
    var locAccuracy = await Geolocator.getLocationAccuracy();

    Position accPos;
    if (locAccuracy == LocationAccuracyStatus.precise) {
      accPos = await Geolocator.getCurrentPosition();
    } else {
      accPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    }
    emit(state.copyWith(status: NearbyMetroStatus.loading, isOffline: false));
    final FromMetro nearbyMetro = await nearbyMetroRepository.fetchNearestMetro(
        accPos.latitude, accPos.longitude);
    var distance = Geolocator.distanceBetween(
        nearbyMetro.lat, nearbyMetro.lng, accPos.latitude, accPos.longitude);

    emit(
      state.copyWith(
        status: NearbyMetroStatus.loaded,
        metro: nearbyMetro,
        isOffline: false,
        distance: distance.toStringAsFixed(0),
      ),
    );
  }

  Future getFromNearbyMetro(String placeId, bool isOffline) async {
    emit(state.copyWith(
        status: NearbyMetroStatus.loading, isOffline: isOffline));
    FromMetro nearbyMetro = FromMetro.initial();
    String distance = "N/A";
    if (isOffline == true) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? fromSearchRecoms = await isar.directions
          .filter()
          .timeLessThan(DateTime.now())
          .fromIdEqualTo(placeId)
          .sortByTimeDesc()
          .distinctByFromId()
          .findFirst();
      nearbyMetro = FromMetro.fromJson(fromSearchRecoms!.fromData.toString());
    } else {
      var status = await Permission.location.request();

      nearbyMetro = await nearbyMetroRepository.fetchFromNearestMetro(placeId);

      if (status.isGranted == true) {
        var locAccuracy = await Geolocator.getLocationAccuracy();
        Position accPos;
        if (locAccuracy == LocationAccuracyStatus.precise) {
          accPos = await Geolocator.getCurrentPosition();
        } else {
          accPos = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
        }
        distance = Geolocator.distanceBetween(nearbyMetro.lat, nearbyMetro.lng,
                accPos.latitude, accPos.longitude)
            .toStringAsFixed(0);
      }
    }
    emit(
      state.copyWith(
        status: NearbyMetroStatus.loaded,
        metro: nearbyMetro,
        isOffline: isOffline,
        distance: distance,
      ),
    );
  }
}
