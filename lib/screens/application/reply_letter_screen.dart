import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_dropdown.dart';
import '../../widgets/primary_screen.dart';
import '../../widgets/primary_text_field.dart';
import 'components/application_card.dart';
import 'detail_letter_screen.dart';

class ReplyLetterScreen extends StatelessWidget {
  const ReplyLetterScreen({
    super.key,
  });

  static const routeName = '/application/reply';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return PrimaryScreen(
        appBar: PrimaryAppbar(
          title: arg['Loại đơn'] == "Đơn xin nghỉ phép"
              ? S.of(context).reply_absent_letter
              : arg['Loại đơn'] == "Đơn xin nghỉ giữa giờ"
                  ? S.of(context).reply_break_letter
                  : arg['Loại đơn'] == "Đơn xin đổi ca"
                      ? S.of(context).reply_change_shift
                      : "",
          // leading: BackButton(
          //     onPressed: () =>
          //         Navigator.pushNamed(context, DetailLetterScreen.routeName)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(children: [
            ListView(
              children: [
                vpad(16),
                PrimaryDropDown(
                  label: S.of(context).decision,
                  isRequired: true,
                ),
                vpad(16),
                PrimaryTextField(
                  label: S.of(context).note,
                  maxLines: 3,
                  hint: S.of(context).enter_note,
                ),
                vpad(16),
                if (arg['Loại đơn'] == "Đơn xin nghỉ phép")
                  PrimaryDropDown(
                    label: S.of(context).res_person,
                    isRequired: true,
                  ),
                if (arg['Loại đơn'] == "Đơn xin nghỉ giữa giờ")
                  PrimaryDropDown(
                    label: S.of(context).assign_person,
                    isRequired: true,
                  ),
                vpad(16),
                ApllicationCard(data: arg),
                vpad(70),
              ],
            ),
            Positioned(
              bottom: 12,
              child: PrimaryButton(
                  width: dvWidth(context) - 24, text: S.of(context).save),
            )
          ]),
        ));
  }
}
