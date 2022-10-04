import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/screens/assets/tabs/history_delivery_tab.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../models/asset_model.dart';
import '../../widgets/primary_tabbar.dart';
import 'asset_screen.dart';
import 'tabs/detail_tab.dart';
import 'tabs/related_asset_tab.dart';
import 'update_asset_screen.dart';

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
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    var dataListInfo = {
      "Tên tài sản": arg['data'].displayName,
      "Code": arg['data'].code,
      "Ngày tạo": (arg['data'].createdTime! as String).formatDateTimeHmDMY(),
      "Ngày cập nhật":
          (arg['data'].updatedTime! as String).formatDateTimeHmDMY(),
      "Loại Tài sản": arg['data'].assetType!.displayName,
      "Số lượng": arg['data'].amount.toString(),
    };

    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).asset_detail,
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            AssetScreen.routeName,
          ),
        ),
      ),
      body: Column(
        children: [
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
              children: [
                DetailTab(data: dataListInfo),
                HistoryDeliveryTab(),
                RelatedAssetTab()
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context).pushNamed(UpdateAssetScreen.routeName);
        },
        child: const Icon(
          Icons.edit_note,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
