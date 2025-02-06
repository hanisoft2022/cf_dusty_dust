import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:dusty_dust/screen/fragment/f_category_status.dart';
import 'package:dusty_dust/screen/fragment/f_hourly_status.dart';
import 'package:dusty_dust/screen/fragment/f_main_status.dart';
import 'package:dusty_dust/utils/status_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class SHome extends ConsumerStatefulWidget {
  const SHome({super.key});

  @override
  SHomeState createState() => SHomeState();
}

class SHomeState extends ConsumerState<SHome> {
  Region region = Region.seoul;
  bool isExpanded = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    StatRepository.fetchData(ref);

    _scrollController.addListener(
      () {
        bool isExpanded = _scrollController.offset < (500 - kToolbarHeight);

        if (isExpanded != this.isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MStat?>(
      future: GetIt.I<Isar>().mStats.filter().regionEqualTo(region).itemCodeEqualTo(ItemCode.PM10).sortByDateTimeDesc().findFirst(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: Text(
                '데이터가 존재하지 않습니다.',
              ),
            ),
          );
        }

        final mStat = snapshot.data!;
        final mStatus = StatusUtils.getMStatusFromStat(mStat);
        final primaryColor = mStatus.primaryColor;
        final darkColor = mStatus.darkColor;
        final lightColor = mStatus.lightColor;

        return Scaffold(
          drawer: Drawer(
            backgroundColor: darkColor,
            child: ListView(
              children: [
                const DrawerHeader(margin: EdgeInsets.zero, child: Text('지역선택', style: TextStyle(color: Colors.white, fontSize: 20))),
                ...Region.values.map(
                  (r) => ListTile(
                    title: Text(r.krName),
                    selected: r == region,
                    selectedTileColor: lightColor,
                    selectedColor: Colors.black,
                    tileColor: Colors.white,
                    onTap: () {
                      setState(() => region = r);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SafeArea(
              bottom: false,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  FMainStat(
                    region: region,
                    primaryColor: primaryColor,
                    isExpanded: isExpanded,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        FCategoryStat(
                          region: region,
                          darkColor: darkColor,
                          lightColor: lightColor,
                        ),
                        const Gap(20),
                        FHourlyStat(
                          region: region,
                          darkColor: darkColor,
                          lightColor: lightColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
