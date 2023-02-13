// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:app/features/directions/data/models/route_direction.dart';

class MetroRoute extends Equatable {
  final String routeCost;
  List<MetroDirection> route;
  String data;

  MetroRoute({
    required this.routeCost,
    required this.route,
    required this.data,
  });

  @override
  List<Object> get props => [routeCost, route, data];

  factory MetroRoute.initial() {
    return MetroRoute(routeCost: "", route: [], data: "");
  }

  factory MetroRoute.fromMap(Map<String, dynamic> map) {
    List<dynamic> route = map["routes"][0]["legs"][0]["steps"];
    String routeCost = map["routes"][0].containsKey("fare") == true
        ? map["routes"][0]["fare"]["text"]
        : "NA";
    List<MetroDirection> directions = [];
    late MetroDirection direction;
    for (var i = 0; i <= route.length - 1; i++) {
      if (route[i]["travel_mode"] == "TRANSIT") {
        if (route[i]["transit_details"]["line"]["vehicle"]["type"] ==
            "SUBWAY") {
          direction = MetroDirection.fromJson(json.encode(route[i]));
          directions.add(direction);
        }
      }
      if (route[i]["travel_mode"] == "WALKING" && i == 0) {
        route[i]["departure_station"] =
            map["routes"][0]["legs"][0]["start_address"];
        direction = MetroDirection.fromJson(json.encode(route[i]));

        directions.add(direction);
      }
      // else if (route[i]["travel_mode"] == "WALKING" &&
      //     i == route.length - 1) {
      //   route[i]["arrival_station"] =
      //       map["routes"][0]["legs"][0]["end_address"];
      //   direction = MetroDirection.fromJson(json.encode(route[i]));
      //   directions.add(direction);
      // }
      else if (route[i]["travel_mode"] == "WALKING" &&
          route[i - 1]["travel_mode"] == "TRANSIT" &&
          route[i == route.length - 1 ? i : i + 1]["travel_mode"] ==
              "TRANSIT") {
        if (route[i - 1]["transit_details"]["line"]["vehicle"]["type"] ==
                "SUBWAY" &&
            route[i + 1]["transit_details"]["line"]["vehicle"]["type"] ==
                "SUBWAY") {
          direction = MetroDirection.fromJson(json.encode(route[i]));
          directions.add(direction);
        }
      }
    }
    return MetroRoute(
        routeCost: routeCost, route: directions, data: json.encode(map));
  }

  factory MetroRoute.fromJson(String source) =>
      MetroRoute.fromMap(json.decode(source) as Map<String, dynamic>);
}
