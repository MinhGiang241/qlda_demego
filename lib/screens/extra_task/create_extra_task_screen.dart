import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import 'dialog/show_dialog_extra_task.dart';

class CreateExtraTaskScreen extends StatefulWidget {
  const CreateExtraTaskScreen({super.key});
  static const routeName = '/extra-task/create';

  @override
  State<CreateExtraTaskScreen> createState() => _CreateExtraTaskScreenState();
}

class _CreateExtraTaskScreenState extends State<CreateExtraTaskScreen> {
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  var data = [
    'Đầu việc 1',
    'Đầu việc 2',
    'Đầu việc 3',
    'Đầu việc 4',
    'Đầu việc 5',
  ];
  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).cr_ext_task),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            vpad(12),
            PrimaryTextField(
              label: S.of(context).task_name,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).assign_from,
              isRequired: true,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).department_group,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).chot,
                  ),
                )
              ],
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).assign_to,
              isRequired: true,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).start,
                    controller: startTimeController,
                    onTap: () async {
                      var valueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

                      var valueTime = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 0, minute: 0));

                      if (valueDate != null && valueTime != null) {
                        startTimeController.text =
                            "${valueDate.toIso8601String().formatDateTimeDMY()} - ${valueTime.hour.toString().padLeft(2, '0')} : ${valueTime.minute.toString().padLeft(2, '0')}";
                      }
                    },
                    isRequired: true,
                    enable: false,
                    // suffixIcon: const Icon(Icons.calendar_month_rounded),
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).end,
                    controller: endTimeController,
                    onTap: () async {
                      var valueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

                      var valueTime = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 0, minute: 0),
                      );

                      if (valueDate != null && valueTime != null) {
                        endTimeController.text =
                            "${valueDate.toIso8601String().formatDateTimeDMY()} - ${valueTime.hour.toString().padLeft(2, '0')} : ${valueTime.minute.toString().padLeft(2, '0')}";
                      }
                    },
                    isRequired: true,
                    enable: false,
                    // suffixIcon: const Icon(Icons.calendar_month_rounded),
                  ),
                )
              ],
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).supervisor,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).confirm_task,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).piority,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              isMultiple: true,
              label: S.of(context).member,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).description,
              maxLines: 3,
            ),
            vpad(12),
            Text(S.of(context).task),
            vpad(12),
            ...data.map(
              (e) => PrimaryCard(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(
                    e,
                    style: txtBodySmallRegular(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      data.removeWhere((element) => element == e);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: redColor,
                    ),
                  ),
                ),
              ),
            ),
            vpad(12),
            InkWell(
              onTap: () {
                showAddTaskdialog(context, (String v) {
                  data.add(v);
                  setState(() {});
                });
              },
              child: DottedBorder(
                strokeWidth: 2,
                borderType: BorderType.RRect,
                color: primaryColorBase,
                radius: const Radius.circular(12),
                child: PrimaryCard(
                  // decoration: BoxDecoration(border: Border.none),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_box,
                        color: primaryColorBase,
                      ),
                      Text(
                        S.of(context).add_task,
                        style: txtBodyMediumBold(color: primaryColorBase),
                      )
                    ],
                  ),
                ),
              ),
            ),
            vpad(12),
            PrimaryButton(
              text: S.of(context).save,
            ),
            vpad(30),
          ],
        ),
      ),
    );
  }
}
