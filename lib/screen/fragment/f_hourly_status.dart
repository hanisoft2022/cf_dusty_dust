import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/provider/stat_provider.dart';

import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class FHourlyStat extends ConsumerWidget {
  final Region region;
  final Color darkColor;
  final Color lightColor;

  const FHourlyStat({super.key, required this.region, required this.darkColor, required this.lightColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const items = ItemCode.values;

    return Column(
      children: List.generate(
        items.length,
        (index) => Column(
          children: [
            _HourlyStatTile(
              region: region,
              itemCode: items[index],
              darkColor: darkColor,
              lightColor: lightColor,
            ),
            // 각 항목 사이에 Gap 추가 (마지막 항목 제외)
            if (index != items.length - 1) const Gap(20),
          ],
        ),
      ),
    );
  }
}

class _HourlyStatTile extends ConsumerWidget {
  final Region region;
  final ItemCode itemCode;
  final Color darkColor;
  final Color lightColor;

  const _HourlyStatTile({
    required this.region,
    required this.itemCode,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mStatHourlyAsync = ref.watch(mStatHourlyProvider(MStatQueryArgs(region, itemCode)));

    return mStatHourlyAsync.when(
      loading: () => const SizedBox(width: double.infinity, height: 100, child: Center(child: CircularProgressIndicator())),
      error: (err, st) => SizedBox(width: double.infinity, child: Center(child: Text(err.toString()))),
      data: (statuses) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _HourlyStatusHeader(itemCode: itemCode, darkColor: darkColor),
              _HourlyStatusContent(lightColor: lightColor, statuses: statuses),
            ],
          ),
        );
      },
    );
  }
}

class _HourlyStatusHeader extends StatelessWidget {
  final Color darkColor;
  final ItemCode itemCode;

  const _HourlyStatusHeader({
    required this.darkColor,
    required this.itemCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          '시간별 ${itemCode.krName}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _HourlyStatusContent extends StatelessWidget {
  const _HourlyStatusContent({
    required this.lightColor,
    required this.statuses,
  });

  final Color lightColor;
  final List<MStat> statuses;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: lightColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: statuses
            .map(
              (stat) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${stat.dateTime.hour.toString().padLeft(2, '0')}시'),
                        Text(
                          StatusUtils.getMStatusFromStat(stat).label,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Image.asset(
                          StatusUtils.getMStatusFromStat(stat).imagePath,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
