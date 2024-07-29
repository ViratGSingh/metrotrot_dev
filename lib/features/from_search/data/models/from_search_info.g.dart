// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from_search_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFromSearchInfoCollection on Isar {
  IsarCollection<FromSearchInfo> get fromSearchInfos => this.collection();
}

const FromSearchInfoSchema = CollectionSchema(
  name: r'FromSearchInfo',
  id: 8585128942843666613,
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
  estimateSize: _fromSearchInfoEstimateSize,
  serialize: _fromSearchInfoSerialize,
  deserialize: _fromSearchInfoDeserialize,
  deserializeProp: _fromSearchInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fromSearchInfoGetId,
  getLinks: _fromSearchInfoGetLinks,
  attach: _fromSearchInfoAttach,
  version: '3.0.5',
);

int _fromSearchInfoEstimateSize(
  FromSearchInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _fromSearchInfoSerialize(
  FromSearchInfo object,
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

FromSearchInfo _fromSearchInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FromSearchInfo();
  object.id = id;
  object.isLimitreached = reader.readBoolOrNull(offsets[0]);
  object.startedAt = reader.readDateTimeOrNull(offsets[1]);
  object.totalFavourites = reader.readLongOrNull(offsets[2]);
  object.totalRecommendations = reader.readLongOrNull(offsets[3]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[4]);
  return object;
}

P _fromSearchInfoDeserializeProp<P>(
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

Id _fromSearchInfoGetId(FromSearchInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fromSearchInfoGetLinks(FromSearchInfo object) {
  return [];
}

void _fromSearchInfoAttach(
    IsarCollection<dynamic> col, Id id, FromSearchInfo object) {
  object.id = id;
}

extension FromSearchInfoQueryWhereSort
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QWhere> {
  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FromSearchInfoQueryWhere
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QWhereClause> {
  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterWhereClause> idBetween(
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

extension FromSearchInfoQueryFilter
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QFilterCondition> {
  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      isLimitreachedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLimitreached',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      isLimitreachedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLimitreached',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      isLimitreachedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLimitreached',
        value: value,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      startedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      totalFavouritesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalFavourites',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      totalFavouritesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalFavourites',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      totalFavouritesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalFavourites',
        value: value,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      totalRecommendationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalRecommendations',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      totalRecommendationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalRecommendations',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      totalRecommendationsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRecommendations',
        value: value,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterFilterCondition>
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

extension FromSearchInfoQueryObject
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QFilterCondition> {}

extension FromSearchInfoQueryLinks
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QFilterCondition> {}

extension FromSearchInfoQuerySortBy
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QSortBy> {
  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByIsLimitreached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByIsLimitreachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByTotalFavourites() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByTotalFavouritesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByTotalRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByTotalRecommendationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FromSearchInfoQuerySortThenBy
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QSortThenBy> {
  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByIsLimitreached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByIsLimitreachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLimitreached', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByTotalFavourites() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByTotalFavouritesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFavourites', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByTotalRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByTotalRecommendationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRecommendations', Sort.desc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FromSearchInfoQueryWhereDistinct
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QDistinct> {
  QueryBuilder<FromSearchInfo, FromSearchInfo, QDistinct>
      distinctByIsLimitreached() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLimitreached');
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QDistinct>
      distinctByTotalFavourites() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFavourites');
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QDistinct>
      distinctByTotalRecommendations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRecommendations');
    });
  }

  QueryBuilder<FromSearchInfo, FromSearchInfo, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension FromSearchInfoQueryProperty
    on QueryBuilder<FromSearchInfo, FromSearchInfo, QQueryProperty> {
  QueryBuilder<FromSearchInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FromSearchInfo, bool?, QQueryOperations>
      isLimitreachedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLimitreached');
    });
  }

  QueryBuilder<FromSearchInfo, DateTime?, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<FromSearchInfo, int?, QQueryOperations>
      totalFavouritesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFavourites');
    });
  }

  QueryBuilder<FromSearchInfo, int?, QQueryOperations>
      totalRecommendationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRecommendations');
    });
  }

  QueryBuilder<FromSearchInfo, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
