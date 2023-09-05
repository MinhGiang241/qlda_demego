import 'package:flutter/material.dart' hide SearchBar;
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
import '../../widgets/primary_button.dart';
import 'add_parcel_screen.dart';
import 'dialog/parcel_dialog.dart';
import 'parcel_detail_screen.dart';

class ParcelListScreen extends StatefulWidget {
  const ParcelListScreen({super.key});
  static const routeName = '/parcel';

  @override
  State<ParcelListScreen> createState() => _ParcelListScreenState();
}

class _ParcelListScreenState extends State<ParcelListScreen> {
  var data = [
    {
      "ID": "0001",
      "Người gửi": "Nguyễn Văn A",
      "Số điện thoại người gửi": "0987654321",
      "Người nhận": "Nguyễn Văn B",
      "Số điện thoại người nhận": "0987654320",
      "Người báo cáo": "Nguyễn Văn A",
      "Địa chỉ": "A1-1998",
      "Trạng thái": "Hoàn thành",
      "Hình ảnh": {"link": "https://unsplash.it/100/100"}
    },
    {
      "ID": "0002",
      "Người gửi": "Nguyễn Văn A",
      "Số điện thoại người gửi": "0987654321",
      "Người nhận": "Nguyễn Văn B",
      "Số điện thoại người nhận": "0987654320",
      "Người báo cáo": "Nguyễn Văn A",
      "Địa chỉ": "A1-1998",
      "Trạng thái": "Hoàn thành",
      "Hình ảnh": {"link": "https://unsplash.it/100/100"}
    },
    {
      "ID": "0003",
      "Người gửi": "Nguyễn Văn A",
      "Số điện thoại người gửi": "0987654321",
      "Người nhận": "Nguyễn Văn B",
      "Số điện thoại người nhận": "0987654320",
      "Người báo cáo": "Nguyễn Văn A",
      "Địa chỉ": "A1-1998",
      "Trạng thái": "Hoàn thành",
      "Hình ảnh": {"link": "https://unsplash.it/100/100"}
    },
  ];
  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).parcel_list,
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            Flexible(
              child: ListView(
                children: [
                  ...data.asMap().entries.map(
                        (e) => InfoTable(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ParcelDetailScreen.routeName);
                          },
                          data: data[e.key],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PrimaryButton(
                                text: S.of(context).transfer,
                                buttonSize: ButtonSize.medium,
                                onTap: () {
                                  onEditParcel(context, () {});
                                },
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
                                      S.of(context).confirm_detele_config, () {
                                    data.removeWhere(
                                      (element) =>
                                          element['ID'] == data[e.key]['ID'],
                                    );
                                    setState(() {});
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              hpad(12)
                            ],
                          ),
                        ),
                      ),
                  vpad(70)
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context).pushNamed(AddParcelScreen.routeName);
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
