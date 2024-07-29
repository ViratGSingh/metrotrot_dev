// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dest_search_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDestSearchInfoCollection on Isar {
  IsarCollection<DestSearchInfo> get destSearchInfos => this.collection();
}

const DestSearchInfoSchema = CollectionSchema(
  name: r'DestSearchInfo',
  id: -8411205328146434300,
  properties: {
    r'isLimitreached': PropertySchema(
      id: 0,
      name: r'isLimitreached',
      type: IsarType.bool,
    ),
    r'startedAt': PropertySchema(
      id: 1,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'totalFavourites': PropertySchema(
      id: 2,
      name: r'totalFavourites',
      type: IsarType.long,
    ),
    r'totalRecommendations': PropertySchema(
      id: 3,
      name: r'totalRecommendations',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 4,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _destSearchInfoEstimateSize,
  serialize: _destSearchInfoSerialize,
  deserialize: _destSearchInfoDeserialize,
  deserializeProp: _destSearchInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _destSearchInfoGetId,
  getLinks: _destSearchInfoGetLinks,
  attach: _destSearchInfoAttach,
  version: '3.0.5',
);

int _destSearchInfoEstimateSize(
  DestSearchInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _destSearchInfoSerialize(
  DestSearchInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isLimitreached);
  writer.writeDateTime(offsets[1], object.startedAt);
  writer.writeLong(offsets[2], object.totalFavourites);
  writer.writeLong(offsets[3], object.totalRecommendations);
  writer.writeDateTime(offsets[4], object.updatedAt);
}

DestSearchInfo _destSearchInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DestSearchInfo();
  object.id = id;
  object.isLimitreached = reader.readBoolOrNull(offsets[0]);
  object.startedAt = reader.readDateTimeOrNull(offsets[1]);
  object.totalFavourites = reader.readLongOrNull(offsets[2]);
  object.totalRecommendations = reader.readLongOrNull(offsets[3]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[4]);
  return object;
}

P _destSearchInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _destSearchInfoGetId(DestSearchInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _destSearchInfoGetLinks(DestSearchInfo object) {
  return [];
}

void _destSearchInfoAttach(
    IsarCollection<dynamic> col, Id id, DestSearchInfo object) {
  object.id = id;
}

extension DestSearchInfoQueryWhereSort
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QWhere> {
  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DestSearchInfoQueryWhere
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QWhereClause> {
  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterWhereClause> idBetween(
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
}

extension DestSearchInfoQueryFilter
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QFilterCondition> {
  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      isLimitreachedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLimitreached',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      isLimitreachedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLimitreached',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      isLimitreachedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLimitreached',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      startedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      startedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      startedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalFavouritesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalFavourites',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalFavouritesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalFavourites',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalFavouritesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFavourites',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalFavouritesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalFavourites',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalFavouritesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalFavourites',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalFavouritesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalFavourites',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalRecommendationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalRecommendations',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalRecommendationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalRecommendations',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalRecommendationsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRecommendations',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalRecommendationsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRecommendations',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalRecommendationsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRecommendations',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      totalRecommendationsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRecommendations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DestSearchInfoQueryObject
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QFilterCondition> {}

extension DestSearchInfoQueryLinks
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QFilterCondition> {}

extension DestSearchInfoQuerySortBy
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QSortBy> {
  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByIsLimitreached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByIsLimitreachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByTotalFavourites() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByTotalFavouritesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByTotalRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByTotalRecommendationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DestSearchInfoQuerySortThenBy
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QSortThenBy> {
  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByIsLimitreached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByIsLimitreachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByTotalFavourites() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByTotalFavouritesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByTotalRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByTotalRecommendationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.desc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DestSearchInfoQueryWhereDistinct
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QDistinct> {
  QueryBuilder<DestSearchInfo, DestSearchInfo, QDistinct>
      distinctByIsLimitreached() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLimitreached');
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QDistinct>
      distinctByTotalFavourites() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFavourites');
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QDistinct>
      distinctByTotalRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRecommendations');
    });
  }

  QueryBuilder<DestSearchInfo, DestSearchInfo, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension DestSearchInfoQueryProperty
    on QueryBuilder<DestSearchInfo, DestSearchInfo, QQueryProperty> {
  QueryBuilder<DestSearchInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DestSearchInfo, bool?, QQueryOperations>
      isLimitreachedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLimitreached');
    });
  }

  QueryBuilder<DestSearchInfo, DateTime?, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<DestSearchInfo, int?, QQueryOperations>
      totalFavouritesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFavourites');
    });
  }

  QueryBuilder<DestSearchInfo, int?, QQueryOperations>
      totalRecommendationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRecommendations');
    });
  }

  QueryBuilder<DestSearchInfo, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
