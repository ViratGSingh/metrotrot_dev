import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/home/data/datasources/home_constants.dart';

class DestMetroService {
  final http.Client httpClient;

  DestMetroService({required this.httpClient});
  Future fetchDestInfo(String placeId) async {
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    final String apiHost = dotenv.env["MAPS_API_HOST"].toString();
    Uri requestUri = Uri(
        scheme: 'https',
        host: apiHost,
        path: "/maps/api/place/details/json",
        queryParameters: {
          "key": apiKey,
          "place_id": placeId,
          "fields": "geometry",
        });

    final http.Response response = await httpClient.get(requestUri);

    final responseBody = json.decode(response.body);

    double destLat = responseBody["result"]["geometry"]["location"]["lat"];
    double destLng = responseBody["result"]["geometry"]["location"]["lng"];
    return [destLat, destLng];
  }

  Future<DestMetro> getDestNearestMetro(String placeId) async {
    Map<String, dynamic> location = {};
    final String apiKey = dotenv.env["MAPS_API_KEY"].toString();
    final String apiHost = dotenv.env["MAPS_API_HOST"].toString();
    //Get Destination Coord
    Uri requestUri = Uri(
        scheme: 'https',
        host: apiHost,
        path: "/maps/api/place/details/json",
        queryParameters: {
          "key": apiKey,
          "place_id": placeId,
          "fields": "geometry",
        });

    final http.Response response = await httpClient.get(requestUri);

    final responseBody = json.decode(response.body);

    Map<String, dynamic> destCoord = responseBody["result"]["geometry"];

    //Get Metro Nearby
    final Uri placeReqUri = Uri(
        scheme: 'https',
        host: apiHost,
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

    //Find metro station nearby
    requestUri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: "/maps/api/place/nearbysearch/json",
        queryParameters: {
          "key": apiKey,
          "keyword": "metro station",
          "location":
              "${location["lat"].toString()},${location["lng"].toString()}",
          "type": "subway_station",
          "rankby": "distance"
        });

    try {
      final http.Response response = await httpClient.get(requestUri);

      // if (response.statusCode != 200) {
      //   throw httpErrorHandler(response);
      // }

      final responseBody = json.decode(response.body);
      final List fromMetros = responseBody["results"];
      fromMetros.first["destination"] = destCoord;

      final DestMetro fromNearestMetro =
          DestMetro.fromJson(json.encode(fromMetros.first));

      return fromNearestMetro;
    } catch (e) {
      rethrow;
    }
  }
}
