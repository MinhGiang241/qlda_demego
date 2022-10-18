import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';

import '../../../generated/l10n.dart';
import '../../../utils/dialog.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';

var showExtendTransportationDialog = (BuildContext context, Function() onSave) {
  TextEditingController activateDateController = TextEditingController();
  TextEditingController overDateController = TextEditingController();
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      content: Column(
        children: [
          Text(
            S.of(context).extend,
            style: txtBodySmallRegular(color: primaryColorBase),
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).type,
                  isRequired: true,
                ),
              ),
              hpad(14),
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).license,
                  isRequired: true,
                ),
              )
            ],
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(label: S.of(context).quantity_month),
              ),
              hpad(14),
              Expanded(
                child: PrimaryTextField(label: S.of(context).price),
              )
            ],
          ),
          vpad(12),
          PrimaryTextField(label: S.of(context).price),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  // initialValue: arg['Ngày kích hoạt'],
                  controller: activateDateController,
                  suffixIcon: const Icon(Icons.calendar_month),
                  label: S.of(context).activate_date,
                  enable: false,
                  onTap: () async {
                    var valueDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                      lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                    );

                    if (valueDate != null) {
                      activateDateController.text =
                          valueDate.toIso8601String().formatDateTimeDMY();
                    }
                  },
                ),
              ),
              hpad(14),
              Expanded(
                child: PrimaryTextField(
                  // initialValue: arg['Ngày hết hạn'],
                  controller: overDateController,
                  suffixIcon: const Icon(Icons.calendar_month),
                  label: S.of(context).over_date,
                  enable: false,
                  onTap: () async {
                    var valueDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                      lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                    );

                    if (valueDate != null) {
                      overDateController.text =
                          valueDate.toIso8601String().formatDateTimeDMY();
                    }
                  },
                ),
              ),
            ],
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: S.of(context).save,
                buttonSize: ButtonSize.medium,
                onTap: () {
                  onSave();
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
                  // Navigator.pop(context);
                  onConfirmDelete(
                    context,
                    S.of(context).confirm_detele_config,
                    () {},
                  );
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
};
