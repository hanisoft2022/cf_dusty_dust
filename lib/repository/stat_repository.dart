import 'package:dio/dio.dart';
import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/common/provider/isar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

final List<String> skipKeys = [
  'dataGubun',
  'dataTime',
  'itemCode',
];

class StatRepository {
  static Future<void> fetchData(WidgetRef ref) async {
    final isar = ref.watch(isarProvider);

    final now = DateTime.now();
    final compareDateTimeTarget = DateTime(now.year, now.month, now.day, now.hour);

    final count = await isar.mStats.filter().dateTimeEqualTo(compareDateTimeTarget).count();

    if (count > 0) {
      // ignore: avoid_print
      print('데이터가 존재합니다 : count: $count');
      return;
    }

    for (ItemCode itemCode in ItemCode.values) {
      await fetchDataByItemCode(itemCode: itemCode);
    }
  }

  static Future<void> fetchDataByItemCode({required ItemCode itemCode}) async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': 'wBaiwb5TDQcAFK3vZyW83BNTPAzCVFMGCp4pNvy0+WVIrAqYstNcUjcjh8Xk4/qFQ/9kD2hMfIxMNJFFdzgyEw==',
        'returnType': 'json',
        'numOfRows': '100',
        'pageNo': '1',
        'itemCode': itemCode.name,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      },
    );

    final rawData = response.data['response']['body']['items'];
    if (rawData == null) {
      throw Exception('No data found in response');
    }

    if (rawData is! List) {
      throw Exception('Unexpected data format: items is not a List');
    }
    final List<Map<String, dynamic>> rawItemList = rawData.whereType<Map<String, dynamic>>().cast<Map<String, dynamic>>().toList();

    // List<MStat> listOfMStat = [];

    for (Map<String, dynamic> item in rawItemList) {
      final dateTime = DateTime.parse(item['dataTime']);

      for (String key in item.keys) {
        if (skipKeys.contains(key)) {
          continue;
        }
        // 지역명 변수
        final String regionName = key;
        // 지역명
        final Region region = Region.values.byName(regionName);
        // 통계값
        final double stat = double.parse(item[regionName]);

        // 통계 객체
        final mStat = MStat()
          ..region = region
          ..stat = stat
          ..dateTime = dateTime
          ..itemCode = itemCode;

        final isar = GetIt.I<Isar>();

        final count = await isar.mStats.filter().regionEqualTo(region).dateTimeEqualTo(dateTime).itemCodeEqualTo(itemCode).count();

        if (count > 0) {
          continue;
        }

        await isar.writeTxn(
          () async {
            await isar.mStats.put(mStat);
          },
        );
      }
    }

    // 데이터 출력 개선
    // for (var status in listOfMStat) {
    //   print(
    //       'City: ${status.region}, Status: ${status.stat}, DateTime: ${status.dateTime}, ItemCode: ${status.itemCode}');
    // }

    // return listOfMStat;
  }
}
