import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/to_search/data/models/recommendation.dart';

class ToSearchService {
  final http.Client httpClient;
  ToSearchService({required this.httpClient});

  Future<Map<String, dynamic>> getNearestMetro(String placeId) async {
    Map<String, dynamic> locationInfo = {};
    //Get coordinates
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    final String apiHost = dotenv.env["MAPS_API_HOST"].toString();
    final Uri placeReqUri = Uri(
        scheme: 'https',
        host: apiHost,
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
      print(placeData);
    }
    return locationInfo;
  }

  Future<List<ToRecommendation>> getSearchRecommendations(
      String location) async {
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    final String apiHost = dotenv.env["MAPS_API_HOST"].toString();
    //Find locations according to string
    final Uri requestUri = Uri(
        scheme: 'https',
        host: apiHost,
        path: "/maps/api/place/autocomplete/json",
        queryParameters: {
          "input": location,
          "language": "en",
          "region": "in",
          //"locationrestriction": "circle:52000@28.4020,76.8260",
          "key": apiKey
        });

    try {
      final http.Response response = await httpClient.get(requestUri);

      final responseBody = json.decode(response.body);
      final List<dynamic> locations = responseBody["predictions"];
      List<ToRecommendation> formattedLocs = [];
      for (var element in locations) {
        ToRecommendation formattedLoc =
            ToRecommendation.fromJson(json.encode(element));
        formattedLocs.add(formattedLoc);
      }

      return formattedLocs;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ToRecommendation>> getAltSearchRecommendations(
      String location) async {
    final String apiKey = dotenv.env["OLA_MAPS_API_KEY"].toString();
    final String apiHost = dotenv.env["OLA_MAPS_API_HOST"].toString();
    //Find locations according to string
    final Uri requestUri = Uri(
        scheme: 'https',
        host: apiHost,
        path: "/places/v1/autocomplete",
        queryParameters: {
          "input": location,
          // "language": "en",
          // "region": "in",
          //"locationrestriction": "circle:52000@28.4020,76.8260",
          "api_key": apiKey
        });

    try {
      final http.Response response = await httpClient.get(requestUri);

      final responseBody = json.decode(response.body);
      print(responseBody);
      final List<dynamic> locations = responseBody["predictions"];
      List<ToRecommendation> formattedLocs = [];
      for (var element in locations) {
        ToRecommendation formattedLoc =
            ToRecommendation.fromJson(json.encode(element));
        formattedLocs.add(formattedLoc);
      }

      return formattedLocs;
    } catch (e) {
      rethrow;
    }
  }
}
