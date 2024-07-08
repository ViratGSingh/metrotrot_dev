// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_fav_recom.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSavedToRecommendationCollection on Isar {
  IsarCollection<SavedToRecommendation> get savedToRecommendations =>
      this.collection();
}

const SavedToRecommendationSchema = CollectionSchema(
  name: r'SavedToRecommendation',
  id: -7364285296629069997,
  properties: {
    r'destContent': PropertySchema(
      id: 0,
      name: r'destContent',
      type: IsarType.string,
    ),
    r'destContentWords': PropertySchema(
      id: 1,
      name: r'destContentWords',
      type: IsarType.stringList,
    ),
    r'firstTapDate': PropertySchema(
      id: 2,
      name: r'firstTapDate',
      type: IsarType.dateTime,
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
    r'main': PropertySchema(
      id: 5,
      name: r'main',
      type: IsarType.string,
    ),
    r'placeId': PropertySchema(
      id: 6,
      name: r'placeId',
      type: IsarType.string,
    ),
    r'secondary': PropertySchema(
      id: 7,
      name: r'secondary',
      type: IsarType.string,
    ),
    r'totaltaps': PropertySchema(
      id: 8,
      name: r'totaltaps',
      type: IsarType.long,
    )
  },
  estimateSize: _savedToRecommendationEstimateSize,
  serialize: _savedToRecommendationSerialize,
  deserialize: _savedToRecommendationDeserialize,
  deserializeProp: _savedToRecommendationDeserializeProp,
  idName: r'id',
  indexes: {
    r'destContentWords': IndexSchema(
      id: -933826409717927512,
      name: r'destContentWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'destContentWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _savedToRecommendationGetId,
  getLinks: _savedToRecommendationGetLinks,
  attach: _savedToRecommendationAttach,
  version: '3.0.5',
);

int _savedToRecommendationEstimateSize(
  SavedToRecommendation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.destContent.length * 3;
  bytesCount += 3 + object.destContentWords.length * 3;
  {
    for (var i = 0; i < object.destContentWords.length; i++) {
      final value = object.destContentWords[i];
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

void _savedToRecommendationSerialize(
  SavedToRecommendation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.destContent);
  writer.writeStringList(offsets[1], object.destContentWords);
  writer.writeDateTime(offsets[2], object.firstTapDate);
  writer.writeBool(offsets[3], object.isFavourite);
  writer.writeDateTime(offsets[4], object.lastTapDate);
  writer.writeString(offsets[5], object.main);
  writer.writeString(offsets[6], object.placeId);
  writer.writeString(offsets[7], object.secondary);
  writer.writeLong(offsets[8], object.totaltaps);
}

SavedToRecommendation _savedToRecommendationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedToRecommendation();
  object.destContent = reader.readString(offsets[0]);
  object.firstTapDate = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isFavourite = reader.readBoolOrNull(offsets[3]);
  object.lastTapDate = reader.readDateTimeOrNull(offsets[4]);
  object.main = reader.readStringOrNull(offsets[5]);
  object.placeId = reader.readStringOrNull(offsets[6]);
  object.secondary = reader.readStringOrNull(offsets[7]);
  object.totaltaps = reader.readLongOrNull(offsets[8]);
  return object;
}

P _savedToRecommendationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedToRecommendationGetId(SavedToRecommendation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedToRecommendationGetLinks(
    SavedToRecommendation object) {
  return [];
}

void _savedToRecommendationAttach(
    IsarCollection<dynamic> col, Id id, SavedToRecommendation object) {
  object.id = id;
}

extension SavedToRecommendationQueryWhereSort
    on QueryBuilder<SavedToRecommendation, SavedToRecommendation, QWhere> {
  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhere>
      anyDestContentWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'destContentWords'),
      );
    });
  }
}

extension SavedToRecommendationQueryWhere on QueryBuilder<SavedToRecommendation,
    SavedToRecommendation, QWhereClause> {
  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementEqualTo(String destContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destContentWords',
        value: [destContentWordsElement],
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementNotEqualTo(String destContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destContentWords',
              lower: [],
              upper: [destContentWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destContentWords',
              lower: [destContentWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destContentWords',
              lower: [destContentWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destContentWords',
              lower: [],
              upper: [destContentWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementGreaterThan(
    String destContentWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destContentWords',
        lower: [destContentWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementLessThan(
    String destContentWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destContentWords',
        lower: [],
        upper: [destContentWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementBetween(
    String lowerDestContentWordsElement,
    String upperDestContentWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destContentWords',
        lower: [lowerDestContentWordsElement],
        includeLower: includeLower,
        upper: [upperDestContentWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementStartsWith(String DestContentWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destContentWords',
        lower: [DestContentWordsElementPrefix],
        upper: ['$DestContentWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destContentWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterWhereClause>
      destContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'destContentWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'destContentWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'destContentWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'destContentWords',
              upper: [''],
            ));
      }
    });
  }
}

extension SavedToRecommendationQueryFilter on QueryBuilder<
    SavedToRecommendation, SavedToRecommendation, QFilterCondition> {
  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
          QAfterFilterCondition>
      destContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
          QAfterFilterCondition>
      destContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destContentWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
          QAfterFilterCondition>
      destContentWordsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destContentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
          QAfterFilterCondition>
      destContentWordsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destContentWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'destContentWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'destContentWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'destContentWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'destContentWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'destContentWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> destContentWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'destContentWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> firstTapDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstTapDate',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> firstTapDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstTapDate',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> firstTapDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> isFavouriteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFavourite',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> isFavouriteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFavourite',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> isFavouriteEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavourite',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> lastTapDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTapDate',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> lastTapDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTapDate',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> lastTapDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTapDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> mainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'main',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> mainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'main',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> mainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'main',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> mainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'main',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> placeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> placeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> placeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> placeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> secondaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'secondary',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> secondaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'secondary',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> secondaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondary',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> secondaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'secondary',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> totaltapsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totaltaps',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> totaltapsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totaltaps',
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
      QAfterFilterCondition> totaltapsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totaltaps',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

  QueryBuilder<SavedToRecommendation, SavedToRecommendation,
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

extension SavedToRecommendationQueryObject on QueryBuilder<
    SavedToRecommendation, SavedToRecommendation, QFilterCondition> {}

extension SavedToRecommendationQueryLinks on QueryBuilder<SavedToRecommendation,
    SavedToRecommendation, QFilterCondition> {}

extension SavedToRecommendationQuerySortBy
    on QueryBuilder<SavedToRecommendation, SavedToRecommendation, QSortBy> {
  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByDestContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByDestContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByFirstTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByFirstTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByLastTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByLastTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortBySecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortBySecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByTotaltaps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      sortByTotaltapsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.desc);
    });
  }
}

extension SavedToRecommendationQuerySortThenBy
    on QueryBuilder<SavedToRecommendation, SavedToRecommendation, QSortThenBy> {
  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByDestContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByDestContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByFirstTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByFirstTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByLastTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByLastTapDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTapDate', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'main', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenBySecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenBySecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondary', Sort.desc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByTotaltaps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.asc);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QAfterSortBy>
      thenByTotaltapsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totaltaps', Sort.desc);
    });
  }
}

extension SavedToRecommendationQueryWhereDistinct
    on QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct> {
  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByDestContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByDestContentWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destContentWords');
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByFirstTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstTapDate');
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavourite');
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByLastTapDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTapDate');
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByMain({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'main', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByPlaceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctBySecondary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedToRecommendation, SavedToRecommendation, QDistinct>
      distinctByTotaltaps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totaltaps');
    });
  }
}

extension SavedToRecommendationQueryProperty on QueryBuilder<
    SavedToRecommendation, SavedToRecommendation, QQueryProperty> {
  QueryBuilder<SavedToRecommendation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedToRecommendation, String, QQueryOperations>
      destContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destContent');
    });
  }

  QueryBuilder<SavedToRecommendation, List<String>, QQueryOperations>
      destContentWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destContentWords');
    });
  }

  QueryBuilder<SavedToRecommendation, DateTime?, QQueryOperations>
      firstTapDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstTapDate');
    });
  }

  QueryBuilder<SavedToRecommendation, bool?, QQueryOperations>
      isFavouriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavourite');
    });
  }

  QueryBuilder<SavedToRecommendation, DateTime?, QQueryOperations>
      lastTapDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTapDate');
    });
  }

  QueryBuilder<SavedToRecommendation, String?, QQueryOperations>
      mainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'main');
    });
  }

  QueryBuilder<SavedToRecommendation, String?, QQueryOperations>
      placeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placeId');
    });
  }

  QueryBuilder<SavedToRecommendation, String?, QQueryOperations>
      secondaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondary');
    });
  }

  QueryBuilder<SavedToRecommendation, int?, QQueryOperations>
      totaltapsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totaltaps');
    });
  }
}
