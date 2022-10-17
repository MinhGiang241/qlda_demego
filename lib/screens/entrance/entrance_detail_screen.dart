import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_screen.dart';
import '../../widgets/primary_text_field.dart';

class EntranceDetailsScreen extends StatelessWidget {
  const EntranceDetailsScreen({super.key});
  static const routeName = '/entrance/detail';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var floatButtons = [
      DialChildren(
        label: S.of(context).complete,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).edit,
        icon: Icons.edit_note,
        primary: yellowColor,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).entrance_detail),
      body: ListView(
        children: [
          vpad(12),
          PrimaryTextField(
            label: S.of(context).name,
            isRequired: true,
            initialValue: arg["Tên"],
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).visit_card_num,
            isRequired: true,
            initialValue: arg["Trạng thái"],
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).phone_num,
                  isRequired: true,
                  initialValue: arg["Số điện thoại"],
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).cccd_passport,
                  isRequired: true,
                  initialValue: arg['CCCD/Hộ chiếu'],
                ),
              ),
            ],
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).building,
                  isRequired: true,
                  initialValue: arg["Tòa nhà"],
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).visit_card_num,
                  isRequired: true,
                  initialValue: arg["Số thẻ tham quan"],
                ),
              ),
            ],
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).reason,
            isRequired: true,
            initialValue: arg["Lý do"],
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).note,
          ),
        ],
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
