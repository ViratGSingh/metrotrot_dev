import 'package:isar/isar.dart';

part 'dest_search_info.g.dart';

@collection
class DestSearchInfo {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  bool? isLimitreached;
  int? totalFavourites;
  int? totalRecommendations;
  DateTime? startedAt;
  DateTime? updatedAt;

}
