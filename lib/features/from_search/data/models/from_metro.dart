// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:isar/isar.dart';

part 'from_metro.g.dart';

class FromMetro extends Equatable {
  final String businessStatus;
  final double fromLat;
  final double fromLng;
  final double lat;
  final double lng;
  final String name;
  final String fromName;
  final String fromAddress;
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

  const FromMetro(
      {required this.businessStatus,
      required this.fromLat,
      required this.fromLng,
      required this.lat,
      required this.lng,
      required this.name,
      required this.fromName,
      required this.fromAddress,
      required this.placeId,
      required this.rating,
      required this.userRatingsTotal,
      required this.vicinity,
      required this.data,
      required this.metro,
      required this.lines,
      required this.startStations,
      required this.endStations,
      required this.colourCodes});

  @override
  List<Object> get props => [
        businessStatus,
        fromLat,
        fromLng,
        lat,
        lng,
        name,
        fromName,
        fromAddress,
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
        fromLat: 0,
        fromLng: 0,
        lat: 0,
        lng: 0,
        fromName: "",
        fromAddress: "",
        name: "Metro Missing 😕",
        placeId: "",
        rating: "N/A",
        userRatingsTotal: "N/A",
        vicinity: "Address Unavailable",
        data: "",
        metro: "N/A",
        lines: ["Unknown"],
        colourCodes: ["000000"],
        startStations: ["Start"],
        endStations: ["End"]);
  }

  factory FromMetro.fromMap(Map<String, dynamic> map) {
    return FromMetro(
        businessStatus: map["business_status"] == "OPERATIONAL" ? "Yes" : "No",
        fromLat: 0,
        fromLng: 0,
        lat: map["geometry"]["location"]["lat"],
        lng: map["geometry"]["location"]["lng"],
        name: map["name"],
        fromName: map["fromName"],
        fromAddress: map["fromAddress"],
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

  factory FromMetro.fromJson(String source) =>
      FromMetro.fromMap(json.decode(source) as Map<String, dynamic>);
}

@collection
class SavedFromMetro {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? businessStatus;
  double? fromLat;
  double? fromLng;
  double? lat;
  double? lng;
  String? name;
  String? fromName;
  String? fromAddress;
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

  late String fromContent;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get fromContentWords => fromContent.split(' ');
}
