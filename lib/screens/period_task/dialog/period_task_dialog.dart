import 'package:flutter/cupertino.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_dropdown.dart';

var addTestContent = (BuildContext context, Function() addContext) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: '${S.current.add} ${S.current.period_task_list.toLowerCase()}',
      content: Column(
        children: [
          PrimaryDropDown(
            label: S.current.type,
            isRequired: true,
          ),
          vpad(12),
          PrimaryTextField(
            maxLines: 2,
            label: S.current.content_test,
            isRequired: true,
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
              hpad(14),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: S.of(context).edit,
                buttonSize: ButtonSize.medium,
                onTap: () {
                  addContext();
                  Navigator.pop(context);
                },
              ),
              hpad(14),
              PrimaryButton(
                text: S.of(context).delete,
                buttonSize: ButtonSize.medium,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor4,
                textColor: redColor,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
};
