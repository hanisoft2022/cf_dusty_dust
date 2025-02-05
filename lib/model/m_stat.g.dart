// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_stat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMStatCollection on Isar {
  IsarCollection<MStat> get mStats => this.collection();
}

const MStatSchema = CollectionSchema(
  name: r'MStat',
  id: -8617895228139872563,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'itemCode': PropertySchema(
      id: 1,
      name: r'itemCode',
      type: IsarType.byte,
      enumMap: _MStatitemCodeEnumValueMap,
    ),
    r'region': PropertySchema(
      id: 2,
      name: r'region',
      type: IsarType.byte,
      enumMap: _MStatregionEnumValueMap,
    ),
    r'stat': PropertySchema(
      id: 3,
      name: r'stat',
      type: IsarType.double,
    )
  },
  estimateSize: _mStatEstimateSize,
  serialize: _mStatSerialize,
  deserialize: _mStatDeserialize,
  deserializeProp: _mStatDeserializeProp,
  idName: r'id',
  indexes: {
    r'region_dateTime_itemCode': IndexSchema(
      id: 1573514516104585086,
      name: r'region_dateTime_itemCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'region',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'dateTime',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'itemCode',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _mStatGetId,
  getLinks: _mStatGetLinks,
  attach: _mStatAttach,
  version: '3.1.0+1',
);

int _mStatEstimateSize(
  MStat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _mStatSerialize(
  MStat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeByte(offsets[1], object.itemCode.index);
  writer.writeByte(offsets[2], object.region.index);
  writer.writeDouble(offsets[3], object.stat);
}

MStat _mStatDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MStat();
  object.dateTime = reader.readDateTime(offsets[0]);
  object.id = id;
  object.itemCode =
      _MStatitemCodeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          ItemCode.PM10;
  object.region = _MStatregionValueEnumMap[reader.readByteOrNull(offsets[2])] ??
      Region.daegu;
  object.stat = reader.readDouble(offsets[3]);
  return object;
}

P _mStatDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (_MStatitemCodeValueEnumMap[reader.readByteOrNull(offset)] ??
          ItemCode.PM10) as P;
    case 2:
      return (_MStatregionValueEnumMap[reader.readByteOrNull(offset)] ??
          Region.daegu) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MStatitemCodeEnumValueMap = {
  'PM10': 0,
  'PM25': 1,
  'SO2': 2,
  'CO': 3,
  'O3': 4,
  'NO2': 5,
};
const _MStatitemCodeValueEnumMap = {
  0: ItemCode.PM10,
  1: ItemCode.PM25,
  2: ItemCode.SO2,
  3: ItemCode.CO,
  4: ItemCode.O3,
  5: ItemCode.NO2,
};
const _MStatregionEnumValueMap = {
  'daegu': 0,
  'chungnam': 1,
  'incheon': 2,
  'daejeon': 3,
  'gyeongbuk': 4,
  'sejong': 5,
  'gwangju': 6,
  'jeonbuk': 7,
  'gangwon': 8,
  'ulsan': 9,
  'jeonnam': 10,
  'seoul': 11,
  'busan': 12,
  'jeju': 13,
  'chungbuk': 14,
  'gyeongnam': 15,
  'gyeonggi': 16,
};
const _MStatregionValueEnumMap = {
  0: Region.daegu,
  1: Region.chungnam,
  2: Region.incheon,
  3: Region.daejeon,
  4: Region.gyeongbuk,
  5: Region.sejong,
  6: Region.gwangju,
  7: Region.jeonbuk,
  8: Region.gangwon,
  9: Region.ulsan,
  10: Region.jeonnam,
  11: Region.seoul,
  12: Region.busan,
  13: Region.jeju,
  14: Region.chungbuk,
  15: Region.gyeongnam,
  16: Region.gyeonggi,
};

Id _mStatGetId(MStat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mStatGetLinks(MStat object) {
  return [];
}

void _mStatAttach(IsarCollection<dynamic> col, Id id, MStat object) {
  object.id = id;
}

extension MStatByIndex on IsarCollection<MStat> {
  Future<MStat?> getByRegionDateTimeItemCode(
      Region region, DateTime dateTime, ItemCode itemCode) {
    return getByIndex(
        r'region_dateTime_itemCode', [region, dateTime, itemCode]);
  }

  MStat? getByRegionDateTimeItemCodeSync(
      Region region, DateTime dateTime, ItemCode itemCode) {
    return getByIndexSync(
        r'region_dateTime_itemCode', [region, dateTime, itemCode]);
  }

  Future<bool> deleteByRegionDateTimeItemCode(
      Region region, DateTime dateTime, ItemCode itemCode) {
    return deleteByIndex(
        r'region_dateTime_itemCode', [region, dateTime, itemCode]);
  }

  bool deleteByRegionDateTimeItemCodeSync(
      Region region, DateTime dateTime, ItemCode itemCode) {
    return deleteByIndexSync(
        r'region_dateTime_itemCode', [region, dateTime, itemCode]);
  }

  Future<List<MStat?>> getAllByRegionDateTimeItemCode(List<Region> regionValues,
      List<DateTime> dateTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dateTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dateTimeValues[i], itemCodeValues[i]]);
    }

    return getAllByIndex(r'region_dateTime_itemCode', values);
  }

  List<MStat?> getAllByRegionDateTimeItemCodeSync(List<Region> regionValues,
      List<DateTime> dateTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dateTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dateTimeValues[i], itemCodeValues[i]]);
    }

    return getAllByIndexSync(r'region_dateTime_itemCode', values);
  }

  Future<int> deleteAllByRegionDateTimeItemCode(List<Region> regionValues,
      List<DateTime> dateTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dateTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dateTimeValues[i], itemCodeValues[i]]);
    }

    return deleteAllByIndex(r'region_dateTime_itemCode', values);
  }

  int deleteAllByRegionDateTimeItemCodeSync(List<Region> regionValues,
      List<DateTime> dateTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dateTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dateTimeValues[i], itemCodeValues[i]]);
    }

    return deleteAllByIndexSync(r'region_dateTime_itemCode', values);
  }

  Future<Id> putByRegionDateTimeItemCode(MStat object) {
    return putByIndex(r'region_dateTime_itemCode', object);
  }

  Id putByRegionDateTimeItemCodeSync(MStat object, {bool saveLinks = true}) {
    return putByIndexSync(r'region_dateTime_itemCode', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRegionDateTimeItemCode(List<MStat> objects) {
    return putAllByIndex(r'region_dateTime_itemCode', objects);
  }

  List<Id> putAllByRegionDateTimeItemCodeSync(List<MStat> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'region_dateTime_itemCode', objects,
        saveLinks: saveLinks);
  }
}

extension MStatQueryWhereSort on QueryBuilder<MStat, MStat, QWhere> {
  QueryBuilder<MStat, MStat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhere> anyRegionDateTimeItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'region_dateTime_itemCode'),
      );
    });
  }
}

extension MStatQueryWhere on QueryBuilder<MStat, MStat, QWhereClause> {
  QueryBuilder<MStat, MStat, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MStat, MStat, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause> idBetween(
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

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionEqualToAnyDateTimeItemCode(Region region) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'region_dateTime_itemCode',
        value: [region],
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionNotEqualToAnyDateTimeItemCode(Region region) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [],
              upper: [region],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [],
              upper: [region],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionGreaterThanAnyDateTimeItemCode(
    Region region, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionLessThanAnyDateTimeItemCode(
    Region region, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [],
        upper: [region],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionBetweenAnyDateTimeItemCode(
    Region lowerRegion,
    Region upperRegion, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [lowerRegion],
        includeLower: includeLower,
        upper: [upperRegion],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionDateTimeEqualToAnyItemCode(Region region, DateTime dateTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'region_dateTime_itemCode',
        value: [region, dateTime],
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionEqualToDateTimeNotEqualToAnyItemCode(
          Region region, DateTime dateTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region],
              upper: [region, dateTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region, dateTime],
              includeLower: false,
              upper: [region],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region, dateTime],
              includeLower: false,
              upper: [region],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region],
              upper: [region, dateTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionEqualToDateTimeGreaterThanAnyItemCode(
    Region region,
    DateTime dateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region, dateTime],
        includeLower: include,
        upper: [region],
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionEqualToDateTimeLessThanAnyItemCode(
    Region region,
    DateTime dateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region],
        upper: [region, dateTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionEqualToDateTimeBetweenAnyItemCode(
    Region region,
    DateTime lowerDateTime,
    DateTime upperDateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region, lowerDateTime],
        includeLower: includeLower,
        upper: [region, upperDateTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause> regionDateTimeItemCodeEqualTo(
      Region region, DateTime dateTime, ItemCode itemCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'region_dateTime_itemCode',
        value: [region, dateTime, itemCode],
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionDateTimeEqualToItemCodeNotEqualTo(
          Region region, DateTime dateTime, ItemCode itemCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region, dateTime],
              upper: [region, dateTime, itemCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region, dateTime, itemCode],
              includeLower: false,
              upper: [region, dateTime],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region, dateTime, itemCode],
              includeLower: false,
              upper: [region, dateTime],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dateTime_itemCode',
              lower: [region, dateTime],
              upper: [region, dateTime, itemCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionDateTimeEqualToItemCodeGreaterThan(
    Region region,
    DateTime dateTime,
    ItemCode itemCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region, dateTime, itemCode],
        includeLower: include,
        upper: [region, dateTime],
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionDateTimeEqualToItemCodeLessThan(
    Region region,
    DateTime dateTime,
    ItemCode itemCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region, dateTime],
        upper: [region, dateTime, itemCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterWhereClause>
      regionDateTimeEqualToItemCodeBetween(
    Region region,
    DateTime dateTime,
    ItemCode lowerItemCode,
    ItemCode upperItemCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dateTime_itemCode',
        lower: [region, dateTime, lowerItemCode],
        includeLower: includeLower,
        upper: [region, dateTime, upperItemCode],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MStatQueryFilter on QueryBuilder<MStat, MStat, QFilterCondition> {
  QueryBuilder<MStat, MStat, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MStat, MStat, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MStat, MStat, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MStat, MStat, QAfterFilterCondition> itemCodeEqualTo(
      ItemCode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> itemCodeGreaterThan(
    ItemCode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> itemCodeLessThan(
    ItemCode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> itemCodeBetween(
    ItemCode lower,
    ItemCode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> regionEqualTo(
      Region value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> regionGreaterThan(
    Region value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'region',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> regionLessThan(
    Region value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'region',
        value: value,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> regionBetween(
    Region lower,
    Region upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'region',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> statEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> statGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> statLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MStat, MStat, QAfterFilterCondition> statBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MStatQueryObject on QueryBuilder<MStat, MStat, QFilterCondition> {}

extension MStatQueryLinks on QueryBuilder<MStat, MStat, QFilterCondition> {}

extension MStatQuerySortBy on QueryBuilder<MStat, MStat, QSortBy> {
  QueryBuilder<MStat, MStat, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> sortByStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.desc);
    });
  }
}

extension MStatQuerySortThenBy on QueryBuilder<MStat, MStat, QSortThenBy> {
  QueryBuilder<MStat, MStat, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.asc);
    });
  }

  QueryBuilder<MStat, MStat, QAfterSortBy> thenByStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.desc);
    });
  }
}

extension MStatQueryWhereDistinct on QueryBuilder<MStat, MStat, QDistinct> {
  QueryBuilder<MStat, MStat, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<MStat, MStat, QDistinct> distinctByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCode');
    });
  }

  QueryBuilder<MStat, MStat, QDistinct> distinctByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'region');
    });
  }

  QueryBuilder<MStat, MStat, QDistinct> distinctByStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stat');
    });
  }
}

extension MStatQueryProperty on QueryBuilder<MStat, MStat, QQueryProperty> {
  QueryBuilder<MStat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MStat, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<MStat, ItemCode, QQueryOperations> itemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCode');
    });
  }

  QueryBuilder<MStat, Region, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }

  QueryBuilder<MStat, double, QQueryOperations> statProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stat');
    });
  }
}
