import 'package:isar/isar.dart';

part 'directions.g.dart';

@collection
class Directions {
  Id? id;
  DateTime? time;
  String? fromId;
  String? toId;
  String? destMain;
  String? destSecondary;
  late String destContent;
  String? fromMain;
  String? fromSecondary;
  late String fromContent;
  String? fromData;
  String? toData;
  String? directions;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get fromContentWords => fromContent.split(' ');

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get contentWords => destContent.split(' ');
}
