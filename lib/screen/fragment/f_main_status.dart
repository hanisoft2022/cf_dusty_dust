import 'package:dusty_dust/constant/text.dart';
import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/model/m_status.dart';
import 'package:dusty_dust/utils/date_utils.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class FMainStat extends StatelessWidget {
  final Region region;
  final Color primaryColor;
  final bool isExpanded;

  const FMainStat({
    super.key,
    required this.region,
    required this.primaryColor,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: primaryColor,
      surfaceTintColor: primaryColor,
      expandedHeight: 500,
      title: isExpanded ? null : Text(region.krName),
      centerTitle: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          width: double.infinity,
          child: FutureBuilder<MStat?>(
            future: GetIt.I<Isar>()
                .mStats
                .filter()
                .regionEqualTo(region)
                .itemCodeEqualTo(ItemCode.PM10)
                .sortByDateTimeDesc()
                .findFirst(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (!snapshot.hasData) {
                return const Text('데이터가 존재하지 않습니다.');
              }

              final mStat = snapshot.data;

              final MStatus status = StatusUtils.getMStatusFromStat(mStat!);

              return Column(
                children: [
                  const SizedBox(height: kToolbarHeight),
                  Text(
                    region.krName,
                    style: customTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateUtils.dateTimeToString(mStat.dateTime),
                    style: customTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(20),
                  Image.asset(
                    status.imagePath,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const Gap(20),
                  Text(status.label, style: customTextStyle),
                  const Gap(10),
                  Text(
                    status.comment,
                    style: customTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
