// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class DestMetro extends Equatable {
  final String businessStatus;
  final double destLat;
  final double destLng;
  final double nearbyMetroLat;
  final double nearbyMetroLng;
  final String name;
  final String placeId;
  final String rating;
  final String userRatingsTotal;
  final String vicinity;
  final String data;

  const DestMetro({
    required this.businessStatus,
    required this.destLat,
    required this.destLng,
    required this.nearbyMetroLat,
    required this.nearbyMetroLng,
    required this.name,
    required this.placeId,
    required this.rating,
    required this.userRatingsTotal,
    required this.vicinity,
    required this.data,
  });

  @override
  List<Object> get props => [
        businessStatus,
        destLat,
        destLng,
        nearbyMetroLat,
        nearbyMetroLng,
        name,
        placeId,
        rating,
        userRatingsTotal,
        vicinity,
        data
      ];

  factory DestMetro.initial() {
    return const DestMetro(
        businessStatus: "N/A",
        destLat: 0,
        destLng: 0,
        nearbyMetroLat: 0,
        nearbyMetroLng: 0,
        name: "Metro Missing 😕",
        placeId: "",
        rating: "N/A",
        userRatingsTotal: "N/A",
        vicinity: "Address Unavailable",
        data: "");
  }

  factory DestMetro.fromMap(Map<String, dynamic> map) {
    String status = "N0";
    if (map["business_status"] == "OPERATIONAL") {
      status = "Yes";
    }
    return DestMetro(
        businessStatus: status,
        destLat: map["destination"]["location"]["lat"],
        destLng: map["destination"]["location"]["lng"],
        nearbyMetroLat: map["geometry"]["location"]["lat"],
        nearbyMetroLng: map["geometry"]["location"]["lng"],
        name: map["name"],
        placeId: map["place_id"],
        rating: map["rating"].toString(),
        userRatingsTotal: map["user_ratings_total"].toString(),
        vicinity: map["vicinity"],
        data: json.encode(map));
  }

  factory DestMetro.fromJson(String source) =>
      DestMetro.fromMap(json.decode(source) as Map<String, dynamic>);
}
