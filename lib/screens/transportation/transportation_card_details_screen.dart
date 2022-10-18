import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/float_button.dart';
import 'dialog/transportation_dialog.dart';

class TransportationCardDetailScreen extends StatelessWidget {
  const TransportationCardDetailScreen({super.key});
  static const routeName = '/transportation/details';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var floatButtons = [
      DialChildren(
        label: S.of(context).activate,
        icon: Icons.send,
        primary: greenColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).wait,
        icon: Icons.access_time_rounded,
        primary: yellowColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).cancel,
        icon: Icons.close,
        primary: redColor2,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).trans_card_detail),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            Text(
              S.of(context).card_owner_info,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            PrimaryTextField(
              initialValue: arg["Chủ thẻ"],
              label: S.of(context).card_owner,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              initialValue: arg["Số điện thoại"],
              label: S.of(context).phone_num,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              initialValue: arg["Địa chỉ"],
              label: S.of(context).address,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              initialValue: arg["Số thẻ"],
              label: S.of(context).card_num,
              isRequired: true,
            ),
            vpad(12),
            Text(
              S.of(context).trans_info,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    initialValue: arg['Thông tin xe']['Trạng thái'],
                    label: S.of(context).status,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    initialValue: arg['Thông tin xe']['Loại'],
                    label: S.of(context).type,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    initialValue: arg['Thông tin xe']['Loại'],
                    label: S.of(context).variety,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    initialValue: arg['Thông tin xe']['Biển kiểm soát'],
                    label: S.of(context).license,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    initialValue: arg['Thông tin xe']['Màu'],
                    label: S.of(context).color,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    initialValue: arg['Thông tin xe']['Số đăng ký'],
                    label: S.of(context).register_num,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            vpad(12),
            Text(
              S.of(context).pay_history,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            ...arg['Lịch sử thanh toán'].map((e) => InfoTable(data: e)),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: S.of(context).extend,
                  onTap: () {
                    showExtendTransportationDialog(context, () {});
                  },
                )
              ],
            ),
            vpad(70),
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
