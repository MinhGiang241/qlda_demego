import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_card.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_dropdown.dart';

var showAddTaskdialog = (BuildContext context, Function(String)? addTask) {
  TextEditingController newTaskController = TextEditingController();
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: S.of(context).add_task,
      useBackground: true,
      content: Column(
        children: [
          PrimaryTextField(
            controller: newTaskController,
            label: S.of(context).task,
            isRequired: true,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  if (addTask != null && newTaskController.text != '') {
                    addTask(newTaskController.text.trim());
                  }
                  Navigator.of(context).pop();
                },
                text: S.of(context).add,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};

var adjustTask = (BuildContext context, Function()? addTask) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: S.of(context).adjust_task,
      content: Column(
        children: [
          PrimaryTextField(
            label: S.of(context).reason,
            maxLines: 5,
            isRequired: true,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).confirm,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};

var changeDeathline = (
  BuildContext context,
  TextEditingController deathlineChangecontroller,
  Function()? changeDeathline,
) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: S.of(context).change_deathline,
      content: Column(
        children: [
          PrimaryTextField(
            controller: deathlineChangecontroller,
            label: S.of(context).deathline_change,
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
                deathlineChangecontroller.text =
                    "${valueDate.toIso8601String().formatDateTimeDMY()} - ${valueTime.hour.toString().padLeft(2, '0')} : ${valueTime.minute.toString().padLeft(2, '0')}";
              }
            },
            enable: false,
            suffixIcon: const Icon(Icons.calendar_month_rounded),
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).reason,
            maxLines: 2,
            isRequired: true,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).demand,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};

var refuseTask = (BuildContext context, Function()? refuseTask) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: S.of(context).refuse_task,
      content: Column(
        children: [
          PrimaryTextField(
            label: S.of(context).reason,
            maxLines: 5,
            isRequired: true,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).confirm,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};

var addAttachedFile = (BuildContext context, Function()? addFile) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: S.of(context).add_attached_file,
      content: Column(
        children: [
          PrimaryTextField(
            label: S.of(context).choose_file,
            isRequired: true,
            enable: false,
          ),
          vpad(12),
          InkWell(
            onTap: () {},
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
                      Icons.add,
                      color: primaryColorBase,
                    ),
                    Text(
                      S.of(context).add_attached_file,
                      style: txtBodyMediumBold(color: primaryColorBase),
                    )
                  ],
                ),
              ),
            ),
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).add,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};

var showAddEmployeedialog =
    (BuildContext context, Function(String)? addEmployee) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: S.of(context).add_employee,
      useBackground: true,
      content: Column(
        children: [
          PrimaryDropDown(
            label: S.of(context).tech_employee,
            isRequired: true,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).add,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};
