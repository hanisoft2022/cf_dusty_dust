import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/provider/stat_provider.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class FCategoryStat extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final Region region;

  const FCategoryStat({super.key, required this.region, required this.darkColor, required this.lightColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: double.infinity,
          height: 180,
          child: Column(
            children: [
              _CategoryStatusHeader(darkColor: darkColor),
              _CategoryStatusContent(constraint: constraint, region: region, lightColor: lightColor)
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
        borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text('종류별 통계', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _CategoryStatusContent extends StatelessWidget {
  final BoxConstraints constraint;
  final Region region;
  final Color lightColor;

  const _CategoryStatusContent({required this.constraint, required this.region, required this.lightColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)), color: lightColor),
        child: ListView(
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: ItemCode.values
              .map(
                (itemCode) => _CategoryStatTile(
                  region: region,
                  itemCode: itemCode,
                  width: constraint.maxWidth / 3,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _CategoryStatTile extends ConsumerWidget {
  final Region region;
  final ItemCode itemCode;
  final double width;

  const _CategoryStatTile({
    required this.region,
    required this.itemCode,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mStatAsync = ref.watch(mStatByItemProvider(MStatQueryArgs(region, itemCode)));

    return mStatAsync.when(
      loading: () => SizedBox(width: width, child: const Center(child: CircularProgressIndicator())),
      error: (err, st) => SizedBox(width: width, child: Center(child: Text(err.toString()))),
      data: (mStat) {
        if (mStat == null) return Container(width: width);
        final mStatus = StatusUtils.getMStatusFromStat(mStat);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: width,
          child: Column(
            children: [
              Text(itemCode.krName),
              const Gap(10),
              Expanded(child: Image.asset(mStatus.imagePath)),
              const Gap(10),
              Text(mStat.stat.toString()),
            ],
          ),
        );
      },
    );
  }
}
