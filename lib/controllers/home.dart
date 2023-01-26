import 'package:app/models/directions.dart';
import 'package:app/pages/from_search.dart';
import 'package:app/widgets/dialogs/location.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:isar/isar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  Timer? timer;
  RxString guideState = "from_nearest_loading".obs;

  @override
  void onInit() {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          // Perform immediate update
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
            }
          });
        } else if (updateInfo.flexibleUpdateAllowed) {
          //Perform flexible update
          InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    });
    checkUserLocation();
    super.onInit();
  }

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  //Search
  RxBool isSearchLoading = false.obs;
  final FloatingSearchBarController search = FloatingSearchBarController();
  var hintInput = "Where to?".obs;
  var isVisible = false.obs;
  var searchInput = Rxn<String?>();
  List searchResults = [];
  RxList searchRecoms = [].obs;
  String searchMain = "NaN";
  String searchSecondary = "NaN";
  late Map<String, dynamic> metroData;

  //From Search
  final TextEditingController fromSearchController = TextEditingController();
  FocusNode fromSearchFocus = FocusNode();
  var fromHintInput = "Where are you?".obs;
  RxList fromSearchRecoms = [].obs;

  //API Data
  String algoliaId = "";
  String algoliaKey = "";
  String mapKey = "";
  Map<String, dynamic> apiData = {};

  //Get API Info
  getApiData() async {
    final resp =
        await FirebaseFirestore.instance.collection('api').doc('data').get();
    apiData = resp.data()!;
    algoliaId = apiData["algolia_id"];
    algoliaKey = apiData["algolia_key"];
    mapKey = apiData["map_key"];
  }

  //Online Offline Status
  RxBool isOnline = true.obs;

  //From
  RxString fromLocation = "Near Metro?".obs;
  TextEditingController fromController = TextEditingController();
  FocusNode fromFocus = FocusNode();

  //to

  RxString toLocation = "".obs;
  TextEditingController toController = TextEditingController();
  FocusNode toFocus = FocusNode();

  //From Location Variables
  Map<String, dynamic> fromData = {};
  RxString fromCoordinates = "".obs;
  RxString fromStation = "".obs;
  RxString fromStationAddress = "".obs;
  RxString fromPlaceId = "".obs;
  RxInt fromStationColor = 0xff000000.obs;
  RxString fromDistance = "".obs;
  RxString fromOpen = "".obs;
  RxString fromHeader = "Nearest Station".obs;
  RxString fromRating = "".obs;
  RxString fromTotalRatings = "".obs;
  RxString fromImagePath = "".obs;
  List fromStations = [];
  List fromDistances = [];
  RxBool isFromUpdating = false.obs;
  String fromCode = "";

  //To Location Variables
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

  //Route Info
  String errorMessage =
      "We can't seem to find directions for the place you are looking for right now.";
  RxBool isDirLoading = false.obs;
  List directions = [];
  RxDouble currentStep = 0.toDouble().obs;

  Future getFromNearestMetro(destinationId) async {
    isFromUpdating.value = true;

    String apiKey = mapKey;

    //Find destination coordinates
    final placeRequest = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$destinationId&key=$apiKey&fields=geometry,formatted_address,name");

    final fromResponse = await http.get(placeRequest);

    final fromResult = json.decode(fromResponse.body);
    Map<String, dynamic> destCoord =
        fromResult["result"]["geometry"]["location"];
    String fromSearchMain = fromResult["result"]["name"];
    String fromSearchSecondary = fromResult["result"]["formatted_address"];
    String fromSearchContent = "${fromSearchMain} ${fromSearchSecondary}";
    //Find metro station nearby

    final nearbyRequest = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&&keyword=metro station&location=${destCoord["lat"].toString()},${destCoord["lng"].toString()}&type=subway_station&rankby=distance");

    final nearbyResponse = await http.get(nearbyRequest);

    final nearbyResult = json.decode(nearbyResponse.body);
    String nearbyMetro = nearbyResult["results"][0]["name"];
    fromStation.value = nearbyMetro;
    fromStationAddress.value = nearbyResult["results"][0]["vicinity"];
    double nearbyMetroLat =
        nearbyResult["results"][0]["geometry"]["location"]["lat"];
    double nearbyMetroLng =
        nearbyResult["results"][0]["geometry"]["location"]["lng"];
    var distance = Geolocator.distanceBetween(
        destCoord["lat"], destCoord["lng"], nearbyMetroLat, nearbyMetroLng);
    fromDistance.value = distance.toStringAsFixed(0);
    fromPlaceId.value = nearbyResult["results"][0]["place_id"];
    fromOpen.value =
        nearbyResult["results"][0]["business_status"] == "OPERATIONAL"
            ? "Yes"
            : "No";
    fromRating.value = nearbyResult["results"][0]["rating"].toString();
    fromTotalRatings.value =
        nearbyResult["results"][0]["user_ratings_total"].toString();
    nearbyResult["results"][0]["distance"] = distance;
    fromData = nearbyResult;
    isFromUpdating.value = false;
  }

  getSearchRecommendations(String location) async {
    if (isOnline.value == false) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      if (location.isEmpty == true) {
        searchRecoms.value = await isar.directions
            .where()
            .filter()
            .fromIdEqualTo(fromPlaceId.value)
            .sortByTimeDesc()
            .distinctByDestContent()
            .limit(5)
            .findAll();
      } else {
        searchRecoms.value = await isar.directions
            .where()
            .contentWordsElementStartsWith(location)
            .filter()
            .fromIdEqualTo(fromPlaceId.value)
            .distinctByDestContent()
            .limit(5)
            .findAll();
      }
    } else {
      isSearchLoading.value = true;
      String apiKey = mapKey;
      double fromLat;
      double fromLng;

      if (fromData.containsKey("results") == true) {
        fromLat = fromData["results"][0]["geometry"]["location"]["lat"];
        fromLng = fromData["results"][0]["geometry"]["location"]["lng"];
      } else {
        var locAccuracy = await Geolocator.getLocationAccuracy();
        if (locAccuracy == LocationAccuracyStatus.reduced) {
          accPos = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
        }
        if (locAccuracy == LocationAccuracyStatus.precise) {
          accPos = await Geolocator.getCurrentPosition();
        }
        fromLat = accPos.latitude;
        fromLng = accPos.longitude;
      }

      final request = Uri.parse(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$location&locationrestriction=circle:50000@${fromLat},${fromLng}&language=en&key=$apiKey');

      final apiResponse = await http.get(request);
      final result = json.decode(apiResponse.body);

      List predictions = result["predictions"];

      searchRecoms.value = [];

      searchRecoms.value = result["predictions"];
      isSearchLoading.value = false;
    }
  }

  getFromSearchRecommendations(String location) async {
    if (isOnline.value == false) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      if (location.isEmpty != true) {
        fromSearchRecoms.value = await isar.directions
            .filter()
            .timeLessThan(DateTime.now())
            .fromContentWordsElementStartsWith(location)
            .sortByTimeDesc()
            .distinctByFromId()
            .limit(5)
            .findAll();
      } else {
        fromSearchRecoms.value = await isar.directions
            .filter()
            .timeLessThan(DateTime.now())
            .sortByTimeDesc()
            .distinctByFromId()
            .limit(5)
            .findAll();
      }
      // searchRecoms.value =
      // print(offRecoms[0].destContent);
    } else {
      isSearchLoading.value = true;
      if (location.isEmpty == true) {
        var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

        fromSearchRecoms.value = await isar.directions
            .filter()
            .timeLessThan(DateTime.now())
            .sortByTimeDesc()
            .distinctByFromId()
            .limit(5)
            .findAll();
      } else {
        String apiKey = mapKey;
        final request = Uri.parse(
            'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$location&components=country:in&language=en&key=$apiKey');

        final apiResponse = await http.get(request);
        final result = json.decode(apiResponse.body);
        fromSearchRecoms.value = [];

        fromSearchRecoms.value = result["predictions"];
      }
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
      searchRecoms.value = await isar.directions
          .where()
          .filter()
          .fromIdEqualTo(fromPlaceId.value)
          .sortByTimeDesc()
          .distinctByDestContent()
          .limit(5)
          .findAll();
      isSearchLoading.value = false;
    }
  }

  getSearchResults() async {
    final String response =
        await rootBundle.loadString('assets/data/delhi_ncr.json');
    metroData = await json.decode(response);

    var cityList = metroData.keys.toList();
    cityList.forEach((line) {
      Map<String, dynamic> cityData = metroData[line];
      List<String> stations = List<String>.from(cityData["stations"]);
      Map<String, dynamic> lineData = cityData["data"];

      stations.forEach((station) {
        if (lineData.containsKey(station) == true) {
          Map<String, dynamic> stationData = lineData[station];
          searchResults.add(stationData);
        }
      });
    });
  }

  late Position accPos;
  getUserLocation() async {
    isFromUpdating.value = true;
    if (isOnline.value == false) {
      final isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      Directions? lastSeen =
          await isar.directions.where().sortByTimeDesc().findFirst();

      if (lastSeen != null) {
        final nearbyResult = json.decode(lastSeen!.fromData.toString());

        String nearbyMetro = nearbyResult["results"][0]["name"];
        fromStation.value = nearbyMetro;
        fromPlaceId.value = nearbyResult["results"][0]["place_id"];
        fromStationAddress.value = nearbyResult["results"][0]["vicinity"];
        fromDistance.value =
            nearbyResult["results"][0]["distance"].toStringAsFixed(0);
        String lineColor = nearbyResult["results"][0]["icon_background_color"];
        fromStationColor.value = int.parse(lineColor.replaceAll("#", "0xff"));
        fromOpen.value =
            nearbyResult["results"][0]["business_status"] == "OPERATIONAL"
                ? "Yes"
                : "No";
        fromRating.value = nearbyResult["results"][0]["rating"].toString();
        fromTotalRatings.value =
            nearbyResult["results"][0]["user_ratings_total"].toString();
        fromData = nearbyResult;
        fromHeader.value = "Last Seen";

        searchRecoms.value = await isar.directions
            .where()
            .filter()
            .fromIdEqualTo(fromPlaceId.value)
            .sortByTimeDesc()
            .distinctByDestContent()
            .limit(5)
            .findAll();
      } else {
        Get.to(FromSearchPage());
      }
    } else {
      String apiKey = mapKey;

      // Handle position changes
      fromStations = [];
      fromDistances = [];
      // var cityList = metroData.keys.toList();
      var locAccuracy = await Geolocator.getLocationAccuracy();

      if (locAccuracy == LocationAccuracyStatus.reduced) {
        accPos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
      }
      if (locAccuracy == LocationAccuracyStatus.precise) {
        accPos = await Geolocator.getCurrentPosition();
      }

      //Find metro station nearby
      final nearbyRequest = Uri.parse(
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&keyword=metro station&location=${accPos.latitude.toString()},${accPos.longitude.toString()}&type=subway_station&rankby=distance");

      final nearbyResponse = await http.get(nearbyRequest);

      final nearbyResult = json.decode(nearbyResponse.body);
      //print(nearbyResult["results"][0]["name"]);
      if (nearbyResult["status"] == "ZERO_RESULTS") {
        fromStation.value = "None";
      } else {
        String nearbyMetro = nearbyResult["results"][0]["name"];
        fromStation.value = nearbyMetro;
        fromPlaceId.value = nearbyResult["results"][0]["place_id"];
        fromStationAddress.value = nearbyResult["results"][0]["vicinity"];
        double nearbyMetroLat =
            nearbyResult["results"][0]["geometry"]["location"]["lat"];
        double nearbyMetroLng =
            nearbyResult["results"][0]["geometry"]["location"]["lng"];
        var distance = Geolocator.distanceBetween(
            accPos.latitude, accPos.longitude, nearbyMetroLat, nearbyMetroLng);
        fromDistance.value = distance.toStringAsFixed(0);
        String lineColor = nearbyResult["results"][0]["icon_background_color"];
        fromStationColor.value = int.parse(lineColor.replaceAll("#", "0xff"));
        fromOpen.value =
            nearbyResult["results"][0]["business_status"] == "OPERATIONAL"
                ? "Yes"
                : "No";
        fromRating.value = nearbyResult["results"][0]["rating"].toString();
        fromTotalRatings.value =
            nearbyResult["results"][0]["user_ratings_total"].toString();
        nearbyResult["results"][0]["distance"] = distance;
        fromData = nearbyResult;
        var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
        searchRecoms.value = await isar.directions
            .where()
            .filter()
            .fromIdEqualTo(fromPlaceId.value)
            .sortByTimeDesc()
            .distinctByDestContent()
            .limit(5)
            .findAll();
      }
      fromHeader.value = "Nearest Station";
    }
    isFromUpdating.value = false;
  }

  checkUserLocation() async {
    var status = await Permission.location.request();
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      if (mapKey.isEmpty == true) {
        await getApiData();
      }
    }
    if (status.isPermanentlyDenied) {
      var isar = Isar.getInstance() ?? await Isar.open([DirectionsSchema]);

      fromSearchRecoms.value = await isar.directions
          .filter()
          .timeLessThan(DateTime.now())
          .sortByTimeDesc()
          .distinctByFromId()
          .limit(5)
          .findAll();

      if (fromSearchRecoms.isEmpty == false) {
        Directions offDir = fromSearchRecoms[0];
        Map<String, dynamic> fromResp = json.decode(offDir.fromData.toString());
        String lineColor = fromResp["results"][0]["icon_background_color"];
        fromStationColor.value = int.parse(lineColor.replaceAll("#", "0xff"));
        fromOpen.value =
            fromResp["results"][0]["business_status"] == "OPERATIONAL"
                ? "Yes"
                : "No";
        fromRating.value = fromResp["results"][0]["rating"].toString();
        fromTotalRatings.value =
            fromResp["results"][0]["user_ratings_total"].toString();
        fromDistance.value =
            fromResp["results"][0]["distance"].toStringAsFixed(0);
        fromData = fromResp;
        fromHeader.value = "Last Seen";
        fromStation.value = fromResp["results"][0]["name"];
        fromStationAddress.value = fromResp["results"][0]["vicinity"];
        fromPlaceId.value = fromResp["results"][0]["place_id"];
        searchRecoms.value = await isar.directions
            .where()
            .filter()
            .fromIdEqualTo(fromPlaceId.value)
            .sortByTimeDesc()
            .distinctByDestContent()
            .limit(5)
            .findAll();
      } else {
        Get.to(FromSearchPage());
      }
    }
    if (status.isDenied) {
      Get.generalDialog(
          transitionDuration: Duration(milliseconds: 400),
          pageBuilder: (bc, ania, anis) {
            return RequestPermission();
          });
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

    if (status.isGranted) {
      await getUserLocation();
    }
  }

  @override
  void onClose() {
    toFocus.unfocus();
    toController.dispose();

    super.onClose();
  }
}
