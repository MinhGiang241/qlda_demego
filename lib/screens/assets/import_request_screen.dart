import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/primary_screen.dart';
import 'asset_screen.dart';
import 'components/import_asset.dart';

var data = [
  {
    "id": "1",
    "Tên": 'Thẻ xe 1',
    "Mục đích": "Nhập kho",
    "Số lượng cho phép": "A",
    "Số lượng nhập kho": "Cái"
  },
  {
    "id": "2",
    "Tên": 'Thẻ xe 2',
    "Mục đích": "Nhập kho",
    "Số lượng cho phép": "A",
    "Số lượng nhập kho": "Cái"
  },
  {
    "id": "3",
    "Tên": 'Thẻ xe 3',
    "Mục đích": "Nhập kho",
    "Số lượng cho phép": "A",
    "Số lượng nhập kho": "Cái"
  },
  {
    "id": "4",
    "Tên": 'Thẻ xe 4',
    "Mục đích": "Nhập kho",
    "Số lượng cho phép": "A",
    "Số lượng nhập kho": "Cái"
  },
];

class ImportRequestScreen extends StatefulWidget {
  const ImportRequestScreen({super.key});
  static const routeName = '/asset/import-requets-asset';

  @override
  State<ImportRequestScreen> createState() => _ImportRequestScreenState();
}

class _ImportRequestScreenState extends State<ImportRequestScreen> {
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).complete,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).add_product,
        icon: Icons.add,
        primary: redColor2,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).cr_import_request_letter,
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            AssetScreen.routeName,
          ),
        ),
      ),
      body: ListView(
        children: [
          vpad(12),
          PrimaryCard(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 21),
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "Nhập kho :",
                        style: txtBodySmallBold(color: grayScaleColorBase),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 3,
                      child: Text(
                        textAlign: TextAlign.start,
                        "000001",
                        style: txtBodySmallBold(),
                      ),
                    ),
                  ],
                ),
                vpad(16),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "Tình trạng :",
                        style: txtBodySmallBold(color: grayScaleColorBase),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 3,
                      child: Text(
                        textAlign: TextAlign.start,
                        "Chờ thực hiện",
                        style: txtBodySmallBold(color: redColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  controller: dateController,
                  onTap: () async {
                    var value = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                      lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                    );

                    if (value != null) {
                      dateController.text =
                          value.toIso8601String().formatDateTimeDMY();
                    }
                  },
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                  enable: false,
                  label: S.of(context).deathline,
                ),
              ),
              hpad(20),
              Expanded(
                child: PrimaryDropDown(
                  label: S.of(context).piority,
                ),
              )
            ],
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).note,
            maxLines: 4,
          ),
          vpad(12),
          PrimaryDropDown(
            label: S.of(context).assign_person,
          ),
          vpad(12),
          Text(
            S.of(context).asset_list,
            style: txtBodySmallBold(color: blueColor),
            textAlign: TextAlign.center,
          ),
          vpad(12),
          ...data.map((e) => ImportAsset(data: e))
        ],
      ),
      floatingActionButton: FloatDialButton(
        data: floatButtons,
      ),
    );
  }
}
