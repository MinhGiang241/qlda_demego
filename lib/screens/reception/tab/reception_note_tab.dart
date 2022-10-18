import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/dialog.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/primary_button.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';

class ReceptionNoteTab extends StatefulWidget {
  const ReceptionNoteTab({super.key, this.data});
  final data;

  @override
  State<ReceptionNoteTab> createState() => _ReceptionNoteTabState();
}

class _ReceptionNoteTabState extends State<ReceptionNoteTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        vpad(12),
        Text(
          S.of(context).note_list,
          textAlign: TextAlign.center,
          style: txtBodySmallRegular(color: primaryColorBase),
        ),
        vpad(12),
        ...widget.data.asMap().entries.map(
              (e) => InfoTable(
                data: widget.data[e.key],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      onTap: () {
                        onConfirmDelete(
                          context,
                          S.of(context).confirm_detele_config,
                          () {
                            setState(() {
                              widget.data.removeAt(e.key);
                            });
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      text: S.of(context).delete,
                      buttonType: ButtonType.secondary,
                      buttonSize: ButtonSize.small,
                      textColor: redColor,
                      secondaryBackgroundColor: redColor4,
                    ),
                    hpad(20)
                  ],
                ),
              ),
            ),
        vpad(70),
      ],
    );
  }
}
