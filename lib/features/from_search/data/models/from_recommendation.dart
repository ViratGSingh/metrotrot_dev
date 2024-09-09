// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class FromRecommendation extends Equatable {
  final String main;
  final String secondary;
  final String placeId;
  final double lat;
  final double lng;
  final bool isFavourite;
  const FromRecommendation(
      {required this.placeId,
      required this.main,
      required this.secondary,
      this.lat=0,
      this.lng=0,
      this.isFavourite = false});

  @override
  List<Object> get props {
    return [placeId, main, secondary, lat, lng, isFavourite];
  }

  factory FromRecommendation.initial() {
    return const FromRecommendation(
        placeId: "", main: "", secondary: "",lat: 0, lng: 0,  isFavourite: false);
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'place_id': placeId,
      'main': main,
      'secondary': secondary,
      'lat':lat,
      'lng':lng,
      'isFavourite': isFavourite
    };
  }

  factory FromRecommendation.fromMap(Map<String, dynamic> map) {
    String main;
    String secondary;
    double lat = 0;
    double lng = 0;
    if (map.containsKey("structured_formatting") == false) {
      main = map["name"];
      secondary = map["vicinity"];
    } else {
      main = map["structured_formatting"].containsKey("main_text") == false
          ? ""
          : map["structured_formatting"]['main_text'];
      secondary =
          map["structured_formatting"].containsKey("secondary_text") == false
              ? ""
              : map["structured_formatting"]['secondary_text'];
    }
    bool isFavourite = false;
    if (map.containsKey("is_favourite") == true) {
      isFavourite = map["is_favourite"];
    }
    if (map.containsKey("geometry") == true) {
      lat = map["geometry"]["location"]["lat"];
      lng = map["geometry"]["location"]["lng"];
    }
    return FromRecommendation(
        placeId: map['place_id'] as String,
        main: main,
        secondary: secondary,
        lat:lat,
        lng:lng,
        isFavourite: isFavourite);
  }

  factory FromRecommendation.fromJson(String source) =>
      FromRecommendation.fromMap(json.decode(source) as Map<String, dynamic>);
}
