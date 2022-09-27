import 'package:flutter/cupertino.dart';
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

class ConfirmLetterScreen extends StatelessWidget {
  const ConfirmLetterScreen({super.key});
  static const routeName = '/application/confirm';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return PrimaryScreen(
        appBar: PrimaryAppbar(
          title: arg['Loại đơn'] == "Đơn xin đổi ca"
              ? S.of(context).confirm_change_letter
              : S.of(context).confirm_letter,
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
