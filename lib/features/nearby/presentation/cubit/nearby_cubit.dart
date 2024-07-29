import 'dart:convert';
import 'package:app/features/home/presentation/cubit/home_cubit.dart';
import 'package:app/features/nearby/data/models/recommendation.dart';
import 'package:app/features/nearby/data/repositories/nearby_repository.dart';
import 'package:app/models/location.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

part 'nearby_state.dart';

class NearbyCubit extends Cubit<NearbyState> {
  final NearbyRepository nearbyRepository;
  NearbyCubit({required this.nearbyRepository}) : super(NearbyState.initial());

  late Mixpanel mixpanel;
  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init(dotenv.env["MIXPANEL_PROJECT_ID"].toString(),
        trackAutomaticEvents: false);
  }

  Future<List<Map<String, dynamic>>> findClosestStations(
      List<Map<String, dynamic>> locations, Location userLocation) async {
    Map<String, dynamic> closestLocation = {};
    List<Map<String, dynamic>> closestMetros = [];
    for (var i = 0; i < locations.length; i++) {
      final Location stationLoc = Location(locations[i]["coordinates"]["lat"],
          locations[i]["coordinates"]["lng"]);
      final distanceToLocation = distance(userLocation, stationLoc);
      closestLocation = locations[i];
      closestLocation["distance"] = distanceToLocation;
      closestMetros.add(closestLocation);
    }

    // Sort the list by 'distance' values
    closestMetros.sort((a, b) => a['distance'].compareTo(b['distance']));

    // Get the top 10 maps with the lowest 'distance' values
    closestMetros = closestMetros.take(10).toList();

    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);

    for (Map<String, dynamic> metroStation in closestMetros) {
      List lineKeys = metroStation["interchange_data"]["lines"];
      List<Color> colourCodes = [];
      List<String> lineNames = [];
      lineKeys.forEach((element) {
        Map<String, dynamic> lineData = metroData["data"][element];
        int hexCode = int.parse("0xFF${lineData["colour_code"]}");
        colourCodes.add(
          Color(hexCode),
        );
        lineNames.add(lineData["name"].split(" ").first);
      });
      int index = closestMetros.indexOf(metroStation);

      closestMetros[index]["distance"] =
          closestMetros[index]["distance"].toStringAsFixed(2);
      closestMetros[index]["colour_codes"] = colourCodes;
      closestMetros[index]["line_names"] = lineNames;
    }
    print(closestMetros);
    return closestMetros;
  }

  Future getNearbyMetros(String placeId) async {
    emit(
      state.copyWith(status: NearbyStatus.loading),
    );
    Map<String, dynamic> placeInfo =
        await nearbyRepository.getLocationInfo(placeId);
    //print(placeInfo);
    double lat = placeInfo["geometry"]["location"]["lat"];
    double lng = placeInfo["geometry"]["location"]["lng"];
    String locationName = "";
    String locationAddress = "";
    locationName = placeInfo["name"];
    locationAddress = placeInfo["formatted_address"];

    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    int metroLines = metroData["total_lines"];
    //print(metroLines);
    final userLocation = Location(lat, lng); // User's location
    List<Map<String, dynamic>> metroStations = [];
    for (var i = 1; i <= metroLines; i++) {
      List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
      lineData.forEach((element) {
        Map<String, dynamic> stationData = element;
        metroStations.add(stationData);
      });
      //metroStations.addAll(lineData);
    }
    final coordinatesToCheck = metroStations;

    final closestMetros =
        await findClosestStations(coordinatesToCheck, userLocation);
    //print(closestMetros);

    emit(
      state.copyWith(
        status: NearbyStatus.loaded,
        locationName: locationName,
        locationAddress: locationAddress,
        closestMetros: closestMetros,
      ),
    );
  }

  Future getNearbyMetrosFromCurrentLocation() async {
    emit(
      state.copyWith(status: NearbyStatus.loading),
    );
    var status = await Permission.location.request();
    Position? accPos;
    if (status.isGranted == true) {
      var locAccuracy = await Geolocator.getLocationAccuracy();

      if (locAccuracy == LocationAccuracyStatus.precise) {
        accPos = await Geolocator.getCurrentPosition();
      } else {
        accPos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
      }
    }
    print(accPos);

    //print(placeInfo);
    double lat = accPos?.latitude ?? 0;
    double lng = accPos?.longitude ?? 0;
    String locationName = "";
    String locationAddress = "";

    final metroResp = await rootBundle.loadString('assets/data/delhi_ncr.json');
    final metroData = json.decode(metroResp);
    int metroLines = metroData["total_lines"];
    //print(metroLines);
    final userLocation = Location(lat, lng); // User's location
    List<Map<String, dynamic>> metroStations = [];
    for (var i = 1; i <= metroLines; i++) {
      List lineData = metroData["data"]["line_${i.toString()}"]["stations"];
      lineData.forEach((element) {
        Map<String, dynamic> stationData = element;
        metroStations.add(stationData);
      });
      //metroStations.addAll(lineData);
    }
    final coordinatesToCheck = metroStations;

    final closestMetros =
        await findClosestStations(coordinatesToCheck, userLocation);
    //print(closestMetros);

    emit(
      state.copyWith(
        status: NearbyStatus.loaded,
        locationName: locationName,
        locationAddress: locationAddress,
        closestMetros: closestMetros,
      ),
    );
  }

  Future<List<Recommendation>> getSearchRecommendations(String location) async {
    List<Recommendation> predictions = [];

    await nearbyRepository.getSearchRecommendations(location).then((value) {
      predictions = value;
      //print(predictions);
    });
    return predictions;
  }
}
