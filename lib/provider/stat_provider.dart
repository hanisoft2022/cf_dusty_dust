import 'package:dusty_dust/common/provider/isar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dusty_dust/model/m_stat.dart';

import 'package:isar/isar.dart';

final mStatProvider = FutureProvider.family<MStat?, Region>((ref, region) async {
  final isar = ref.read(isarProvider);
  // PM10 항목에 대한 최신 통계 데이터를 가져옵니다.
  final mStat = await isar.mStats.filter().regionEqualTo(region).itemCodeEqualTo(ItemCode.PM10).sortByDateTimeDesc().findFirst();
  return mStat;
});
