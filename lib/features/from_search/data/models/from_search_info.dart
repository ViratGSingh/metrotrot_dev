import 'package:isar/isar.dart';

part 'from_search_info.g.dart';

@collection
class FromSearchInfo {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  bool? isLimitreached;
  int? totalFavourites;
  int? totalRecommendations;
  DateTime? startedAt;
  DateTime? updatedAt;

}
