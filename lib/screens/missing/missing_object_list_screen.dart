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
import '../../utils/dialog.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_button.dart';
import '../assets/create_request_purchase_screen.dart';
import '../assets/export_request_screen.dart';
import '../assets/import_request_screen.dart';
import 'missing_object_detail_screen.dart';

class MissingObjectListScreen extends StatefulWidget {
  const MissingObjectListScreen({super.key});
  static const routeName = '/missing-object';

  @override
  State<MissingObjectListScreen> createState() =>
      _MissingObjectListScreenState();
}

class _MissingObjectListScreenState extends State<MissingObjectListScreen> {
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...data.asMap().entries.map(
                        (e) => InfoTable(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MissingObjectDetailScreen.routeName);
                          },
                          data: data[e.key],
                          child: data[e.key]['Trạng thái'] == "Đang chờ"
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    PrimaryButton(
                                      text: S.of(context).complete,
                                      buttonSize: ButtonSize.medium,
                                      onTap: () {},
                                    ),
                                    hpad(35),
                                    PrimaryButton(
                                      text: S.of(context).delete,
                                      buttonSize: ButtonSize.medium,
                                      buttonType: ButtonType.secondary,
                                      secondaryBackgroundColor: redColor4,
                                      textColor: redColor,
                                      onTap: () {
                                        onConfirmDelete(context,
                                            S.of(context).confirm_detele_config,
                                            () {
                                          data.removeWhere(
                                            (element) =>
                                                element['ID'] ==
                                                data[e.key]['ID'],
                                          );
                                          setState(() {});
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                    hpad(12)
                                  ],
                                )
                              : null,
                        ),
                      ),
                  vpad(70)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
