// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from_metro.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSavedFromMetroCollection on Isar {
  IsarCollection<SavedFromMetro> get savedFromMetros => this.collection();
}

const SavedFromMetroSchema = CollectionSchema(
  name: r'SavedFromMetro',
  id: 7171396090555650219,
  properties: {
    r'businessStatus': PropertySchema(
      id: 0,
      name: r'businessStatus',
      type: IsarType.string,
    ),
    r'colourCodes': PropertySchema(
      id: 1,
      name: r'colourCodes',
      type: IsarType.stringList,
    ),
    r'data': PropertySchema(
      id: 2,
      name: r'data',
      type: IsarType.string,
    ),
    r'endStations': PropertySchema(
      id: 3,
      name: r'endStations',
      type: IsarType.stringList,
    ),
    r'fromAddress': PropertySchema(
      id: 4,
      name: r'fromAddress',
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
    r'fromLat': PropertySchema(
      id: 7,
      name: r'fromLat',
      type: IsarType.double,
    ),
    r'fromLng': PropertySchema(
      id: 8,
      name: r'fromLng',
      type: IsarType.double,
    ),
    r'fromName': PropertySchema(
      id: 9,
      name: r'fromName',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(
      id: 10,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lines': PropertySchema(
      id: 11,
      name: r'lines',
      type: IsarType.stringList,
    ),
    r'lng': PropertySchema(
      id: 12,
      name: r'lng',
      type: IsarType.double,
    ),
    r'metro': PropertySchema(
      id: 13,
      name: r'metro',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 14,
      name: r'name',
      type: IsarType.string,
    ),
    r'placeId': PropertySchema(
      id: 15,
      name: r'placeId',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 16,
      name: r'rating',
      type: IsarType.string,
    ),
    r'startStations': PropertySchema(
      id: 17,
      name: r'startStations',
      type: IsarType.stringList,
    ),
    r'userRatingsTotal': PropertySchema(
      id: 18,
      name: r'userRatingsTotal',
      type: IsarType.string,
    ),
    r'vicinity': PropertySchema(
      id: 19,
      name: r'vicinity',
      type: IsarType.string,
    )
  },
  estimateSize: _savedFromMetroEstimateSize,
  serialize: _savedFromMetroSerialize,
  deserialize: _savedFromMetroDeserialize,
  deserializeProp: _savedFromMetroDeserializeProp,
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
  getId: _savedFromMetroGetId,
  getLinks: _savedFromMetroGetLinks,
  attach: _savedFromMetroAttach,
  version: '3.0.5',
);

int _savedFromMetroEstimateSize(
  SavedFromMetro object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.businessStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.colourCodes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.data;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.endStations;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.fromAddress;
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
    final value = object.fromName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.lines;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.metro;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
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
    final value = object.rating;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.startStations;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.userRatingsTotal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vicinity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _savedFromMetroSerialize(
  SavedFromMetro object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.businessStatus);
  writer.writeStringList(offsets[1], object.colourCodes);
  writer.writeString(offsets[2], object.data);
  writer.writeStringList(offsets[3], object.endStations);
  writer.writeString(offsets[4], object.fromAddress);
  writer.writeString(offsets[5], object.fromContent);
  writer.writeStringList(offsets[6], object.fromContentWords);
  writer.writeDouble(offsets[7], object.fromLat);
  writer.writeDouble(offsets[8], object.fromLng);
  writer.writeString(offsets[9], object.fromName);
  writer.writeDouble(offsets[10], object.lat);
  writer.writeStringList(offsets[11], object.lines);
  writer.writeDouble(offsets[12], object.lng);
  writer.writeString(offsets[13], object.metro);
  writer.writeString(offsets[14], object.name);
  writer.writeString(offsets[15], object.placeId);
  writer.writeString(offsets[16], object.rating);
  writer.writeStringList(offsets[17], object.startStations);
  writer.writeString(offsets[18], object.userRatingsTotal);
  writer.writeString(offsets[19], object.vicinity);
}

SavedFromMetro _savedFromMetroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedFromMetro();
  object.businessStatus = reader.readStringOrNull(offsets[0]);
  object.colourCodes = reader.readStringList(offsets[1]);
  object.data = reader.readStringOrNull(offsets[2]);
  object.endStations = reader.readStringList(offsets[3]);
  object.fromAddress = reader.readStringOrNull(offsets[4]);
  object.fromContent = reader.readString(offsets[5]);
  object.fromLat = reader.readDoubleOrNull(offsets[7]);
  object.fromLng = reader.readDoubleOrNull(offsets[8]);
  object.fromName = reader.readStringOrNull(offsets[9]);
  object.id = id;
  object.lat = reader.readDoubleOrNull(offsets[10]);
  object.lines = reader.readStringList(offsets[11]);
  object.lng = reader.readDoubleOrNull(offsets[12]);
  object.metro = reader.readStringOrNull(offsets[13]);
  object.name = reader.readStringOrNull(offsets[14]);
  object.placeId = reader.readStringOrNull(offsets[15]);
  object.rating = reader.readStringOrNull(offsets[16]);
  object.startStations = reader.readStringList(offsets[17]);
  object.userRatingsTotal = reader.readStringOrNull(offsets[18]);
  object.vicinity = reader.readStringOrNull(offsets[19]);
  return object;
}

P _savedFromMetroDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringList(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedFromMetroGetId(SavedFromMetro object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedFromMetroGetLinks(SavedFromMetro object) {
  return [];
}

void _savedFromMetroAttach(
    IsarCollection<dynamic> col, Id id, SavedFromMetro object) {
  object.id = id;
}

extension SavedFromMetroQueryWhereSort
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QWhere> {
  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhere>
      anyFromContentWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fromContentWords'),
      );
    });
  }
}

extension SavedFromMetroQueryWhere
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QWhereClause> {
  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause> idBetween(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
      fromContentWordsElementEqualTo(String fromContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromContentWords',
        value: [fromContentWordsElement],
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
      fromContentWordsElementStartsWith(String FromContentWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fromContentWords',
        lower: [FromContentWordsElementPrefix],
        upper: ['$FromContentWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
      fromContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromContentWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterWhereClause>
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
}

extension SavedFromMetroQueryFilter
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QFilterCondition> {
  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'businessStatus',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'businessStatus',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'businessStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      businessStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'businessStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colourCodes',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colourCodes',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colourCodes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colourCodes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colourCodes',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colourCodes',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colourCodes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colourCodes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colourCodes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colourCodes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colourCodes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      colourCodesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colourCodes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endStations',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endStations',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endStations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endStations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'endStations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'endStations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'endStations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'endStations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'endStations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      endStationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'endStations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromAddress',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromAddress',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromLat',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromLat',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromLng',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromLng',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromName',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromName',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromName',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      fromNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromName',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      latEqualTo(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      latGreaterThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      latLessThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      latBetween(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lines',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lines',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lines',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lines',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lines',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      linesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      lngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      lngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      lngEqualTo(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      lngGreaterThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      lngLessThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      lngBetween(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metro',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metro',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metro',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      metroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metro',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdEqualTo(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdGreaterThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdLessThan(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdBetween(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdStartsWith(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdEndsWith(
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

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      placeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rating',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      ratingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rating',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startStations',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startStations',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startStations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startStations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'startStations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'startStations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'startStations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'startStations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'startStations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      startStationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'startStations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userRatingsTotal',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userRatingsTotal',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userRatingsTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userRatingsTotal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userRatingsTotal',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      userRatingsTotalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userRatingsTotal',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vicinity',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vicinity',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vicinity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vicinity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vicinity',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterFilterCondition>
      vicinityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vicinity',
        value: '',
      ));
    });
  }
}

extension SavedFromMetroQueryObject
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QFilterCondition> {}

extension SavedFromMetroQueryLinks
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QFilterCondition> {}

extension SavedFromMetroQuerySortBy
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QSortBy> {
  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByBusinessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByBusinessStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByFromLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLat', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLat', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByFromLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLng', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLng', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByFromName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromName', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByFromNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromName', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByMetro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByMetroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByUserRatingsTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByUserRatingsTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> sortByVicinity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      sortByVicinityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.desc);
    });
  }
}

extension SavedFromMetroQuerySortThenBy
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QSortThenBy> {
  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByBusinessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByBusinessStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromContent', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByFromLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLat', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLat', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByFromLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLng', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLng', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByFromName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromName', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByFromNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromName', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByMetro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByMetroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByUserRatingsTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByUserRatingsTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.desc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy> thenByVicinity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.asc);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QAfterSortBy>
      thenByVicinityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.desc);
    });
  }
}

extension SavedFromMetroQueryWhereDistinct
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> {
  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct>
      distinctByBusinessStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct>
      distinctByColourCodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colourCodes');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct>
      distinctByEndStations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endStations');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByFromAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByFromContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct>
      distinctByFromContentWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromContentWords');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByFromLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromLat');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByFromLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromLng');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByFromName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lines');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lng');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByMetro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByPlaceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByRating(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct>
      distinctByStartStations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startStations');
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct>
      distinctByUserRatingsTotal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userRatingsTotal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedFromMetro, SavedFromMetro, QDistinct> distinctByVicinity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vicinity', caseSensitive: caseSensitive);
    });
  }
}

extension SavedFromMetroQueryProperty
    on QueryBuilder<SavedFromMetro, SavedFromMetro, QQueryProperty> {
  QueryBuilder<SavedFromMetro, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations>
      businessStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessStatus');
    });
  }

  QueryBuilder<SavedFromMetro, List<String>?, QQueryOperations>
      colourCodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colourCodes');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<SavedFromMetro, List<String>?, QQueryOperations>
      endStationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endStations');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations>
      fromAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromAddress');
    });
  }

  QueryBuilder<SavedFromMetro, String, QQueryOperations> fromContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromContent');
    });
  }

  QueryBuilder<SavedFromMetro, List<String>, QQueryOperations>
      fromContentWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromContentWords');
    });
  }

  QueryBuilder<SavedFromMetro, double?, QQueryOperations> fromLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromLat');
    });
  }

  QueryBuilder<SavedFromMetro, double?, QQueryOperations> fromLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromLng');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> fromNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromName');
    });
  }

  QueryBuilder<SavedFromMetro, double?, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<SavedFromMetro, List<String>?, QQueryOperations>
      linesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lines');
    });
  }

  QueryBuilder<SavedFromMetro, double?, QQueryOperations> lngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lng');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> metroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metro');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> placeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placeId');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<SavedFromMetro, List<String>?, QQueryOperations>
      startStationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startStations');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations>
      userRatingsTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userRatingsTotal');
    });
  }

  QueryBuilder<SavedFromMetro, String?, QQueryOperations> vicinityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vicinity');
    });
  }
}
