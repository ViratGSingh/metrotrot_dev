// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from_fav_recom.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedFromRecommendationCollection on Isar {
  IsarCollection<SavedFromRecommendation> get savedFromRecommendations =>
      this.collection();
}

const SavedFromRecommendationSchema = CollectionSchema(
  name: r'SavedFromRecommendation',
  id: -6838153132906552980,
  properties: {
    r'firstTapDate': PropertySchema(
      id: 0,
      name: r'firstTapDate',
      type: IsarType.dateTime,
    ),
    r'fromContent': PropertySchema(
      id: 1,
      name: r'fromContent',
      type: IsarType.string,
    ),
    r'fromContentWords': PropertySchema(
      id: 2,
      name: r'fromContentWords',
      type: IsarType.stringList,
    ),
    r'isFavourite': PropertySchema(
      id: 3,
      name: r'isFavourite',
      type: IsarType.bool,
    ),
    r'lastTapDate': PropertySchema(
      id: 4,
      name: r'lastTapDate',
      type: IsarType.dateTime,
    ),
    r'lat': PropertySchema(
      id: 5,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lng': PropertySchema(
      id: 6,
      name: r'lng',
      type: IsarType.double,
    ),
    r'main': PropertySchema(
      id: 7,
      name: r'main',
      type: IsarType.string,
    ),
    r'placeId': PropertySchema(
      id: 8,
      name: r'placeId',
      type: IsarType.string,
    ),
    r'secondary': PropertySchema(
      id: 9,
      name: r'secondary',
      type: IsarType.string,
    ),
    r'totaltaps': PropertySchema(
      id: 10,
      name: r'totaltaps',
      type: IsarType.long,
    )
  },
  estimateSize: _savedFromRecommendationEstimateSize,
  serialize: _savedFromRecommendationSerialize,
  deserialize: _savedFromRecommendationDeserialize,
  deserializeProp: _savedFromRecommendationDeserializeProp,
  idName: r'id',
  indexes: {
    r'fromContentWords': IndexSchema(
      id: -1605500430023194143,
      name: r'fromContentWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fromContentWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _savedFromRecommendationGetId,
  getLinks: _savedFromRecommendationGetLinks,
  attach: _savedFromRecommendationAttach,
  version: '3.1.0+1',
);

int _savedFromRecommendationEstimateSize(
  SavedFromRecommendation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fromContent.length * 3;
  bytesCount += 3 + object.fromContentWords.length * 3;
  {
    for (var i = 0; i < object.fromContentWords.length; i++) {
      final value = object.fromContentWords[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.main;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.placeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.secondary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _savedFromRecommendationSerialize(
  SavedFromRecommendation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.firstTapDate);
  writer.writeString(offsets[1], object.fromContent);
  writer.writeStringList(offsets[2], object.fromContentWords);
  writer.writeBool(offsets[3], object.isFavourite);
  writer.writeDateTime(offsets[4], object.lastTapDate);
  writer.writeDouble(offsets[5], object.lat);
  writer.writeDouble(offsets[6], object.lng);
  writer.writeString(offsets[7], object.main);
  writer.writeString(offsets[8], object.placeId);
  writer.writeString(offsets[9], object.secondary);
  writer.writeLong(offsets[10], object.totaltaps);
}

SavedFromRecommendation _savedFromRecommendationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedFromRecommendation();
  object.firstTapDate = reader.readDateTimeOrNull(offsets[0]);
  object.fromContent = reader.readString(offsets[1]);
  object.id = id;
  object.isFavourite = reader.readBoolOrNull(offsets[3]);
  object.lastTapDate = reader.readDateTimeOrNull(offsets[4]);
  object.lat = reader.readDoubleOrNull(offsets[5]);
  object.lng = reader.readDoubleOrNull(offsets[6]);
  object.main = reader.readStringOrNull(offsets[7]);
  object.placeId = reader.readStringOrNull(offsets[8]);
  object.secondary = reader.readStringOrNull(offsets[9]);
  object.totaltaps = reader.readLongOrNull(offsets[10]);
  return object;
}

P _savedFromRecommendationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedFromRecommendationGetId(SavedFromRecommendation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedFromRecommendationGetLinks(
    SavedFromRecommendation object) {
  return [];
}

void _savedFromRecommendationAttach(
    IsarCollection<dynamic> col, Id id, SavedFromRecommendation object) {
  object.id = id;
}

extension SavedFromRecommendationQueryWhereSort
    on QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QWhere> {
  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterWhere>
      anyFromContentWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fromContentWords'),
      );
    });
  }
}

extension SavedFromRecommendationQueryWhere on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QWhereClause> {
  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterWhereClause>
      fromContentWordsElementEqualTo(String fromContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromContentWords',
        value: [fromContentWordsElement],
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterWhereClause>
      fromContentWordsElementNotEqualTo(String fromContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromContentWords',
              lower: [],
              upper: [fromContentWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromContentWords',
              lower: [fromContentWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromContentWords',
              lower: [fromContentWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromContentWords',
              lower: [],
              upper: [fromContentWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> fromContentWordsElementGreaterThan(
    String fromContentWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fromContentWords',
        lower: [fromContentWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> fromContentWordsElementLessThan(
    String fromContentWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fromContentWords',
        lower: [],
        upper: [fromContentWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> fromContentWordsElementBetween(
    String lowerFromContentWordsElement,
    String upperFromContentWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fromContentWords',
        lower: [lowerFromContentWordsElement],
        includeLower: includeLower,
        upper: [upperFromContentWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterWhereClause>
      fromContentWordsElementStartsWith(String FromContentWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fromContentWords',
        lower: [FromContentWordsElementPrefix],
        upper: ['$FromContentWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> fromContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromContentWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterWhereClause> fromContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'fromContentWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'fromContentWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'fromContentWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'fromContentWords',
              upper: [''],
            ));
      }
    });
  }
}

extension SavedFromRecommendationQueryFilter on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QFilterCondition> {
  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> firstTapDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstTapDate',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> firstTapDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstTapDate',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> firstTapDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> firstTapDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> firstTapDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> firstTapDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstTapDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      fromContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      fromContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromContentWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      fromContentWordsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      fromContentWordsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromContentWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fromContentWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fromContentWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fromContentWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fromContentWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fromContentWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> fromContentWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fromContentWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> isFavouriteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFavourite',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> isFavouriteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFavourite',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> isFavouriteEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavourite',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lastTapDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTapDate',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lastTapDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTapDate',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lastTapDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lastTapDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lastTapDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lastTapDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTapDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> lngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'main',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'main',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'main',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'main',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'main',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'main',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'main',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'main',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      mainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'main',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      mainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'main',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'main',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> mainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'main',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'placeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      placeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      placeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> placeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'secondary',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'secondary',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secondary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'secondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'secondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      secondaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'secondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
          QAfterFilterCondition>
      secondaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'secondary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondary',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> secondaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'secondary',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> totaltapsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totaltaps',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> totaltapsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totaltaps',
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> totaltapsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totaltaps',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> totaltapsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totaltaps',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> totaltapsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totaltaps',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation,
      QAfterFilterCondition> totaltapsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totaltaps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SavedFromRecommendationQueryObject on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QFilterCondition> {}

extension SavedFromRecommendationQueryLinks on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QFilterCondition> {}

extension SavedFromRecommendationQuerySortBy
    on QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QSortBy> {
  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByFirstTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByFirstTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByFromContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByFromContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByLastTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByLastTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortBySecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortBySecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByTotaltaps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      sortByTotaltapsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.desc);
    });
  }
}

extension SavedFromRecommendationQuerySortThenBy on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QSortThenBy> {
  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByFirstTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByFirstTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByFromContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByFromContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByLastTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByLastTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenBySecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenBySecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.desc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByTotaltaps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.asc);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QAfterSortBy>
      thenByTotaltapsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.desc);
    });
  }
}

extension SavedFromRecommendationQueryWhereDistinct on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QDistinct> {
  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByFirstTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstTapDate');
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByFromContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByFromContentWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromContentWords');
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavourite');
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByLastTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTapDate');
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lng');
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByMain({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'main', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByPlaceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctBySecondary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromRecommendation, SavedFromRecommendation, QDistinct>
      distinctByTotaltaps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totaltaps');
    });
  }
}

extension SavedFromRecommendationQueryProperty on QueryBuilder<
    SavedFromRecommendation, SavedFromRecommendation, QQueryProperty> {
  QueryBuilder<SavedFromRecommendation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedFromRecommendation, DateTime?, QQueryOperations>
      firstTapDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstTapDate');
    });
  }

  QueryBuilder<SavedFromRecommendation, String, QQueryOperations>
      fromContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromContent');
    });
  }

  QueryBuilder<SavedFromRecommendation, List<String>, QQueryOperations>
      fromContentWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromContentWords');
    });
  }

  QueryBuilder<SavedFromRecommendation, bool?, QQueryOperations>
      isFavouriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavourite');
    });
  }

  QueryBuilder<SavedFromRecommendation, DateTime?, QQueryOperations>
      lastTapDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTapDate');
    });
  }

  QueryBuilder<SavedFromRecommendation, double?, QQueryOperations>
      latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<SavedFromRecommendation, double?, QQueryOperations>
      lngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lng');
    });
  }

  QueryBuilder<SavedFromRecommendation, String?, QQueryOperations>
      mainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'main');
    });
  }

  QueryBuilder<SavedFromRecommendation, String?, QQueryOperations>
      placeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placeId');
    });
  }

  QueryBuilder<SavedFromRecommendation, String?, QQueryOperations>
      secondaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondary');
    });
  }

  QueryBuilder<SavedFromRecommendation, int?, QQueryOperations>
      totaltapsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totaltaps');
    });
  }
}
