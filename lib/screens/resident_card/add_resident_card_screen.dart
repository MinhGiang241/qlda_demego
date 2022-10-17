import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_screen.dart';
import 'dialog/resident_card_dialog.dart';

class AddResidentCardScreen extends StatelessWidget {
  const AddResidentCardScreen({super.key});
  static const routeName = '/resident-card/add';

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).activate,
        icon: Icons.send,
        primary: greenColorBase,
        onPress: () {
          showExistedDailog(context, () {});
        },
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

    // var arg;
    // if (ModalRoute.of(context)!.settings.arguments != null) {
    //   arg = ModalRoute.of(context)!.settings.arguments as Map;
    // } else {
    //   arg = {"isEdit": false};
    // }
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).add_res_card),
      body: ListView(
        children: [
          vpad(12),
          PrimaryTextField(
            label: S.of(context).card_owner,
            isRequired: true,
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).phone_num,
            isRequired: true,
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryDropDown(
                  label: S.of(context).building,
                  isRequired: true,
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryDropDown(
                  label: S.of(context).floor,
                  isRequired: true,
                ),
              ),
            ],
          ),
          vpad(12),
          PrimaryDropDown(
            label: S.of(context).surface,
            isRequired: true,
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).surface,
            isRequired: true,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
