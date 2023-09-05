import 'package:flutter/material.dart' hide SearchBar;
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../utils/dialog.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_screen.dart';
import 'add_entrance_screen.dart';
import 'entrance_detail_screen.dart';

class EntranceListScreen extends StatefulWidget {
  const EntranceListScreen({super.key});
  static const routeName = '/entrance';

  @override
  State<EntranceListScreen> createState() => _EntranceListScreenState();
}

class _EntranceListScreenState extends State<EntranceListScreen> {
  var data = [
    {
      "ID": "0001",
      "Tên": "Nguyễn Văn A",
      "Số điện thoại": "0123456789",
      "CCCD/Hộ chiếu": "1978392130218",
      "Lý do": "Thăm người nhà",
      "Thời gian": "01/01/2022 - 8:00",
      "Trạng thái": "Đang mở",
      "Tòa nhà": "A2-2002",
      "Số thẻ tham quan": "12356839"
    },
    {
      "ID": "0002",
      "Tên": "Nguyễn Văn A",
      "Số điện thoại": "0123456789",
      "CCCD/Hộ chiếu": "1978392130218",
      "Lý do": "Thăm người nhà",
      "Thời gian": "01/01/2022 - 8:00",
      "Trạng thái": "Đã đóng",
      "Tòa nhà": "A2-2002",
      "Số thẻ tham quan": "12356839"
    },
    {
      "ID": "0003",
      "Tên": "Nguyễn Văn A",
      "Số điện thoại": "0123456789",
      "CCCD/Hộ chiếu": "1978392130218",
      "Lý do": "Thăm người nhà",
      "Thời gian": "01/01/2022 - 8:00",
      "Trạng thái": "Đang mở",
      "Tòa nhà": "A2-2002",
      "Số thẻ tham quan": "12356839"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).add,
        icon: Icons.add_box,
        primary: secondaryColorBase,
        onPress: () {
          Navigator.of(context).pushNamed(AddEntranceScreen.routeName);
        },
      ),
    ];

    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).penetration),
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
                            Navigator.of(context).pushNamed(
                                EntranceDetailsScreen.routeName,
                                arguments: e.value);
                          },
                          data: e.value,
                          child: (data[e.key]['Trạng thái'] == 'Đang mở')
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
