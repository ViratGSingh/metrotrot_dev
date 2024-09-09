// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directions.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDirectionsCollection on Isar {
  IsarCollection<Directions> get directions => this.collection();
}

const DirectionsSchema = CollectionSchema(
  name: r'Directions',
  id: 7876439727727872334,
  properties: {
    r'contentWords': PropertySchema(
      id: 0,
      name: r'contentWords',
      type: IsarType.stringList,
    ),
    r'destContent': PropertySchema(
      id: 1,
      name: r'destContent',
      type: IsarType.string,
    ),
    r'destMain': PropertySchema(
      id: 2,
      name: r'destMain',
      type: IsarType.string,
    ),
    r'destSecondary': PropertySchema(
      id: 3,
      name: r'destSecondary',
      type: IsarType.string,
    ),
    r'directions': PropertySchema(
      id: 4,
      name: r'directions',
      type: IsarType.string,
    ),
    r'fromContent': PropertySchema(
      id: 5,
      name: r'fromContent',
      type: IsarType.string,
    ),
    r'fromContentWords': PropertySchema(
      id: 6,
      name: r'fromContentWords',
      type: IsarType.stringList,
    ),
    r'fromData': PropertySchema(
      id: 7,
      name: r'fromData',
      type: IsarType.string,
    ),
    r'fromId': PropertySchema(
      id: 8,
      name: r'fromId',
      type: IsarType.string,
    ),
    r'fromMain': PropertySchema(
      id: 9,
      name: r'fromMain',
      type: IsarType.string,
    ),
    r'fromSecondary': PropertySchema(
      id: 10,
      name: r'fromSecondary',
      type: IsarType.string,
    ),
    r'time': PropertySchema(
      id: 11,
      name: r'time',
      type: IsarType.dateTime,
    ),
    r'toData': PropertySchema(
      id: 12,
      name: r'toData',
      type: IsarType.string,
    ),
    r'toId': PropertySchema(
      id: 13,
      name: r'toId',
      type: IsarType.string,
    )
  },
  estimateSize: _directionsEstimateSize,
  serialize: _directionsSerialize,
  deserialize: _directionsDeserialize,
  deserializeProp: _directionsDeserializeProp,
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
    ),
    r'contentWords': IndexSchema(
      id: -9211142823111558917,
      name: r'contentWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'contentWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _directionsGetId,
  getLinks: _directionsGetLinks,
  attach: _directionsAttach,
  version: '3.1.0+1',
);

int _directionsEstimateSize(
  Directions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.contentWords.length * 3;
  {
    for (var i = 0; i < object.contentWords.length; i++) {
      final value = object.contentWords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.destContent.length * 3;
  {
    final value = object.destMain;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.destSecondary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.directions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fromContent.length * 3;
  bytesCount += 3 + object.fromContentWords.length * 3;
  {
    for (var i = 0; i < object.fromContentWords.length; i++) {
      final value = object.fromContentWords[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.fromData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fromId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fromMain;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fromSecondary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.toData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.toId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _directionsSerialize(
  Directions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.contentWords);
  writer.writeString(offsets[1], object.destContent);
  writer.writeString(offsets[2], object.destMain);
  writer.writeString(offsets[3], object.destSecondary);
  writer.writeString(offsets[4], object.directions);
  writer.writeString(offsets[5], object.fromContent);
  writer.writeStringList(offsets[6], object.fromContentWords);
  writer.writeString(offsets[7], object.fromData);
  writer.writeString(offsets[8], object.fromId);
  writer.writeString(offsets[9], object.fromMain);
  writer.writeString(offsets[10], object.fromSecondary);
  writer.writeDateTime(offsets[11], object.time);
  writer.writeString(offsets[12], object.toData);
  writer.writeString(offsets[13], object.toId);
}

Directions _directionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Directions();
  object.destContent = reader.readString(offsets[1]);
  object.destMain = reader.readStringOrNull(offsets[2]);
  object.destSecondary = reader.readStringOrNull(offsets[3]);
  object.directions = reader.readStringOrNull(offsets[4]);
  object.fromContent = reader.readString(offsets[5]);
  object.fromData = reader.readStringOrNull(offsets[7]);
  object.fromId = reader.readStringOrNull(offsets[8]);
  object.fromMain = reader.readStringOrNull(offsets[9]);
  object.fromSecondary = reader.readStringOrNull(offsets[10]);
  object.id = id;
  object.time = reader.readDateTimeOrNull(offsets[11]);
  object.toData = reader.readStringOrNull(offsets[12]);
  object.toId = reader.readStringOrNull(offsets[13]);
  return object;
}

P _directionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _directionsGetId(Directions object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _directionsGetLinks(Directions object) {
  return [];
}

void _directionsAttach(IsarCollection<dynamic> col, Id id, Directions object) {
  object.id = id;
}

extension DirectionsQueryWhereSort
    on QueryBuilder<Directions, Directions, QWhere> {
  QueryBuilder<Directions, Directions, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhere>
      anyFromContentWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fromContentWords'),
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhere> anyContentWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'contentWords'),
      );
    });
  }
}

extension DirectionsQueryWhere
    on QueryBuilder<Directions, Directions, QWhereClause> {
  QueryBuilder<Directions, Directions, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Directions, Directions, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause> idBetween(
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

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementEqualTo(String fromContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromContentWords',
        value: [fromContentWordsElement],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
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

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementGreaterThan(
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

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementLessThan(
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

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementBetween(
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

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementStartsWith(String FromContentWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fromContentWords',
        lower: [FromContentWordsElementPrefix],
        upper: ['$FromContentWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromContentWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      fromContentWordsElementIsNotEmpty() {
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

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementEqualTo(String contentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'contentWords',
        value: [contentWordsElement],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementNotEqualTo(String contentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentWords',
              lower: [],
              upper: [contentWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentWords',
              lower: [contentWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentWords',
              lower: [contentWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentWords',
              lower: [],
              upper: [contentWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementGreaterThan(
    String contentWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentWords',
        lower: [contentWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementLessThan(
    String contentWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentWords',
        lower: [],
        upper: [contentWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementBetween(
    String lowerContentWordsElement,
    String upperContentWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentWords',
        lower: [lowerContentWordsElement],
        includeLower: includeLower,
        upper: [upperContentWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementStartsWith(String ContentWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentWords',
        lower: [ContentWordsElementPrefix],
        upper: ['$ContentWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'contentWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterWhereClause>
      contentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'contentWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'contentWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'contentWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'contentWords',
              upper: [''],
            ));
      }
    });
  }
}

extension DirectionsQueryFilter
    on QueryBuilder<Directions, Directions, QFilterCondition> {
  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contentWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contentWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contentWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      contentWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'contentWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentEqualTo(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentGreaterThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentLessThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentBetween(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentStartsWith(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentEndsWith(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destMain',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destMainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destMain',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destMainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destMain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destMainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> destMainMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destMain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destMainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destMain',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destMainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destMain',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destSecondary',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destSecondary',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destSecondary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destSecondary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destSecondary',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      destSecondaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destSecondary',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'directions',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'directions',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> directionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'directions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'directions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> directionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'directions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'directions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'directions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'directions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> directionsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'directions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directions',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      directionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'directions',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentEqualTo(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentGreaterThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentLessThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentBetween(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentStartsWith(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentEndsWith(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementEqualTo(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementGreaterThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementLessThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementBetween(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementStartsWith(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementEndsWith(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsLengthEqualTo(int length) {
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsIsEmpty() {
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsIsNotEmpty() {
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsLengthLessThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsLengthGreaterThan(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromContentWordsLengthBetween(
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromData',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromData',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromData',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromData',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromId',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromId',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromId',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromId',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromMain',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromMainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromMain',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromMainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromMain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromMainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromMain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> fromMainMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromMain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromMainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromMain',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromMainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromMain',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromSecondary',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromSecondary',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromSecondary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromSecondary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromSecondary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromSecondary',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      fromSecondaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromSecondary',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<Directions, Directions, QAfterFilterCondition> timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> timeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> timeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> timeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> timeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'toData',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      toDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'toData',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toData',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition>
      toDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toData',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'toId',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'toId',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toId',
        value: '',
      ));
    });
  }

  QueryBuilder<Directions, Directions, QAfterFilterCondition> toIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toId',
        value: '',
      ));
    });
  }
}

extension DirectionsQueryObject
    on QueryBuilder<Directions, Directions, QFilterCondition> {}

extension DirectionsQueryLinks
    on QueryBuilder<Directions, Directions, QFilterCondition> {}

extension DirectionsQuerySortBy
    on QueryBuilder<Directions, Directions, QSortBy> {
  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDestContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDestContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDestMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destMain', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDestMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destMain', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDestSecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destSecondary', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDestSecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destSecondary', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDirections() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directions', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByDirectionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directions', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromData', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromData', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMain', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMain', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromSecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromSecondary', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByFromSecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromSecondary', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByToData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toData', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByToDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toData', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> sortByToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.desc);
    });
  }
}

extension DirectionsQuerySortThenBy
    on QueryBuilder<Directions, Directions, QSortThenBy> {
  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDestContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDestContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDestMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destMain', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDestMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destMain', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDestSecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destSecondary', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDestSecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destSecondary', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDirections() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directions', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByDirectionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directions', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromData', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromData', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromMain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMain', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromMainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMain', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromSecondary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromSecondary', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByFromSecondaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromSecondary', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByToData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toData', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByToDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toData', Sort.desc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.asc);
    });
  }

  QueryBuilder<Directions, Directions, QAfterSortBy> thenByToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toId', Sort.desc);
    });
  }
}

extension DirectionsQueryWhereDistinct
    on QueryBuilder<Directions, Directions, QDistinct> {
  QueryBuilder<Directions, Directions, QDistinct> distinctByContentWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentWords');
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByDestContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByDestMain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destMain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByDestSecondary(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destSecondary',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByDirections(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'directions', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByFromContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByFromContentWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromContentWords');
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByFromData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByFromId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByFromMain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromMain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByFromSecondary(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromSecondary',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByToData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Directions, Directions, QDistinct> distinctByToId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toId', caseSensitive: caseSensitive);
    });
  }
}

extension DirectionsQueryProperty
    on QueryBuilder<Directions, Directions, QQueryProperty> {
  QueryBuilder<Directions, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Directions, List<String>, QQueryOperations>
      contentWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentWords');
    });
  }

  QueryBuilder<Directions, String, QQueryOperations> destContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destContent');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> destMainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destMain');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> destSecondaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destSecondary');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> directionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'directions');
    });
  }

  QueryBuilder<Directions, String, QQueryOperations> fromContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromContent');
    });
  }

  QueryBuilder<Directions, List<String>, QQueryOperations>
      fromContentWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromContentWords');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> fromDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromData');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> fromIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromId');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> fromMainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromMain');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> fromSecondaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromSecondary');
    });
  }

  QueryBuilder<Directions, DateTime?, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> toDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toData');
    });
  }

  QueryBuilder<Directions, String?, QQueryOperations> toIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toId');
    });
  }
}
