import 'dart:convert';
//import 'package:algolia/algolia.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/directions/data/models/route.dart';
import 'package:app/features/directions/data/models/route_direction.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';

class DirectionsService {
  final http.Client httpClient;

  DirectionsService({required this.httpClient});

  // Future<Map<String, dynamic>> getStations(
  //     String metro, String departureName, String arrivalName) async {
  //   Map<String, dynamic> lineResp = {};
  //   Algolia algolia = Algolia.init(
  //     applicationId: dotenv.env["ALGOLIA_ID"].toString(),
  //     apiKey: dotenv.env["ALGOLIA_KEY"].toString(),
  //   );
  //   AlgoliaQuery query = algolia.instance
  //       .index('Metro Lines ')
  //       .query("$metro $departureName $arrivalName");
  //   AlgoliaQuerySnapshot snap = await query.getObjects();
  //   if (snap.hits.isEmpty == false) {
  //     lineResp = snap.hits.first.data;
  //   }

  //   return lineResp;
  // }

  // Future getDirections(FromMetro fromMetro, DestMetro toMetro, String destName,
  //     String destAddress) async {
  //   final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
  //   final String apiHost = dotenv.env["MAPS_API_HOST"].toString();
  //   MetroRoute routeData;
  //   List<MetroDirection> directions = [];
  //   final Uri requestUri = Uri(
  //       scheme: 'https',
  //       host: apiHost,
  //       path: "/maps/api/directions/json",
  //       queryParameters: {
  //         "key": apiKey,
  //         "origin": "place_id:${fromMetro.placeId}",
  //         "destination": "place_id:${toMetro.placeId}",
  //         "transit_mode": "subway",
  //         "mode": "transit",
  //         "transit_routing_preference": "less_walking"
  //       });

  //   final routeResponse = await http.get(requestUri);
  //   Map<String, dynamic> routeResult = json.decode(routeResponse.body);
  //   routeData = MetroRoute.fromJson(json.encode(routeResult));

  //   directions = routeData.route;
  //   //Get Stations Data in Line
  //   for (var i = 0; i <= directions.length - 1; i++) {
  //     if (directions[i].travelMode == "TRANSIT") {
  //       Map<String, dynamic> stationsData = await getStations(
  //           directions[i].metro,
  //           directions[i].departureName,
  //           directions[i].arrivalName);
  //       directions[i].stations = stationsData["stations"];
  //       directions[i].currLineName = stationsData["line"];
  //       routeResult["routes"][0]["legs"][0]["steps"][i]["transit_details"]
  //           ["line"]["stations"] = stationsData["stations"];
  //       routeResult["routes"][0]["legs"][0]["steps"][i]["transit_details"]
  //           ["line"]["name"] = stationsData["line"];
  //     }
  //   }
  //   Map<String, dynamic> routeResultUpdated = routeResult;
  //   routeData.route = directions;
  //   routeData.data = json.encode(routeResultUpdated);
  //   return routeData;
  // }
}
