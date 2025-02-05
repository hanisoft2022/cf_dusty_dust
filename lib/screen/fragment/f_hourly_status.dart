import 'package:dusty_dust/model/m_stat.dart';

import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class FHourlyStat extends StatelessWidget {
  final Region region;
  final Color darkColor;
  final Color lightColor;

  const FHourlyStat({
    super.key,
    required this.region,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    const items = ItemCode.values;

    return Column(
      children: List.generate(
        items.length,
        (index) => Column(
          children: [
            FutureBuilder<List<MStat>>(
              future: GetIt.I<Isar>()
                  .mStats
                  .filter()
                  .regionEqualTo(region)
                  .itemCodeEqualTo(items[index])
                  .sortByDateTime()
                  .limit(24)
                  .findAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                final statuses = snapshot.data!;

                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      _HourlyStatusHeader(
                        itemCode: items[index],
                        darkColor: darkColor,
                      ),
                      _HourlyStatusContent(
                        lightColor: lightColor,
                        statuses: statuses,
                      ),
                      if (index != items.length - 1) const Gap(20),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
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

                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('${stat.dateTime.hour.toString().padLeft(2, '0')}시'),
                //     Image.asset(
                //       StatusUtils.getMStatusFromStat(stat).imagePath,
                //       height: 20,
                //     ),
                //     Text(StatusUtils.getMStatusFromStat(stat).label),
                //   ],
                // ),

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
