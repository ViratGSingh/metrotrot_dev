import 'dart:convert';

import 'package:app/features/nearby/data/models/recommendation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/home/data/datasources/home_constants.dart';

class NearbyService {
  final http.Client httpClient;

  NearbyService({required this.httpClient});

  Future getSearchRecommendations(String location) async {
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    //Find locations according to string
    final Uri requestUri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: "/maps/api/place/autocomplete/json",
        queryParameters: {
          "input": location,
          "language": "en",
          "region": "in",
          "key": apiKey,
        });

    try {
      final http.Response response = await httpClient.get(requestUri);

      final responseBody = json.decode(response.body);
      final List<dynamic> locations = responseBody["predictions"];
      List<Recommendation> formattedLocs = [];
      for (var element in locations) {
        Recommendation formattedLoc =
            Recommendation.fromJson(json.encode(element));
        formattedLocs.add(formattedLoc);
      }
      return formattedLocs;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getLocationInfo(String placeId) async {
    Map<String, dynamic> locationInfo = {};
    //Get coordinates
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    final Uri placeReqUri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: "/maps/api/place/details/json",
        queryParameters: {
          "place_id": placeId,
          "key": apiKey,
          "fields": "formatted_address,name,geometry"
        });
    final http.Response placeResp = await httpClient.get(placeReqUri);
    final Map<String, dynamic> placeData = json.decode(placeResp.body);
    if (placeData.containsKey("result") == true) {
      locationInfo = placeData["result"];
      //print(placeData);
    }
    return locationInfo;
  }
}
