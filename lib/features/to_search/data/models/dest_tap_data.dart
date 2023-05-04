// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DestTapData extends Equatable {
  String userId;
  String fromMetroBusinessStatus;
  double fromMetroLat;
  double fromMetroLng;
  String fromMetroName;
  String fromMetroPlaceId;
  String fromMetroRating;
  String fromMetroRatedUsers;
  String fromMetroAddress;
  double userLat;
  double userLng;
  String toPlaceId;
  String toName;
  String toAddress;
  int totalTaps;
  DateTime firstTappedAt;
  DateTime lastTappedAt;
  bool isGuest;
  bool? isLiked;

  DestTapData(
      {required this.userId,
      required this.isGuest,
      this.isLiked,
      required this.fromMetroBusinessStatus,
      required this.fromMetroLat,
      required this.fromMetroLng,
      required this.fromMetroName,
      required this.fromMetroPlaceId,
      required this.fromMetroRating,
      required this.fromMetroRatedUsers,
      required this.fromMetroAddress,
      required this.userLat,
      required this.userLng,
      required this.toPlaceId,
      required this.toName,
      required this.toAddress,
      required this.totalTaps,
      required this.firstTappedAt,
      required this.lastTappedAt});

  @override
  List<Object> get props {
    return [
      userId,
      isGuest,
      isLiked??false,
      fromMetroBusinessStatus,
      fromMetroLat,
      fromMetroLng,
      fromMetroName,
      fromMetroPlaceId,
      fromMetroRating,
      fromMetroRatedUsers,
      fromMetroAddress,
      userLat,
      userLng,
      toPlaceId,
      toName,
      toAddress,
      totalTaps,
      firstTappedAt,
      lastTappedAt
    ];
  }

  factory DestTapData.initial() {
    return DestTapData(
        userId: "",
        isGuest: true,
        isLiked: false,
        fromMetroBusinessStatus: "",
        fromMetroLat: 0,
        fromMetroLng: 0,
        fromMetroName: "",
        fromMetroPlaceId: "",
        fromMetroRating: "",
        fromMetroRatedUsers: "",
        fromMetroAddress: "",
        userLat: 0,
        userLng: 0,
        toPlaceId: "",
        toName: "",
        toAddress: "",
        totalTaps: 0,
        firstTappedAt: DateTime.now(),
        lastTappedAt: DateTime.now());
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "user_id":userId,
      "is_guest":isGuest,
      "is_liked":isLiked,
      "from_business_status": fromMetroBusinessStatus,
      "from_lat": fromMetroLat,
      "from_lng": fromMetroLng,
      "from_name": fromMetroName,
      "from_place_id": fromMetroPlaceId,
      "from_rating": fromMetroRating,
      "from_rated_users": fromMetroRatedUsers,
      "from_address": fromMetroAddress,
      "user_lat": userLat,
      "user_lng": userLng,
      "to_place_id": toPlaceId,
      "to_name": toName,
      "to_address": toAddress,
      "total_taps": totalTaps,
      "first_tapped_at": firstTappedAt,
      "last_tapped_at": lastTappedAt
    };
  }

  factory DestTapData.fromMap(Map<String, dynamic> map) {
    Timestamp lastTapped = map["last_tapped_at"];
    Timestamp firstTapped = map["first_tapped_at"];
    
    return DestTapData(
        userId: map["user_id"],
        isGuest: map["is_guest"],
        isLiked: map["is_liked"],
        fromMetroBusinessStatus: map["from_business_status"],
        fromMetroLat: map["from_lat"],
        fromMetroLng: map["from_lng"],
        fromMetroName: map["from_name"],
        fromMetroPlaceId: map["from_place_id"],
        fromMetroRating: map["from_rating"],
        fromMetroRatedUsers: map["from_rated_users"],
        fromMetroAddress: map["from_address"],
        userLat: map["user_lat"],
        userLng: map["user_lng"],
        toPlaceId: map["to_place_id"],
        toName: map["to_name"],
        toAddress: map["to_address"],
        totalTaps: map["total_taps"],
        firstTappedAt: firstTapped.toDate(),
        lastTappedAt: lastTapped.toDate()
        );
  }

  // factory DestTapData.fromJson(String source) =>
  //     DestTapData.fromMap(json.decode(source) as Map<String, dynamic>);
}
