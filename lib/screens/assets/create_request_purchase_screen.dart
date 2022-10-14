// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import 'components/data_asset_list_table.dart';
import 'components/data_asset_quotation_table.dart';
import 'dailog/show_dailog_request_letter.dart';

const dataAssets = [
  {
    "STT": "1",
    "Tên": "Bóng đèn",
    "Mã tài sản": "0001",
    "Loại": "1",
    "Nhóm": "1",
  },
  {
    "STT": "2",
    "Tên": "Khăn",
    "Mã tài sản": "0002",
    "Loại": "2",
    "Nhóm": "2",
  },
  {
    "STT": "3",
    "Tên": "Ổ điện",
    "Mã tài sản": "0003",
    "Loại": "3",
    "Nhóm": "3",
  },
];

var dataQuotation = [
  {
    "STT": 1,
    "Tên nhà cung cấp": "NCC1",
    "Số lượng": 12,
    "Mã tài sản": '',
    "Đơn Giá": '',
    "Thành tiền": 65000,
    "Danh sách": [
      {
        "Tài sản": "Bóng đèn",
        "Mã tài sản": "0001",
        "Số lượng": 5,
        "Đơn giá": 60000,
        "Thành Tiền": 300000
      },
      {
        "Tài sản": "Khăn",
        "Mã tài sản": "0002",
        "Số lượng": 4,
        "Đơn giá": 20000,
        "Thành Tiền": 80000
      },
      {
        "Tài sản": "Bóng đèn",
        "Mã tài sản": "0003",
        "Số lượng": 3,
        "Đơn giá": 90000,
        "Thành Tiền": 2700000
      },
    ]
  },
  {
    "STT": 2,
    "Tên nhà cung cấp": "NCC2",
    "Số lượng": 12,
    "Mã tài sản": '',
    "Đơn Giá": '',
    "Thành tiền": 65000,
    "Danh sách": [
      {
        "Tài sản": "Bóng đèn",
        "Mã tài sản": "0001",
        "Số lượng": 5,
        "Đơn giá": 60000,
        "Thành Tiền": 300000
      },
      {
        "Tài sản": "Khăn",
        "Mã tài sản": "0002",
        "Số lượng": 4,
        "Đơn giá": 20000,
        "Thành Tiền": 80000
      },
      {
        "Tài sản": "Bóng đèn",
        "Mã tài sản": "0003",
        "Số lượng": 3,
        "Đơn giá": 90000,
        "Thành Tiền": 2700000
      },
    ]
  },
  {
    "STT": 3,
    "Tên nhà cung cấp": "NCC3",
    "Số lượng": 12,
    "Mã tài sản": '',
    "Đơn Giá": '',
    "Thành tiền": 65000,
    "Danh sách": [
      {
        "Tài sản": "Bóng đèn",
        "Mã tài sản": "0001",
        "Số lượng": 5,
        "Đơn giá": 60000,
        "Thành Tiền": 300000
      },
      {
        "Tài sản": "Khăn",
        "Mã tài sản": "0002",
        "Số lượng": 4,
        "Đơn giá": 20000,
        "Thành Tiền": 80000
      },
      {
        "Tài sản": "Bóng đèn",
        "Mã tài sản": "0003",
        "Số lượng": 3,
        "Đơn giá": 90000,
        "Thành Tiền": 2700000
      },
    ]
  },
];

class CreateRequestPurchaseScreen extends StatefulWidget {
  const CreateRequestPurchaseScreen({super.key});
  static const routeName = '/asset/request-purchase';

  @override
  State<CreateRequestPurchaseScreen> createState() =>
      _CreateRequestPurchaseScreenState();
}

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
      body: SafeArea(
        child: Column(
          children: [
            vpad(12),
            Flexible(
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
                      hpad(35),
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
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

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
                  Center(
                    child: Text(
                      S.of(context).asset_list,
                      style: txtBodySmallBold(color: blueColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  vpad(12),
                  DataAssetListTable(data: dataAssets),
                  vpad(12),
                  Center(
                    child: PrimaryButton(
                      onTap: () {
                        addRequestAsset(context);
                      },
                      width: dvWidth(context) * 0.56,
                      text: S.of(context).add_request_asset,
                      buttonType: ButtonType.secondary,
                      secondaryBackgroundColor: secondaryColorBase,
                    ),
                  ),
                  vpad(12),
                  Center(
                    child: Text(
                      S.of(context).quotation,
                      style: txtBodySmallBold(color: blueColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  vpad(12),
                  DataAssetQuotationTable(
                    data: dataQuotation,
                  ),
                  vpad(12),
                  Center(
                    child: PrimaryButton(
                      onTap: () {
                        addSupplier(context);
                      },
                      width: dvWidth(context) * 0.56,
                      text: S.of(context).add_supplier,
                      buttonType: ButtonType.secondary,
                      secondaryBackgroundColor: secondaryColorBase,
                    ),
                  ),
                  vpad(50)
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
