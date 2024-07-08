import 'package:isar/isar.dart';

part 'to_fav_recom.g.dart';

@collection
class SavedToRecommendation {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? placeId;
  String? main;
  String? secondary;
  bool? isFavourite;
  int? totaltaps;
  DateTime? firstTapDate;
  DateTime? lastTapDate;
  late String destContent;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get destContentWords => destContent.split(' ');
}
