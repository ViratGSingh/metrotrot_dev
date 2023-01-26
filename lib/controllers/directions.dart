import 'dart:convert';
import 'package:algolia/algolia.dart';
import 'package:app/models/directions.dart';
import 'package:app/widgets/directions/end.dart';
import 'package:app/widgets/directions/interchange.dart';
import 'package:app/widgets/directions/start.dart';
import 'package:app/widgets/directions/transit.dart';
import 'package:app/widgets/general/line.dart';
import 'package:app/widgets/instructions/end.dart';
import 'package:app/widgets/instructions/interchange.dart';
import 'package:app/widgets/instructions/start.dart';
import 'package:app/widgets/instructions/transit.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class DirectionsController extends GetxController {
  @override
  void onInit() {
    getDirections();
    super.onInit();
  }

  RxBool isDirLoading = false.obs;
  RxInt currentStep = 0.obs;
  List directions = [];
  Map<String, dynamic> dirResp = {};
  String errorMessage =
      "We can't seem to find directions for the place you are looking for right now.";

  //From Data
  String? searchMain;
  String? fromStation;
  String fromDistance = "0";

  //To Data
  String toDistance = "0";

  //Route
  String routecost = "0";

  //Google Ads
  BannerAd? bannerAd;

  //Initial Function
  getDirections() {
    var arguments = Get.arguments;
    String condition = arguments[0];
    if (condition == "online") {
      //Get API Data
      Map<String, dynamic> apiData = arguments[1];
      Map<String, dynamic> fromData = arguments[2];
      Map<String, dynamic> searchData = arguments[3];
      Map<String, dynamic> toData = arguments[4];
      MobileAds.instance.initialize();
      BannerAd(
        adUnitId: "ca-app-pub-8353447747212760/6752954499",
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            bannerAd = ad as BannerAd;
          },
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
          },
        ),
      ).load();
      getRoute(apiData, fromData, searchData, toData);
    } else {
      Map<String, dynamic> routeResult = arguments[1];
      routecost = routeResult["routes"][0]["fare"]["text"];
      //remove decimal
      routecost = routecost.replaceAll(".00", "");
      directions = routeResult["routes"][0]["legs"][0]["steps"];
      fromStation = arguments[2]["results"][0]["name"];
      fromDistance = arguments[2]["results"][0]["distance"].toStringAsFixed(0);
      toDistance = arguments[4]["results"][0]["distance"].toStringAsFixed(0);
      searchMain = arguments[3]["main"];
    }
  }

  Future getRoute(apiData, fromData, searchData, toData) async {
    isDirLoading.value = true;
    //Format API data
    String algoliaId = apiData["algolia_id"];
    String algoliaKey = apiData["algolia_key"];
    String apiKey = apiData["map_key"];

    //Format From Data
    String fromPlaceId = fromData["results"][0]["place_id"];
    fromStation = fromData["results"][0]["name"];
    fromDistance = fromData["results"][0]["distance"].toStringAsFixed(0);
    String fromStationAddress = fromData["results"][0]["vicinity"];

    //Format To Data
    String toPlaceId = toData["results"][0]["place_id"];
    toDistance = toData["results"][0]["distance"].toStringAsFixed(0);

    //Format Search Data
    searchMain = searchData["main"];
    String searchSecondary = searchData["secondary"];
    final routeRequest = Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?origin=place_id:${fromPlaceId}&destination=place_id:${toPlaceId}&transit_mode=subway&key=$apiKey&mode=transit");
    //check for same place id
    if (fromPlaceId == toPlaceId) {
      directions = [];
    } else {
      final routeResponse = await http.get(routeRequest);
      final routeResult = json.decode(routeResponse.body);
      List routes = routeResult["routes"];
      if (routes.isNotEmpty == true) {
        if (routes[0].containsKey("fare") == true) {
          routecost = routes[0]["fare"]["text"];
        }
        //remove decimal
        routecost = routecost.replaceAll(".00", "");
        directions = routeResult["routes"][0]["legs"][0]["steps"];

        //check if no transit is there
        int totaltransits = 0;
        for (var i = 0; i <= directions.length - 1; i++) {
          if (directions[i]["travel_mode"] == "TRANSIT" &&
              directions[i].containsKey("transit_details") == true) {
            if (directions[i]["transit_details"]["line"]["vehicle"]["type"] ==
                "SUBWAY") {
              totaltransits += 1;
              String code = directions[i]["transit_details"]["line"]["agencies"]
                      [0]["name"]
                  .toString()
                  .toLowerCase();
              String departureName =
                  directions[i]["transit_details"]["departure_stop"]["name"];
              String arrivalName =
                  directions[i]["transit_details"]["arrival_stop"]["name"];

              Algolia algolia = Algolia.init(
                applicationId: algoliaId,
                apiKey: algoliaKey,
              );
              AlgoliaQuery query = algolia.instance
                  .index('Metro Lines ')
                  .query("$code $departureName $arrivalName");
              AlgoliaQuerySnapshot snap = await query.getObjects();
              if (snap.hits.isEmpty == false) {
                final lineResp = snap.hits.first.data;
                directions[i]["transit_details"]["line"]["name"] =
                    lineResp["line"];
                directions[i]["transit_details"]["line"]["stations"] =
                    lineResp["stations"];
              } else {
                directions[i]["transit_details"]["line"]["stations"] = [];
              }
            }
          }
        }
        if (totaltransits == 0) {
          directions = [];
        } else {
          final isar =
              Isar.getInstance() ?? await Isar.open([DirectionsSchema]);
          final destination = Directions()
            ..time = DateTime.now()
            ..fromId = fromPlaceId
            ..toId = toPlaceId
            ..destMain = searchMain
            ..destSecondary = searchSecondary
            ..destContent =
                "${searchMain.toString().toLowerCase()} ${searchSecondary.toLowerCase()}"
            ..fromMain = fromStation
            ..fromSecondary = fromStationAddress
            ..fromContent =
                "${fromStation..toString().toLowerCase()} ${fromStationAddress.toLowerCase()}"
            ..fromData = json.encode(fromData)
            ..toData = json.encode(toData)
            ..directions = json.encode(routeResult);

          await isar.writeTxn(() async {
            await isar.directions.put(destination);
          });
        }
      }
    }
    isDirLoading.value = false;
  }

  formatDirection(direction) {
    int dirIndex = directions.indexOf(direction);
    if (direction["travel_mode"] == "WALKING" &&
        dirIndex == directions.length - 1) {
      return DirectionEnd(toStation: searchMain.toString());
    }
    if (direction["travel_mode"] == "WALKING" && dirIndex == 0) {
      return DirectionStart(fromStation: fromStation.toString());
    }
    if (direction["travel_mode"] == "WALKING" &&
        dirIndex != directions.length &&
        dirIndex != 0) {
      int prevLineColor = int.parse(
          "0xff${directions[dirIndex - 1]["transit_details"]["line"]["color"].toString().replaceAll("#", "")}");
      int currLineColor = int.parse(
          "0xff${directions[dirIndex + 1]["transit_details"]["line"]["color"].toString().replaceAll("#", "")}");
      String prevLine = directions[dirIndex - 1]["transit_details"]["line"]
              ["name"] ??
          directions[dirIndex - 1]["transit_details"]["line"]["short_name"];
      String currLine = directions[dirIndex + 1]["transit_details"]["line"]
              ["name"] ??
          directions[dirIndex + 1]["transit_details"]["line"]["short_name"];

      return DirectionInter(
          interchangeStation: direction["html_instructions"]
              .toString()
              .replaceAll("Walk to ", ""),
          prevLine: prevLine,
          prevLineColor: prevLineColor,
          currLine: currLine,
          currLineColor: currLineColor);
    }

    if (direction["travel_mode"] == "TRANSIT") {
      int lineColor = int.parse(
          "0xff${direction["transit_details"]["line"]["color"].toString().replaceAll("#", "")}");
      String lineName = direction["transit_details"]["line"]["name"] ??
          direction["transit_details"]["line"]["short_name"];
      List stations = direction["transit_details"]["line"]["stations"];
      return DirectionTransit(
          duration: direction["duration"]["text"],
          headsign: direction["transit_details"]["headsign"],
          departure: direction["transit_details"]["departure_stop"]["name"],
          arrival: direction["transit_details"]["arrival_stop"]["name"],
          currLine: lineName,
          stations: stations,
          lineColor: lineColor);
    }
  }

  getCarouselIcons(double step) {
    List<Widget> icons = [];
    for (double i = 0; i < directions.length; i++) {
      Color defColor = Color(0xff000000);
      int defSize = 10;
      if (i == step) {
        icons.add(
          const Icon(
            Icons.circle,
            size: 14,
            color: Color(0xffFFBB23),
          ),
        );
      } else {
        icons.add(
          Icon(
            Icons.circle,
            size: 10,
            color: Color(0xff000000).withOpacity(0.4),
          ),
        );
      }
    }
    return icons;
  }

  getInstructions(double step) {
    Map<String, dynamic> direction = directions[step.toInt()];
    if (direction["travel_mode"] == "WALKING" &&
        step == directions.length - 1) {
      double destDistance =
          direction["distance"]["value"] + double.parse(toDistance);
      String lastStation = directions[step.toInt() - 1]["transit_details"]
              ["arrival_stop"]["name"]
          .toString();
      return EndInstruction(
          station: lastStation,
          distance: destDistance.toStringAsFixed(0),
          bannerAd: bannerAd);
    }
    if (direction["travel_mode"] == "WALKING" && step == 0) {
      return StartInstruction(
        station: fromStation.toString(),
        distance: fromDistance,
        bannerAd: bannerAd,
      );
    }
    if (direction["travel_mode"] == "WALKING" &&
        step != directions.length &&
        step != 0) {
      String prevLine = directions[step.toInt() - 1]["transit_details"]["line"]
              ["name"] ??
          directions[step.toInt() - 1]["transit_details"]["line"]["short_name"];
      String currLine = directions[step.toInt() + 1]["transit_details"]["line"]
              ["name"] ??
          directions[step.toInt() + 1]["transit_details"]["line"]["short_name"];
      String interStation = directions[step.toInt() - 1]["transit_details"]
          ["arrival_stop"]["name"];
      return InterInstruction(
        interchange: interStation,
        prevLine: prevLine.toLowerCase(),
        currLine: currLine.toLowerCase(),
        bannerAd: bannerAd,
      );
    }

    if (direction["travel_mode"] == "TRANSIT") {
      String arrStation =
          directions[step.toInt()]["transit_details"]["arrival_stop"]["name"];
      String depStation =
          directions[step.toInt()]["transit_details"]["departure_stop"]["name"];
      String duration = directions[step.toInt()]["duration"]["text"];
      int colourCode = int.parse(
          "0xff${directions[step.toInt()]["transit_details"]["line"]["color"].toString().replaceAll("#", "")}");
      String lineName = directions[step.toInt()]["transit_details"]["line"]
              ["name"] ??
          directions[step.toInt()]["transit_details"]["line"]["short_name"];
      Map<String, dynamic> lineData =
          directions[step.toInt()]["transit_details"]["line"];
      List stations =
          lineData.containsKey("stations") == true ? lineData["stations"] : [];
      if (stations.isEmpty == true) {
        return TransitInstruction(
            headsign: directions[step.toInt()]["transit_details"]["headsign"],
            depStation: depStation,
            arrStation: arrStation,
            duration: duration);
      } else {
        return MetroLine(
            stationsData: stations, lineName: lineName, colourCode: colourCode);
      }
      // return Text(
      //   "Get in the metro rail heading towards ${directions[step.toInt()]["transit_details"]["headsign"]} from $depStation and travel to $arrStation, which would take $duration to reach.",
      //   style: TextStyle(fontSize: 18),
      //   textAlign: TextAlign.center,
      // );

    }
  }

  @override
  void onClose() {
    bannerAd?.dispose();

    super.onClose();
  }
}
