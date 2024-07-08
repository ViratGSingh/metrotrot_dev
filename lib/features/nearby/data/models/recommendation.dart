// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String main;
  final String secondary;
  final String placeId;
  const Recommendation({
    required this.placeId,
    required this.main,
    required this.secondary,
  });

  @override
  List<Object> get props {
    return [placeId, main, secondary];
  }

  factory Recommendation.initial() {
    return const Recommendation(
      placeId: "",
      main: "",
      secondary: "",
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'place_id': placeId,
      'main': main,
      'secondary': secondary,
    };
  }

  factory Recommendation.fromMap(Map<String, dynamic> map) {
    String main;
    String secondary;
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
    return Recommendation(
      placeId: map['place_id'] as String,
      main: main,
      secondary: secondary,
    );
  }

  factory Recommendation.fromJson(String source) =>
      Recommendation.fromMap(json.decode(source) as Map<String, dynamic>);
}
