// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class ToRecommendation extends Equatable {
  String main;
  String secondary;
  String placeId;
  ToRecommendation({
    required this.placeId,
    required this.main,
    required this.secondary,
  });

  @override
  List<Object> get props {
    return [placeId, main, secondary];
  }

  factory ToRecommendation.initial() {
    return ToRecommendation(
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

  factory ToRecommendation.fromMap(Map<String, dynamic> map) {
    String main = "";
    String secondary = "";
    if (map.containsKey("structured_formatting") == true) {
      main = map["structured_formatting"]['main_text'];
      secondary = map["structured_formatting"]['secondary_text'];
    }
    return ToRecommendation(
      placeId: map['place_id'] as String,
      main: main,
      secondary: secondary,
    );
  }

  factory ToRecommendation.fromJson(String source) =>
      ToRecommendation.fromMap(json.decode(source) as Map<String, dynamic>);
}
