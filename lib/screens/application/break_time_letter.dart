import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_dropdown.dart';
import 'application_screen.dart';

class BreakTimeLetter extends StatefulWidget {
  const BreakTimeLetter({super.key});
  static const routeName = '/application/break-time-letter';

  @override
  State<BreakTimeLetter> createState() => _BreakTimeLetterState();
}

class _BreakTimeLetterState extends State<BreakTimeLetter> {
  String date = '';

  TextEditingController dateController = new TextEditingController();
  TextEditingController startTimeController = new TextEditingController();
  TextEditingController endTimeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
        appBar: PrimaryAppbar(
            title: S.of(context).cr_break,
            leading: BackButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, ApplicationScreen.routeName))),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                vpad(16),
                PrimaryDropDown(
                  label: S.of(context).reason_off,
                  isRequired: true,
                ),
                vpad(16),
                PrimaryTextField(
                    controller: dateController,
                    onTap: () async {
                      var value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                          lastDate: DateTime(DateTime.now().year + 10, 1, 1));

                      if (value != null) {
                        dateController.text =
                            value.toIso8601String().formatDateTimeDMY();
                      }
                    },
                    enable: false,
                    label: S.of(context).date,
                    isRequired: true,
                    prefixIcon: const Icon(Icons.calendar_month_rounded)),
                vpad(16),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: PrimaryTextField(
                        controller: startTimeController,
                        enable: false,
                        prefixIcon: const Icon(Icons.access_time_rounded),
                        label: S.of(context).start_time,
                        isRequired: true,
                        onTap: () async {
                          var value = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 0, minute: 0));
                          if (value != null) {
                            startTimeController.text =
                                '${value.hour.toString().padLeft(2, '0')} : ${value.minute.toString().padLeft(2, '0')}';
                          }
                        },
                      ),
                    ),
                    hpad(26),
                    Expanded(
                      flex: 1,
                      child: PrimaryTextField(
                        controller: endTimeController,
                        enable: false,
                        prefixIcon: const Icon(Icons.access_time_rounded),
                        label: S.of(context).start_time,
                        isRequired: true,
                        onTap: () async {
                          var value = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 0, minute: 0));
                          if (value != null) {
                            endTimeController.text =
                                '${value.hour.toString().padLeft(2, '0')} : ${value.minute.toString().padLeft(2, '0')}';
                          }
                        },
                      ),
                    ),
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
            )));
  }
}
