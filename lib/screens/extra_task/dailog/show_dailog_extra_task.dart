import 'package:flutter/material.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_dropdown.dart';

var showAddTaskDailog = (BuildContext context, Function(String)? addTask) {
  TextEditingController newTaskController = TextEditingController();
  Utils.showDialog(
    context: context,
    dailog: PrimaryDialog.custom(
      title: null,
      useBackground: true,
      content: Column(
        children: [
          Text(
            S.of(context).add_task,
            style: txtBodySmallBold(color: blueColor),
            textAlign: TextAlign.center,
          ),
          vpad(12),
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
