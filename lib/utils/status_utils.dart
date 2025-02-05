import 'package:dusty_dust/constant/status_level.dart';
import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/model/m_status.dart';

class StatusUtils {
  static MStatus getMStatusFromStat(MStat mStat) {
    final itemCode = mStat.itemCode;

    final int index = statusLevels.indexWhere(
      (e) {
        switch (itemCode) {
          case ItemCode.PM10:
            return mStat.stat < e.minPM10;
          case ItemCode.PM25:
            return mStat.stat < e.minPM25;
          case ItemCode.CO:
            return mStat.stat < e.minCO;
          case ItemCode.NO2:
            return mStat.stat < e.minNO2;
          case ItemCode.O3:
            return mStat.stat < e.minO3;
          case ItemCode.SO2:
            return mStat.stat < e.minSO2;
          default:
            throw Exception('존재하지 않는 itemCode입니다.');
        }
      },
    );

    if (index < 0) {
      throw Exception('Index를 찾지 못했습니다.');
    }

    return statusLevels[index - 1];
  }
}
