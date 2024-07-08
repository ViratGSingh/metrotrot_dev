import 'package:isar/isar.dart';

part 'from_fav_recom.g.dart';

@collection
class SavedFromRecommendation {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? placeId;
  String? main;
  String? secondary;
  bool? isFavourite;
  int? totaltaps;
  DateTime? firstTapDate;
  DateTime? lastTapDate;
  late String fromContent;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get fromContentWords => fromContent.split(' ');
}
