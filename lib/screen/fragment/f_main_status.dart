import 'package:dusty_dust/constant/text.dart';
import 'package:dusty_dust/model/m_stat.dart';

import 'package:dusty_dust/provider/stat_provider.dart';
import 'package:dusty_dust/utils/date_utils.dart';

import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class FMainStat extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final mStatAsync = ref.watch(mStatProvider(region));
    final mStatusAsync = ref.watch(mStatusProvider(region));

    return SliverAppBar(
      backgroundColor: primaryColor,
      surfaceTintColor: primaryColor,
      expandedHeight: 500,
      title: isExpanded ? null : Text(region.krName),
      centerTitle: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: mStatAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('에러 발생: $e')),
          data: (mStat) {
            if (mStat == null) {
              return const Center(child: Text('데이터가 존재하지 않습니다.'));
            }

            // mStatusAsync는 mStatProvider가 성공한 경우에 StatusUtils를 통해 변환된 값입니다.
            final status = mStatusAsync.asData?.value;
            if (status == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight),
                  Text(region.krName, style: customTextStyle.copyWith(fontWeight: FontWeight.bold)),
                  // 날짜는 mStat에서 가져옵니다.
                  Text(DateUtils.dateTimeToString(mStat.dateTime), style: customTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal)),
                  const Gap(20),
                  Image.asset(status.imagePath, width: MediaQuery.of(context).size.width / 2),
                  const Gap(20),
                  Text(status.label, style: customTextStyle),
                  const Gap(10),
                  Text(status.comment, style: customTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
