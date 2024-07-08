// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class ToRecommendation extends Equatable {
  String main;
  String secondary;
  String placeId;
  final bool isFavourite;
  ToRecommendation(
      {required this.placeId,
      required this.main,
      required this.secondary,
      this.isFavourite = false});

  @override
  List<Object> get props {
    return [placeId, main, secondary, isFavourite];
  }

  factory ToRecommendation.initial() {
    return ToRecommendation(
        placeId: "", main: "", secondary: "", isFavourite: false);
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'place_id': placeId,
      'main': main,
      'secondary': secondary,
      'isFavourite': isFavourite
    };
  }

  factory ToRecommendation.fromMap(Map<String, dynamic> map) {
    String main = "";
    String secondary = "";
    if (map.containsKey("structured_formatting") == true) {
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
    return ToRecommendation(
        placeId: map['place_id'] as String,
        main: main,
        secondary: secondary,
        isFavourite: isFavourite);
  }

  factory ToRecommendation.fromJson(String source) =>
      ToRecommendation.fromMap(json.decode(source) as Map<String, dynamic>);
}
