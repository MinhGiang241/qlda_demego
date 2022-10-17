import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/utils/dialog.dart';
import 'package:qlda_demego/utils/utils.dart';
import 'package:qlda_demego/widgets/primary_dialog.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/primary_button.dart';

var showAddServiceDialog = (BuildContext context, Function() onAddService) {
  TextEditingController activateDateController = TextEditingController();
  TextEditingController overDateController = TextEditingController();
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      content: Column(
        children: [
          Text(
            S.of(context).add_service,
            style: txtBodySmallRegular(color: primaryColorBase),
            textAlign: TextAlign.center,
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).service,
            isRequired: true,
          ),
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
              hpad(35),
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
          PrimaryTextField(
            label: S.of(context).quantity,
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).quotation,
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).price,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: S.of(context).edit,
                buttonSize: ButtonSize.medium,
                onTap: () {
                  onAddService();
                  Navigator.pop(context);
                },
              ),
              hpad(35),
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
