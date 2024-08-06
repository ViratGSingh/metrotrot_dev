import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/from_search/data/datasources/from_search_constants.dart';
import 'package:app/features/from_search/data/models/from_recommendation.dart';

class FromSearchService {
  final http.Client httpClient;

  FromSearchService({required this.httpClient});

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
          "locationrestriction": "circle:52000@28.4020,76.8260",
          "key": apiKey,
        });

    try {
      final http.Response response = await httpClient.get(requestUri);

      final responseBody = json.decode(response.body);
      print(responseBody);
      final List<dynamic> locations = responseBody["predictions"];
      List<FromRecommendation> formattedLocs = [];
      locations.forEach((element) {
        FromRecommendation formattedLoc =
            FromRecommendation.fromJson(json.encode(element));
        formattedLocs.add(formattedLoc);
      });

      return formattedLocs;
    } catch (e) {
      rethrow;
    }
  }
}
