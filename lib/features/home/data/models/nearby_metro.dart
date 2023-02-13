// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NearbyMetro extends Equatable {
  final String businessStatus;
  final double lat;
  final double lng;
  final String name;
  final String placeId;
  final String rating;
  final String userRatingsTotal;
  final String vicinity;

  const NearbyMetro(
      {required this.businessStatus,
      required this.lat,
      required this.lng,
      required this.name,
      required this.placeId,
      required this.rating,
      required this.userRatingsTotal,
      required this.vicinity});

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
      ];

  factory NearbyMetro.initial() {
    return const NearbyMetro(
        businessStatus: "N/A",
        lat: 0,
        lng: 0,
        name: "Metro Missing 😕",
        placeId: "",
        rating: "N/A",
        userRatingsTotal: "N/A",
        vicinity: "Address Unavailable");
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'business_status': businessStatus,
      'lat': lat,
      'lng': lng,
      'name': name,
      'placeId': placeId,
      'rating': rating,
      'user_ratings_total': userRatingsTotal,
      'vicinity': vicinity,
    };
  }

  factory NearbyMetro.fromMap(Map<String, dynamic> map) {
    String status = "N0";
    if (map["business_status"] == "OPERATIONAL") {
      status = "Yes";
    }
    return NearbyMetro(
        businessStatus: status,
        lat: map["geometry"]["location"]["lat"],
        lng: map["geometry"]["location"]["lng"],
        name: map["name"],
        placeId: map["place_id"],
        rating: map["rating"].toString(),
        userRatingsTotal: map["user_ratings_total"].toString(),
        vicinity: map["vicinity"]);
  }

  String toJson() => json.encode(toMap());

  factory NearbyMetro.fromJson(String source) =>
      NearbyMetro.fromMap(json.decode(source) as Map<String, dynamic>);
}
