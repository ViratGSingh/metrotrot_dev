// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class MetroDirection extends Equatable {
  final String travelMode;
  final String vehicleType;
  final String metro;
  final String departureName;
  final String platform;
  final String arrivalName;
  String currLineName;
  final int currLineColour;
  final String interchange;
  final String duration;
  final String headsign;
  final int stops;
  List stations;

  MetroDirection({
    required this.travelMode,
    required this.vehicleType,
    required this.metro,
    required this.departureName,
    required this.arrivalName,
    required this.currLineName,
    required this.currLineColour,
    required this.interchange,
    required this.duration,
    required this.headsign,
    required this.stations,
    required this.platform,
    required this.stops,
  });

  @override
  List<Object> get props {
    return [
      travelMode,
      vehicleType,
      metro,
      departureName,
      arrivalName,
      currLineName,
      currLineColour,
      stations,
      interchange,
      platform
    ];
  }

  factory MetroDirection.initial() {
    return MetroDirection(
        stops:0,
        travelMode: "",
        vehicleType: "",
        duration: "",
        headsign: "",
        metro: "",
        departureName: "",
        arrivalName: "",
        currLineName: "",
        currLineColour: 0,
        stations: [],
        platform: "",
        interchange: "");
  }

  factory MetroDirection.fromMap(Map<String, dynamic> map) {
    String vehicleType = "";
    String metro = "";
    String departureName = "";
    String arrivalName = "";
    String currLineName = "";
    int currLineColour = 0;
    String headsign = "";
    List stations = [];
    if (map["travel_mode"] == "WALKING" &&
        map.containsKey("departure_station") == true) {
      departureName = map["departure_station"];
    } else if (map["travel_mode"] == "WALKING" &&
        map.containsKey("arrival_station") == true) {
      arrivalName = map["arrival_station"];
    }

    if (map["travel_mode"] == "TRANSIT" &&
        map.containsKey("transit_details") == true) {
      if (map["transit_details"]["line"]["vehicle"]["type"] == "SUBWAY") {
        vehicleType = map["transit_details"]["line"]["vehicle"]["type"];
        metro = map["transit_details"]["line"]["agencies"][0]["name"]
            .toString()
            .toLowerCase();
        departureName = map["transit_details"]["departure_stop"]["name"];
        arrivalName = map["transit_details"]["arrival_stop"]["name"];
        currLineName = map["transit_details"]["line"]["name"] ??
            map["transit_details"]["line"]["short_name"];
        headsign = map["transit_details"]["headsign"];
        currLineColour = int.parse(
            "0xff${map["transit_details"]["line"]["color"].toString().replaceAll("#", "")}");
        if (map["transit_details"]["line"]["stations"] != null) {
          stations = map["transit_details"]["line"]["stations"];
        }
      }
    }
    return MetroDirection(
      stops:0,
        travelMode: map["travel_mode"],
        vehicleType: vehicleType,
        metro: metro,
        interchange:
            map["html_instructions"].toString().replaceAll("Walk to ", ""),
        departureName: departureName,
        arrivalName: arrivalName,
        currLineName: currLineName,
        duration: map["duration"]["text"],
        headsign: headsign,
        currLineColour: currLineColour,
        platform:"",
        stations: stations);
  }

  factory MetroDirection.fromJson(String source) =>
      MetroDirection.fromMap(json.decode(source) as Map<String, dynamic>);
}
