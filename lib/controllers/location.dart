import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  @override
  void onInit() {
    formatDestinationInfo();
    super.onInit();
  }

  //Current Step
  RxDouble currentStep = 0.toDouble().obs;

  //From Info
  Map<String, dynamic> fromData = {};

  //Search Info
  Map<String, dynamic> searchData = {};

  //API Info
  Map<String, dynamic> apiData = {};
  String mapKey = "";
  String algoliaId = "";
  String algoliaKey = "";

  //Destination Info
  RxBool isToLoading = false.obs;
  Map<String, dynamic> toData = {};
  RxString toStation = "".obs;
  RxString toStationAddress = "".obs;
  RxString toPlaceId = "".obs;
  RxString toDistance = "".obs;
  RxString toOpen = "".obs;
  RxString toRating = "".obs;
  RxString toTotalRatings = "".obs;
  RxString toImagePath = "".obs;
  List toStations = [];
  List toDistances = [];
  RxBool isToUpdating = false.obs;
  String toCode = "";

  //Offline Directions
  Map<String, dynamic> offDirections = {};

  formatDestinationInfo() async {
    dynamic arguments = Get.arguments;
    String condition = arguments[0];
    if (condition == "online") {
      String destId = arguments[1];
      apiData = arguments[2];
      mapKey = apiData["map_key"];
      algoliaId = apiData["algolia_id"];
      algoliaKey = apiData["algolia_key"];
      fromData = arguments[3];
      searchData = arguments[4];
      getNearestMetro(destId, mapKey);
    } else {
      Map<String, dynamic> destResp = arguments[1];
      Map<String, dynamic> dirResp = arguments[2];
      apiData = arguments[3];
      mapKey = apiData["map_key"];
      algoliaId = apiData["algolia_id"];
      algoliaKey = apiData["algolia_key"];
      fromData = arguments[4];
      searchData = arguments[5];
      offDirections = dirResp;
      getOffNearestMetro(destResp);
    }
  }

  Future getOffNearestMetro(nearbyResult) async {
    //print(nearbyResult["results"][0]["name"]);

    isToUpdating.value = true;

    String nearbyMetro = nearbyResult["results"][0]["name"];
    toStation.value = nearbyMetro;
    toStationAddress.value = nearbyResult["results"][0]["vicinity"];
    var distance = nearbyResult["results"][0]["distance"];
    toDistance.value = distance.toStringAsFixed(0);
    toPlaceId.value = nearbyResult["results"][0]["place_id"];
    toOpen.value =
        nearbyResult["results"][0]["business_status"] == "OPERATIONAL"
            ? "Yes"
            : "No";
    toRating.value = nearbyResult["results"][0]["rating"].toString();
    toTotalRatings.value =
        nearbyResult["results"][0]["user_ratings_total"].toString();

    toData = nearbyResult;
    isToUpdating.value = false;
  }

  Future getOffRoute(routeResult) async {
    List routes = routeResult["routes"];
    if (routes.isNotEmpty == true) {
      offDirections = routeResult["routes"][0]["legs"][0]["steps"];
      int totaltransits = 0;
      for (var i = 0; i <= offDirections.length - 1; i++) {
        if (offDirections[i]["travel_mode"] == "TRANSIT") {
          totaltransits += 1;
        }
      }
      if (totaltransits == 0) {
        offDirections = {};
      }
    }
  }

  Future getNearestMetro(destinationId, mapKey) async {
    isToUpdating.value = true;

    String apiKey = mapKey;
    //Find destination coordinates
    final placeRequest = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$destinationId&key=$apiKey&fields=geometry");

    final fromResponse = await http.get(placeRequest);

    final fromResult = json.decode(fromResponse.body);
    Map<String, dynamic> destCoord =
        fromResult["result"]["geometry"]["location"];

    //Find metro station nearby
    final nearbyRequest = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&type=subway_station&&keyword=metro station&location=${destCoord["lat"].toString()},${destCoord["lng"].toString()}&rankby=distance");

    final nearbyResponse = await http.get(nearbyRequest);
    final nearbyResult = json.decode(nearbyResponse.body);
    String nearbyMetro = nearbyResult["results"][0]["name"];
    toStation.value = nearbyMetro;
    toStationAddress.value = nearbyResult["results"][0]["vicinity"];
    double nearbyMetroLat =
        nearbyResult["results"][0]["geometry"]["location"]["lat"];
    double nearbyMetroLng =
        nearbyResult["results"][0]["geometry"]["location"]["lng"];
    var distance = Geolocator.distanceBetween(
        destCoord["lat"], destCoord["lng"], nearbyMetroLat, nearbyMetroLng);
    toDistance.value = distance.toStringAsFixed(0);
    toPlaceId.value = nearbyResult["results"][0]["place_id"];
    toOpen.value =
        nearbyResult["results"][0]["business_status"] == "OPERATIONAL"
            ? "Yes"
            : "No";
    toRating.value = nearbyResult["results"][0]["rating"].toString();
    toTotalRatings.value =
        nearbyResult["results"][0]["user_ratings_total"].toString();
    nearbyResult["results"][0]["distance"] = distance;
    toData = nearbyResult;
    isToUpdating.value = false;
  }
}
