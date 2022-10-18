import 'package:flutter/widgets.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_dialog.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';

var showAddNoteDialog = (BuildContext context, Function(String) addNote) {
  TextEditingController noteController = TextEditingController();
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      content: Column(
        children: [
          Text(
            S.of(context).add_note,
            textAlign: TextAlign.center,
            style: txtBodySmallRegular(color: primaryColorBase),
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).note_content,
            hint: S.of(context).enter_note,
            maxLines: 3,
            controller: noteController,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: S.of(context).confirm,
                buttonSize: ButtonSize.medium,
                width: 136,
                onTap: () {
                  addNote(noteController.text.trim());
                  Navigator.of(context).pop();
                },
              ),
              hpad(12),
              PrimaryButton(
                width: 120,
                text: S.of(context).cancel,
                buttonSize: ButtonSize.medium,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor4,
                textColor: redColor,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    ),
  );
};
