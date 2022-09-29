import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/screens/assets/tabs/history_delivery_tab.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_tabbar.dart';
import 'asset_screen.dart';
import 'tabs/detail_tab.dart';
import 'tabs/related_asset_tab.dart';

class AssetDetailScreen extends StatefulWidget {
  static const routeName = "/asset/detail";
  const AssetDetailScreen({super.key});

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(
          title: S.of(context).asset_detail,
          leading: BackButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, AssetScreen.routeName))),
      body: Column(children: [
        PrimaryTabBar(
          controller: _tabController,
          titles: [
            S.of(context).detail,
            S.of(context).history_delivery,
            S.of(context).related_asset
          ],
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: [DetailTab(), HistoryDeliveryTab(), RelatedAssetTab()]),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColorBase,
          onPressed: () {},
          child: const Icon(
            Icons.edit_note,
            size: 35,
            color: Colors.white,
          )),
    );
  }
}
