import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_text_field.dart';
import 'application_screen.dart';

class ChangeShiftLetter extends StatefulWidget {
  const ChangeShiftLetter({super.key});
  static const routeName = '/application/change-shift';

  @override
  State<ChangeShiftLetter> createState() => _ChangeShiftLetterState();
}

class _ChangeShiftLetterState extends State<ChangeShiftLetter> {
  TextEditingController fromDateController = new TextEditingController();
  TextEditingController toDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(
          title: S.of(context).cr_change_shift,
          leading: BackButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, ApplicationScreen.routeName))),
      body: Container(
        child: ListView(
          children: [
            vpad(16),
            PrimaryDropDown(
              label: S.of(context).reason_change_shift,
              isRequired: true,
            ),
            vpad(16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PrimaryTextField(
                    controller: fromDateController,
                    enable: false,
                    onTap: () async {
                      var value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                          lastDate: DateTime(DateTime.now().year + 10, 1, 1));

                      if (value != null) {
                        fromDateController.text =
                            value.toIso8601String().formatDateTimeDMY();
                      }
                    },
                    prefixIcon: const Icon(Icons.calendar_month),
                    isRequired: true,
                    label: S.of(context).date_change_fr,
                  ),
                ),
                hpad(26),
                Expanded(
                  flex: 1,
                  child: PrimaryDropDown(
                    isRequired: true,
                    label: S.of(context).shift,
                  ),
                )
              ],
            ),
            vpad(16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PrimaryTextField(
                    controller: toDateController,
                    onTap: () async {
                      var value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                          lastDate: DateTime(DateTime.now().year + 10, 1, 1));

                      if (value != null) {
                        toDateController.text =
                            value.toIso8601String().formatDateTimeDMY();
                      }
                    },
                    enable: false,
                    prefixIcon: const Icon(Icons.calendar_month),
                    isRequired: true,
                    label: S.of(context).date_change_to,
                  ),
                ),
                hpad(26),
                Expanded(
                  flex: 1,
                  child: PrimaryDropDown(
                    isRequired: true,
                    label: S.of(context).shift,
                  ),
                )
              ],
            ),
            vpad(16),
            PrimaryTextField(
              label: S.of(context).note,
              maxLines: 3,
              hint: S.of(context).enter_note,
            ),
            vpad(30),
            PrimaryButton(
              width: dvWidth(context),
              text: S.of(context).send,
            ),
          ],
        ),
      ),
    );
  }
}
