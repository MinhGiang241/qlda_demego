import 'package:flutter/cupertino.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';

var onEditParcel = (BuildContext context, Function() onSave) {
  Utils.showDialog(
    context: context,
    dailog: PrimaryDialog.custom(
      content: Column(
        children: [
          Text(
            S.of(context).transfer_parcel,
            style: txtBodySmallRegular(color: primaryColorBase),
          ),
          vpad(12),
          PrimaryTextField(
            isRequired: true,
            label: S.of(context).address,
          ),
          vpad(12),
          PrimaryTextField(
            isRequired: true,
            label: S.of(context).receiver,
          ),
          vpad(12),
          PrimaryTextField(
            isRequired: true,
            label: S.of(context).phone_num,
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
                },
              ),
              hpad(35),
              PrimaryButton(
                text: S.of(context).cancel,
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
