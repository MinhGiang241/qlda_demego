import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_button.dart';
import 'dailog/period_task_dailog.dart';

class EditTaskConfigScreen extends StatelessWidget {
  EditTaskConfigScreen({super.key, this.isEdit = false});
  bool isEdit;
  static const routeName = "/period-task/edit";
  TextEditingController freTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var arg;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      arg = ModalRoute.of(context)!.settings.arguments as Map;
    } else {
      arg = {"isEdit": false};
    }
    var floatButtons = [
      DialChildren(
        label: S.of(context).add_category,
        icon: Icons.add_box,
        primary: yellowColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).cancel,
        icon: Icons.cancel,
        primary: redColor2,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).save,
        icon: Icons.save,
        primary: greenColor6,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: (arg['isEdit'])
            ? S.of(context).edit_period_task
            : S.of(context).add_period_task,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            PrimaryTextField(
              label: S.of(context).task_name,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).status,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).description,
              hint: S.of(context).des_content,
            ),
            vpad(12),
            Text(
              S.of(context).fre_config,
              style: txtBodySmallBold(),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).res_department,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).assign_from,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).confirm_task,
              isRequired: true,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).zone_type,
                    isRequired: true,
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).zone,
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).asset_type,
                    isRequired: true,
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).fre,
                    isRequired: true,
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).fre_type,
                    isRequired: true,
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryTextField(
                    controller: freTimeController,
                    enable: false,
                    prefixIcon: const Icon(Icons.access_time_rounded),
                    label: S.of(context).start_time,
                    isRequired: true,
                    onTap: () async {
                      var value = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 0, minute: 0),
                      );
                      if (value != null) {
                        freTimeController.text =
                            '${value.hour.toString().padLeft(2, '0')} : ${value.minute.toString().padLeft(2, '0')}';
                      }
                    },
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).pre_cre_task,
                    isRequired: true,
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).time_done_after,
                    isRequired: true,
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).count_unit,
                    isRequired: true,
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).piority,
                    isRequired: true,
                  ),
                )
              ],
            ),
            vpad(12),
            Text(
              S.of(context).category,
              style: txtBodySmallBold(),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PrimaryTextField(
                    label: S.of(context).type,
                  ),
                ),
                hpad(12),
                Expanded(
                  flex: 2,
                  child: PrimaryTextField(
                    maxLines: 2,
                    label: S.of(context).content_test,
                    isRequired: true,
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(
                  text: S.of(context).edit,
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    addTestContent(context, () {});
                  },
                ),
                hpad(35),
                PrimaryButton(
                  text: S.of(context).delete,
                  buttonSize: ButtonSize.small,
                  buttonType: ButtonType.secondary,
                  secondaryBackgroundColor: redColor4,
                  textColor: redColor,
                  onTap: () {},
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PrimaryTextField(
                    label: S.of(context).type,
                  ),
                ),
                hpad(12),
                Expanded(
                  flex: 2,
                  child: PrimaryTextField(
                    label: S.of(context).content_test,
                    isRequired: true,
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).safe_value_from,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                  ),
                ),
                hpad(12),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).to,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                  ),
                )
              ],
            ),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(
                  text: S.of(context).edit,
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    addTestContent(context, () {});
                  },
                ),
                hpad(35),
                PrimaryButton(
                  text: S.of(context).delete,
                  buttonSize: ButtonSize.small,
                  buttonType: ButtonType.secondary,
                  secondaryBackgroundColor: redColor4,
                  textColor: redColor,
                  onTap: () {},
                ),
              ],
            ),
            vpad(80),
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
