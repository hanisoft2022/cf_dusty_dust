import 'package:dusty_dust/common/provider/isar_provider.dart';
import 'package:dusty_dust/model/m_status.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dusty_dust/model/m_stat.dart';

import 'package:isar/isar.dart';

final mStatProvider = FutureProvider.family<MStat?, Region>((ref, region) async {
  final isar = ref.read(isarProvider);
  // PM10 항목에 대한 최신 통계 데이터를 가져옵니다.
  final mStat = await isar.mStats.filter().regionEqualTo(region).itemCodeEqualTo(ItemCode.PM10).sortByDateTimeDesc().findFirst();
  return mStat;
});

final statInitializerProvider = FutureProvider<void>((ref) async {
  await StatRepository.fetchData(ref);
});

final regionProvider = StateProvider<Region>((ref) => Region.seoul);

// mStatProvider로부터 변환된 MStatus를 제공하는 provider
final mStatusProvider = Provider.family<AsyncValue<MStatus?>, Region>((ref, region) {
  final mStatAsync = ref.watch(mStatProvider(region));
  // mStatAsync가 data 상태일 때, StatusUtils를 통해 MStatus로 변환합니다.
  return mStatAsync.whenData((mStat) {
    if (mStat == null) return null;
    return StatusUtils.getMStatusFromStat(mStat);
  });
});

class MStatQueryArgs {
  final Region region;
  final ItemCode itemCode;
  const MStatQueryArgs(this.region, this.itemCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MStatQueryArgs && runtimeType == other.runtimeType && region == other.region && itemCode == other.itemCode;

  @override
  int get hashCode => region.hashCode ^ itemCode.hashCode;
}

final mStatByItemProvider = FutureProvider.family<MStat?, MStatQueryArgs>((ref, args) async {
  final isar = ref.read(isarProvider);
  // 해당 지역(args.region)과 항목(args.itemCode)에 대한 최신 통계 데이터를 조회합니다.
  final mStat = await isar.mStats.filter().regionEqualTo(args.region).itemCodeEqualTo(args.itemCode).findFirst();
  return mStat;
});

final mStatHourlyProvider = FutureProvider.family<List<MStat>, MStatQueryArgs>((ref, args) async {
  final isar = ref.read(isarProvider);
  final mStats = await isar.mStats.filter().regionEqualTo(args.region).itemCodeEqualTo(args.itemCode).sortByDateTime().limit(24).findAll();
  return mStats;
});
