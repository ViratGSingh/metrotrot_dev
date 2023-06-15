// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FromMetro extends Equatable {
  final String businessStatus;
  final double lat;
  final double lng;
  final String name;
  final String placeId;
  final String rating;
  final String userRatingsTotal;
  final String vicinity;
  final String data;
  final String metro;
  final List<String> lines;
  final List<String> startStations;
  final List<String> endStations;
  final List<String> colourCodes;

  const FromMetro({
    required this.businessStatus,
    required this.lat,
    required this.lng,
    required this.name,
    required this.placeId,
    required this.rating,
    required this.userRatingsTotal,
    required this.vicinity,
    required this.data,
    required this.metro,
    required this.lines,
    required this.startStations,
    required this.endStations,
    required this.colourCodes
  });

  @override
  List<Object> get props => [
        businessStatus,
        lat,
        lng,
        name,
        placeId,
        rating,
        userRatingsTotal,
        vicinity,
        data,
        metro,
        lines,
        colourCodes,
        startStations,
        endStations
      ];

  factory FromMetro.initial() {
    return const FromMetro(
        businessStatus: "N/A",
        lat: 0,
        lng: 0,
        name: "Metro Missing 😕",
        placeId: "",
        rating: "N/A",
        userRatingsTotal: "N/A",
        vicinity: "Address Unavailable",
        data: "",
        metro:"N/A",
        lines:["Unknown"],
        colourCodes: ["000000"],
        startStations: ["Start"],
        endStations: ["End"]
        );
  }

  factory FromMetro.fromMap(Map<String, dynamic> map) {
    return FromMetro(
        businessStatus: map["business_status"] == "OPERATIONAL" ? "Yes" : "No",
        lat: map["geometry"]["location"]["lat"],
        lng: map["geometry"]["location"]["lng"],
        name: map["name"],
        placeId: map["place_id"],
        rating: map["rating"].toString(),
        userRatingsTotal: map["user_ratings_total"].toString(),
        vicinity: map["vicinity"],
        data: json.encode(map),
        metro: "",
        lines: [],
        colourCodes: [],
        startStations: [],
        endStations: []
        );
  }

  factory FromMetro.fromJson(String source) =>
      FromMetro.fromMap(json.decode(source) as Map<String, dynamic>);
}
