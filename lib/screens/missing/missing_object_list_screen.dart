import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_button.dart';
import '../assets/create_request_purchase_screen.dart';
import '../assets/export_request_screen.dart';
import '../assets/import_request_screen.dart';
import 'missing_object_detail_screen.dart';

var data = [
  {
    "ID": "0001",
    "Tên": "Thẻ xe",
    "Thời gian": "01/01/2022 - 12:00",
    "Địa điểm": "Sảnh nhà A",
    "Người báo cáo": "Nguyễn Văn A",
    "Trạng thái": "Hoàn thành",
    "Hình ảnh": {"link": "https://unsplash.it/640/425"}
  },
  {
    "ID": "0002",
    "Tên": "Chìa khóa",
    "Thời gian": "01/01/2022 - 12:00",
    "Địa điểm": "Thang máy tòa A",
    "Người báo cáo": "Nguyễn Văn A",
    "Trạng thái": "Đang chờ",
    "Hình ảnh": {"link": "https://unsplash.it/640/425"}
  },
  {
    "ID": "0003",
    "Tên": "Thẻ xe",
    "Thời gian": "01/01/2022 - 12:00",
    "Địa điểm": "Sảnh nhà A",
    "Người báo cáo": "Nguyễn Văn A",
    "Trạng thái": "Hoàn thành",
    "Hình ảnh": {"link": "https://unsplash.it/640/425"}
  },
];

class MissingObjectListScreen extends StatelessWidget {
  const MissingObjectListScreen({super.key});
  static const routeName = '/missing-object';

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).req_export,
        icon: Icons.logout,
        primary: primaryColor1,
        onPress: () {
          Navigator.of(context).pushNamed(ExportRequestScreen.routeName);
        },
      ),
      DialChildren(
        label: S.of(context).req_import,
        icon: Icons.login,
        primary: yellowColor,
        onPress: () {
          Navigator.of(context).pushNamed(ImportRequestScreen.routeName);
        },
      ),
      DialChildren(
        label: S.of(context).inventory,
        icon: Icons.check_circle,
        primary: greenColor,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).recommend_purchase,
        icon: Icons.shopping_cart,
        primary: purpleColor,
        onPress: () {
          Navigator.of(context)
              .pushNamed(CreateRequestPurchaseScreen.routeName);
        },
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).missing_obj_list),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: ((context, index) => InfoTable(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MissingObjectDetailScreen.routeName);
                      },
                      data: data[index],
                      child: data[index]['Trạng thái'] == "Đang chờ"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PrimaryButton(
                                  text: S.of(context).complete,
                                  buttonSize: ButtonSize.small,
                                  onTap: () {},
                                ),
                                hpad(35),
                                PrimaryButton(
                                  text: S.of(context).delete,
                                  buttonSize: ButtonSize.small,
                                  buttonType: ButtonType.secondary,
                                  secondaryBackgroundColor: redColor4,
                                  textColor: redColor,
                                  onTap: () {},
                                ),
                                hpad(12)
                              ],
                            )
                          : null,
                    )),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
