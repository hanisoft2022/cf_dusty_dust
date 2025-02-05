import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class FCategoryStat extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final Region region;

  const FCategoryStat({
    super.key,
    required this.region,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: double.infinity,
          height: 180,
          child: Column(
            children: [
              _CategoryStatusHeader(
                darkColor: darkColor,
              ),
              _CategoryStatusContent(
                constraint: constraint,
                region: region,
                lightColor: lightColor,
              )
            ],
          ),
        );
      },
    );
  }
}

class _CategoryStatusHeader extends StatelessWidget {
  final Color darkColor;

  const _CategoryStatusHeader({required this.darkColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          '종류별 통계',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _CategoryStatusContent extends StatelessWidget {
  final BoxConstraints constraint;
  final Region region;
  final Color lightColor;

  const _CategoryStatusContent({
    required this.constraint,
    required this.region,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          color: lightColor,
        ),
        child: ListView(
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: ItemCode.values
                .map(
                  (itemCode) => FutureBuilder(
                    future: GetIt.I<Isar>().mStats.filter().regionEqualTo(region).itemCodeEqualTo(itemCode).findFirst(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }

                      if (!snapshot.hasData) {
                        return Container();
                      }

                      final mStat = snapshot.data;
                      final mStatus = StatusUtils.getMStatusFromStat(mStat!);

                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        // parent 위젯인 SHome의 horizontal padding이 10이므로
                        // (MediaQuery.of(context).size.width - 20)로 설정할 수도 있다.
                        // 대신, 본 파일의 FCategoryStatus 위젯의 최상위 위젯인 SizedBoxed를 LayoutBuilder로 감싸고,
                        // LayoutBuilder에서 자동 제공되는 constraint 파라미터를 아래와 같이 사용해도 된다.
                        width: constraint.maxWidth / 3,
                        child: Column(
                          children: [
                            Text(itemCode.krName),
                            const Gap(10),
                            Expanded(
                              child: Image.asset(mStatus.imagePath),
                            ),
                            const Gap(10),
                            Text(mStat.stat.toString()),
                          ],
                        ),
                      );
                    },
                  ),
                )
                .toList()

            // List.generate(
            //   10,
            //   (index) => Container(
            //     padding: const EdgeInsets.symmetric(vertical: 5),
            //     // parent 위젯인 SHome의 horizontal padding이 20이므로
            //     // (MediaQuery.of(context).size.width - 20)로 설정할 수도 있다.
            //     // 대신, 본 파일의 FCategoryStatus 위젯의 최상위 위젯인 SizedBoxed를 LayoutBuilder로 감싸고,
            //     // LayoutBuilder에서 자동 제공되는 constraint 파라미터를 아래와 같이 사용해도 된다.
            //     width: constraint.maxWidth / 3,
            //     child: Column(
            //       children: [
            //         const Text('미세먼지'),
            //         const Gap(10),
            //         Expanded(
            //           child: Image.asset(
            //             'asset/img/bad.png',
            //           ),
            //         ),
            //         const Gap(10),
            //         const Text('56.0'),
            //       ],
            //     ),
            //   ),
            // ),
            ),
      ),
    );
  }
}
