import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_button.dart';
import 'asset_screen.dart';

const data = {
  "Tên": "Bóng đèn",
  "Loại": 1,
  "Mã": "A",
  "Đơn vị": "Cái",
  "Số lượng": 5,
  "Mục đích": "Mượn"
};

class ExportRequestScreen extends StatelessWidget {
  const ExportRequestScreen({super.key});

  static const routeName = '/asset/export-requets-asset';

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
        title: S.of(context).req_export,
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            AssetScreen.routeName,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            PrimaryTextField(
              label: S.of(context).title,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).reason,
              isRequired: true,
              maxLines: 5,
            ),
            vpad(16),
            Text(
              S.of(context).recommendation_list,
              style: txtBodySmallBold(color: blueColor),
              textAlign: TextAlign.center,
            ),
            vpad(16),
            InfoTable(
              data: data,
            ),
            Center(
              child: PrimaryButton(
                onTap: () {},
                // width: dvWidth(context) * 0.56,
                text: S.of(context).add_request_asset,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: secondaryColorBase,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(
        data: floatButtons,
      ),
    );
  }
}
