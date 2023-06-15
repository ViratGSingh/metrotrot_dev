import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/home/data/datasources/home_constants.dart';

class NearbyMetroService {
  final http.Client httpClient;

  NearbyMetroService({required this.httpClient});

  Future<FromMetro> getNearestMetro(double lat, double lng) async {
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    //Find metro station nearby
    final Uri requestUri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: "/maps/api/place/nearbysearch/json",
        queryParameters: {
          "key": apiKey,
          "keyword": "metro station",
          "location": "${lat.toString()},${lng.toString()}",
          "type": "subway_station",
          "rankby": "distance"
        });

    try {
      final http.Response response = await httpClient.get(requestUri);

      // if (response.statusCode != 200) {
      //   throw httpErrorHandler(response);
      // }

      final responseBody = json.decode(response.body);
      final List nearbyMetros = responseBody["results"];

      final FromMetro fromNearestMetro =
          FromMetro.fromJson(json.encode(nearbyMetros.first));

      return fromNearestMetro;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String,dynamic>> getFromNearestMetro(String placeId) async {
    Map<String, dynamic> location = {};
    //Get coordinates
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    final Uri placeReqUri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: "/maps/api/place/details/json",
        queryParameters: {
          "place_id": placeId,
          "key": apiKey,
          "fields": "geometry"
        });
    final http.Response placeResp = await httpClient.get(placeReqUri);
    final Map<String, dynamic> placeData = json.decode(placeResp.body);
    if (placeData.containsKey("result") == true) {
      location = placeData["result"]["geometry"]["location"];
    }
    return location;


    // //Find metro station nearby
    // final Uri requestUri = Uri(
    //     scheme: 'https',
    //     host: kApiHost,
    //     path: "/maps/api/place/nearbysearch/json",
    //     queryParameters: {
    //       "key": apiKey,
    //       "keyword": "metro station",
    //       "location":
    //           "${location["lat"].toString()},${location["lng"].toString()}",
    //       "type": "subway_station",
    //       "rankby": "distance"
    //     });

    // try {
    //   final http.Response response = await httpClient.get(requestUri);

    //   // if (response.statusCode != 200) {
    //   //   throw httpErrorHandler(response);
    //   // }

    //   final responseBody = json.decode(response.body);
    //   final List fromMetros = responseBody["results"];

    //   final FromMetro fromNearestMetro =
    //       FromMetro.fromJson(json.encode(fromMetros.first));

    //   return fromNearestMetro;
    // } catch (e) {
    //   rethrow;
    // }
  }
}
