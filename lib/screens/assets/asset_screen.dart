import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/float_button.dart';
import '../../widgets/search_bar.dart';
import 'asset_detail.dart';

var data = [
  {
    "Tên tài sản": "Kìm chống điện",
    "Đơn vị tính": "Cái",
    "Tồn kho": 10,
    "Bộ phận": "Kỹ thuật",
    "Loại": "Vật tư",
    "Nhóm": "Kim"
  },
  {
    "Tên tài sản": "Kìm chống điện",
    "Đơn vị tính": "Cái",
    "Tồn kho": 10,
    "Bộ phận": "Kỹ thuật",
    "Loại": "Vật tư",
    "Nhóm": "Kim"
  },
  {
    "Tên tài sản": "Kìm chống điện",
    "Đơn vị tính": "Cái",
    "Tồn kho": 10,
    "Bộ phận": "Kỹ thuật",
    "Loại": "Vật tư",
    "Nhóm": "Kim"
  },
];

class AssetScreen extends StatefulWidget {
  static const routeName = '/asset';
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
          label: S.of(context).req_export,
          icon: Icons.logout,
          primary: primaryColor1,
          onPress: () {}),
      DialChildren(
          label: S.of(context).req_import,
          icon: Icons.login,
          primary: yellowColor,
          onPress: () {}),
      DialChildren(
          label: S.of(context).inventory,
          icon: Icons.check_circle,
          primary: greenColor,
          onPress: () {}),
      DialChildren(
          label: S.of(context).recommend_purchase,
          icon: Icons.shopping_cart,
          primary: purpleColor,
          onPress: () {}),
    ];

    return PrimaryScreen(
        appBar: PrimaryAppbar(title: S.of(context).asset_manage),
        drawer: MainDrawer(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SearchBar(onPress: () {}),
                Flexible(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return InfoTable(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AssetDetailScreen.routeName);
                            },
                            data: data[i]);
                      }),
                )
              ],
            )),
        floatingActionButton: FloatDialButton(
          data: floatButtons,
        ));
  }
}
