// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:isar/isar.dart';

part 'dest_metro.g.dart';

class DestMetro extends Equatable {
  final String businessStatus;
  final double destLat;
  final double destLng;
  final String destName;
  final String destAddress;
  final double nearbyMetroLat;
  final double nearbyMetroLng;
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

  const DestMetro({
    required this.businessStatus,
    required this.destLat,
    required this.destLng,
    required this.destName,
    required this.destAddress,
    required this.nearbyMetroLat,
    required this.nearbyMetroLng,
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
    required this.colourCodes,
  });

  @override
  List<Object> get props => [
        businessStatus,
        destLat,
        destLng,
        destName,
        destAddress,
        nearbyMetroLat,
        nearbyMetroLng,
        name,
        placeId,
        rating,
        userRatingsTotal,
        vicinity,
        data,
        metro,
        lines,
        startStations,
        endStations,
        colourCodes
      ];

  factory DestMetro.initial() {
    return const DestMetro(
        businessStatus: "N/A",
        destLat: 0,
        destLng: 0,
        nearbyMetroLat: 0,
        nearbyMetroLng: 0,
        name: "Metro Missing 😕",
        destName: "",
        destAddress: "",
        placeId: "",
        rating: "N/A",
        userRatingsTotal: "N/A",
        vicinity: "Address Unavailable",
        data: "",
        metro: "",
        lines: [],
        startStations: [],
        endStations: [],
        colourCodes: []);
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
        destName: map["destName"],
        destAddress: map["destAddress"],
        placeId: map["place_id"],
        rating: map["rating"].toString(),
        userRatingsTotal: map["user_ratings_total"].toString(),
        vicinity: map["vicinity"],
        data: json.encode(map),
        metro: "",
        lines: [],
        colourCodes: [],
        startStations: [],
        endStations: []);
  }

  factory DestMetro.fromJson(String source) =>
      DestMetro.fromMap(json.decode(source) as Map<String, dynamic>);
}

@collection
class SavedDestMetro {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? businessStatus;
  double? destLat;
  double? destLng;
  String? destName;
  String? destAddress;
  double? nearbyMetroLat;
  double? nearbyMetroLng;
  String? name;
  String? placeId;
  String? rating;
  String? userRatingsTotal;
  String? vicinity;
  String? data;
  String? metro;
  List<String>? lines;
  List<String>? startStations;
  List<String>? endStations;
  List<String>? colourCodes;

  late String destContent;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get destContentWords => destContent.split(' ');
}
