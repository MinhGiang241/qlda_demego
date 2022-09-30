// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';

class CreateRequestPurchaseScreen extends StatefulWidget {
  const CreateRequestPurchaseScreen({super.key});
  static const routeName = '/asset/request-purchase';

  @override
  State<CreateRequestPurchaseScreen> createState() =>
      _CreateRequestPurchaseScreenState();
}

const dataAssets = [
  {
    "Tên": "Bóng đèn",
    "Mã tài sản": "0001",
    "Loại": "1",
    "Nhóm": "1",
  },
  {
    "Tên": "Khăn",
    "Mã tài sản": "0002",
    "Loại": "2",
    "Nhóm": "2",
  },
  {
    "Tên": "Ổ điện",
    "Mã tài sản": "0003",
    "Loại": "3",
    "Nhóm": "3",
  },
];

class _CreateRequestPurchaseScreenState
    extends State<CreateRequestPurchaseScreen> {
  TextEditingController deathlineController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).send,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).cancel,
        icon: Icons.close,
        primary: redColor2,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).save_temp,
        icon: Icons.save,
        primary: greenColor6,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).cr_purchase_req_letter,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SearchBar(
              onPress: () {},
            ),
            vpad(12),
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    child: Text(
                      S.of(context).request_letter,
                      textAlign: TextAlign.center,
                      style: txtBodySmallBold(color: blueColor),
                    ),
                  ),
                  vpad(12),
                  PrimaryTextField(
                    label: S.of(context).title,
                    hint: S.of(context).enter_title,
                    isRequired: true,
                  ),
                  vpad(12),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryDropDown(
                          label: S.of(context).piority,
                          isRequired: true,
                        ),
                      ),
                      hpad(12),
                      Expanded(
                        child: PrimaryDropDown(
                          label: S.of(context).reason,
                          isRequired: true,
                        ),
                      )
                    ],
                  ),
                  vpad(12),
                  PrimaryTextField(
                    controller: deathlineController,
                    label: S.of(context).deathline_ex,
                    hint: S.of(context).select,
                    enable: false,
                    suffixIcon: const Icon(Icons.calendar_month),
                    onTap: () async {
                      var value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                          lastDate: DateTime(DateTime.now().year + 10, 1, 1));

                      if (value != null) {
                        deathlineController.text =
                            value.toIso8601String().formatDateTimeDMY();
                      }
                    },
                  ),
                  vpad(12),
                  PrimaryTextField(
                    label: S.of(context).description,
                    hint: S.of(context).enter,
                  ),
                  vpad(12),
                  Container(
                    child: Text(
                      S.of(context).asset_list,
                      style: txtBodySmallBold(color: blueColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  vpad(12),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        outside: BorderSide.none,
                        inside: const BorderSide(
                          width: 1,
                          color: grayScaleColorBase,
                        ),
                      ),
                      children: [
                        TableRow(
                          children: [
                            Text('đâsd'),
                            Text('đâsd'),
                            Text('đâsd'),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('đâsd'),
                            Text('đâsd'),
                            Text('đâsd'),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('đâsd'),
                            Text('đâsd'),
                            Text('đâsd'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(
        data: floatButtons,
      ),
    );
  }
}
