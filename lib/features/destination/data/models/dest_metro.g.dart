// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dest_metro.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedDestMetroCollection on Isar {
  IsarCollection<SavedDestMetro> get savedDestMetros => this.collection();
}

const SavedDestMetroSchema = CollectionSchema(
  name: r'SavedDestMetro',
  id: -8425809137233210366,
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
    r'destAddress': PropertySchema(
      id: 3,
      name: r'destAddress',
      type: IsarType.string,
    ),
    r'destContent': PropertySchema(
      id: 4,
      name: r'destContent',
      type: IsarType.string,
    ),
    r'destContentWords': PropertySchema(
      id: 5,
      name: r'destContentWords',
      type: IsarType.stringList,
    ),
    r'destLat': PropertySchema(
      id: 6,
      name: r'destLat',
      type: IsarType.double,
    ),
    r'destLng': PropertySchema(
      id: 7,
      name: r'destLng',
      type: IsarType.double,
    ),
    r'destName': PropertySchema(
      id: 8,
      name: r'destName',
      type: IsarType.string,
    ),
    r'endStations': PropertySchema(
      id: 9,
      name: r'endStations',
      type: IsarType.stringList,
    ),
    r'lines': PropertySchema(
      id: 10,
      name: r'lines',
      type: IsarType.stringList,
    ),
    r'metro': PropertySchema(
      id: 11,
      name: r'metro',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'nearbyMetroLat': PropertySchema(
      id: 13,
      name: r'nearbyMetroLat',
      type: IsarType.double,
    ),
    r'nearbyMetroLng': PropertySchema(
      id: 14,
      name: r'nearbyMetroLng',
      type: IsarType.double,
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
  estimateSize: _savedDestMetroEstimateSize,
  serialize: _savedDestMetroSerialize,
  deserialize: _savedDestMetroDeserialize,
  deserializeProp: _savedDestMetroDeserializeProp,
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
  getId: _savedDestMetroGetId,
  getLinks: _savedDestMetroGetLinks,
  attach: _savedDestMetroAttach,
  version: '3.1.0+1',
);

int _savedDestMetroEstimateSize(
  SavedDestMetro object,
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
    final value = object.destAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.destContent.length * 3;
  bytesCount += 3 + object.destContentWords.length * 3;
  {
    for (var i = 0; i < object.destContentWords.length; i++) {
      final value = object.destContentWords[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.destName;
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

void _savedDestMetroSerialize(
  SavedDestMetro object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.businessStatus);
  writer.writeStringList(offsets[1], object.colourCodes);
  writer.writeString(offsets[2], object.data);
  writer.writeString(offsets[3], object.destAddress);
  writer.writeString(offsets[4], object.destContent);
  writer.writeStringList(offsets[5], object.destContentWords);
  writer.writeDouble(offsets[6], object.destLat);
  writer.writeDouble(offsets[7], object.destLng);
  writer.writeString(offsets[8], object.destName);
  writer.writeStringList(offsets[9], object.endStations);
  writer.writeStringList(offsets[10], object.lines);
  writer.writeString(offsets[11], object.metro);
  writer.writeString(offsets[12], object.name);
  writer.writeDouble(offsets[13], object.nearbyMetroLat);
  writer.writeDouble(offsets[14], object.nearbyMetroLng);
  writer.writeString(offsets[15], object.placeId);
  writer.writeString(offsets[16], object.rating);
  writer.writeStringList(offsets[17], object.startStations);
  writer.writeString(offsets[18], object.userRatingsTotal);
  writer.writeString(offsets[19], object.vicinity);
}

SavedDestMetro _savedDestMetroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedDestMetro();
  object.businessStatus = reader.readStringOrNull(offsets[0]);
  object.colourCodes = reader.readStringList(offsets[1]);
  object.data = reader.readStringOrNull(offsets[2]);
  object.destAddress = reader.readStringOrNull(offsets[3]);
  object.destContent = reader.readString(offsets[4]);
  object.destLat = reader.readDoubleOrNull(offsets[6]);
  object.destLng = reader.readDoubleOrNull(offsets[7]);
  object.destName = reader.readStringOrNull(offsets[8]);
  object.endStations = reader.readStringList(offsets[9]);
  object.id = id;
  object.lines = reader.readStringList(offsets[10]);
  object.metro = reader.readStringOrNull(offsets[11]);
  object.name = reader.readStringOrNull(offsets[12]);
  object.nearbyMetroLat = reader.readDoubleOrNull(offsets[13]);
  object.nearbyMetroLng = reader.readDoubleOrNull(offsets[14]);
  object.placeId = reader.readStringOrNull(offsets[15]);
  object.rating = reader.readStringOrNull(offsets[16]);
  object.startStations = reader.readStringList(offsets[17]);
  object.userRatingsTotal = reader.readStringOrNull(offsets[18]);
  object.vicinity = reader.readStringOrNull(offsets[19]);
  return object;
}

P _savedDestMetroDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readStringList(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
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

Id _savedDestMetroGetId(SavedDestMetro object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedDestMetroGetLinks(SavedDestMetro object) {
  return [];
}

void _savedDestMetroAttach(
    IsarCollection<dynamic> col, Id id, SavedDestMetro object) {
  object.id = id;
}

extension SavedDestMetroQueryWhereSort
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QWhere> {
  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhere>
      anyDestContentWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'destContentWords'),
      );
    });
  }
}

extension SavedDestMetroQueryWhere
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QWhereClause> {
  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause> idBetween(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
      destContentWordsElementEqualTo(String destContentWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destContentWords',
        value: [destContentWordsElement],
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
      destContentWordsElementStartsWith(String DestContentWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'destContentWords',
        lower: [DestContentWordsElementPrefix],
        upper: ['$DestContentWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
      destContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destContentWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterWhereClause>
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

extension SavedDestMetroQueryFilter
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QFilterCondition> {
  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      businessStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'businessStatus',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      businessStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'businessStatus',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      businessStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'businessStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      businessStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'businessStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      businessStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      businessStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'businessStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      colourCodesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colourCodes',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      colourCodesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colourCodes',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      colourCodesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colourCodes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      colourCodesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colourCodes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      colourCodesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colourCodes',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      colourCodesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colourCodes',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      dataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      dataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destAddress',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destAddress',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destContent',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementEqualTo(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementGreaterThan(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementLessThan(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementBetween(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementStartsWith(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementEndsWith(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destContentWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsLengthEqualTo(int length) {
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsIsEmpty() {
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsIsNotEmpty() {
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsLengthLessThan(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsLengthGreaterThan(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destContentWordsLengthBetween(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destLat',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destLat',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destLng',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destLng',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destName',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destName',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destName',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      destNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destName',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      endStationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endStations',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      endStationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endStations',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      endStationsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      endStationsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endStations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      endStationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      endStationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      linesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lines',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      linesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lines',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      linesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      linesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lines',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      linesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lines',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      linesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lines',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      metroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metro',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      metroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metro',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      metroContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      metroMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      metroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metro',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      metroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metro',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nearbyMetroLat',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nearbyMetroLat',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nearbyMetroLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nearbyMetroLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nearbyMetroLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nearbyMetroLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nearbyMetroLng',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nearbyMetroLng',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nearbyMetroLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nearbyMetroLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nearbyMetroLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      nearbyMetroLngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nearbyMetroLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      placeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      placeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'placeId',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      placeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      placeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      placeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      placeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      ratingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      ratingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rating',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      ratingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      ratingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rating',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      startStationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startStations',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      startStationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startStations',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      startStationsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startStations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      startStationsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startStations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      startStationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      startStationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startStations',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      userRatingsTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userRatingsTotal',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      userRatingsTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userRatingsTotal',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      userRatingsTotalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userRatingsTotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      userRatingsTotalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userRatingsTotal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      userRatingsTotalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userRatingsTotal',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      userRatingsTotalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userRatingsTotal',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      vicinityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vicinity',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      vicinityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vicinity',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
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

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      vicinityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vicinity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      vicinityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vicinity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      vicinityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vicinity',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterFilterCondition>
      vicinityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vicinity',
        value: '',
      ));
    });
  }
}

extension SavedDestMetroQueryObject
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QFilterCondition> {}

extension SavedDestMetroQueryLinks
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QFilterCondition> {}

extension SavedDestMetroQuerySortBy
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QSortBy> {
  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByBusinessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByBusinessStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByDestLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByDestLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByDestName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destName', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByDestNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destName', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByMetro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByMetroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByNearbyMetroLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLat', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByNearbyMetroLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLat', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByNearbyMetroLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLng', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByNearbyMetroLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLng', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByUserRatingsTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByUserRatingsTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> sortByVicinity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      sortByVicinityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.desc);
    });
  }
}

extension SavedDestMetroQuerySortThenBy
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QSortThenBy> {
  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByBusinessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByBusinessStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessStatus', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destContent', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByDestLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByDestLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByDestName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destName', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByDestNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destName', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByMetro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByMetroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metro', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByNearbyMetroLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLat', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByNearbyMetroLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLat', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByNearbyMetroLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLng', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByNearbyMetroLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nearbyMetroLng', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByPlaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByPlaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placeId', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByUserRatingsTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByUserRatingsTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRatingsTotal', Sort.desc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy> thenByVicinity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.asc);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QAfterSortBy>
      thenByVicinityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vicinity', Sort.desc);
    });
  }
}

extension SavedDestMetroQueryWhereDistinct
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> {
  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByBusinessStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByColourCodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colourCodes');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByDestAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByDestContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByDestContentWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destContentWords');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByDestLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destLat');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByDestLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destLng');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByDestName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByEndStations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endStations');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lines');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByMetro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByNearbyMetroLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nearbyMetroLat');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByNearbyMetroLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nearbyMetroLng');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByPlaceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByRating(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByStartStations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startStations');
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct>
      distinctByUserRatingsTotal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userRatingsTotal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedDestMetro, SavedDestMetro, QDistinct> distinctByVicinity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vicinity', caseSensitive: caseSensitive);
    });
  }
}

extension SavedDestMetroQueryProperty
    on QueryBuilder<SavedDestMetro, SavedDestMetro, QQueryProperty> {
  QueryBuilder<SavedDestMetro, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations>
      businessStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessStatus');
    });
  }

  QueryBuilder<SavedDestMetro, List<String>?, QQueryOperations>
      colourCodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colourCodes');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations>
      destAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destAddress');
    });
  }

  QueryBuilder<SavedDestMetro, String, QQueryOperations> destContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destContent');
    });
  }

  QueryBuilder<SavedDestMetro, List<String>, QQueryOperations>
      destContentWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destContentWords');
    });
  }

  QueryBuilder<SavedDestMetro, double?, QQueryOperations> destLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destLat');
    });
  }

  QueryBuilder<SavedDestMetro, double?, QQueryOperations> destLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destLng');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> destNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destName');
    });
  }

  QueryBuilder<SavedDestMetro, List<String>?, QQueryOperations>
      endStationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endStations');
    });
  }

  QueryBuilder<SavedDestMetro, List<String>?, QQueryOperations>
      linesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lines');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> metroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metro');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SavedDestMetro, double?, QQueryOperations>
      nearbyMetroLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nearbyMetroLat');
    });
  }

  QueryBuilder<SavedDestMetro, double?, QQueryOperations>
      nearbyMetroLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nearbyMetroLng');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> placeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placeId');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<SavedDestMetro, List<String>?, QQueryOperations>
      startStationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startStations');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations>
      userRatingsTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userRatingsTotal');
    });
  }

  QueryBuilder<SavedDestMetro, String?, QQueryOperations> vicinityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vicinity');
    });
  }
}
