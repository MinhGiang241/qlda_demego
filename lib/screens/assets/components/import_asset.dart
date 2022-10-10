import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_button.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/Info_table.dart';

class ImportAsset extends StatefulWidget {
  ImportAsset({super.key, this.data, this.onDelete});
  Function()? onDelete;
  final data;

  @override
  State<ImportAsset> createState() => _ImportAssetState();
}

class _ImportAssetState extends State<ImportAsset> {
  var check = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          // scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          children: [
            Container(
              child: Checkbox(
                activeColor: secondaryColorBase,
                onChanged: (v) {
                  setState(() {
                    check = !check;
                  });
                },
                value: check,
              ),
            ),
            Expanded(child: InfoTable(data: widget.data))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PrimaryButton(
              text: S.of(context).update,
              buttonSize: ButtonSize.small,
            ),
            hpad(35),
            PrimaryButton(
              text: S.of(context).delete,
              buttonSize: ButtonSize.small,
              buttonType: ButtonType.secondary,
              secondaryBackgroundColor: redColor7,
              textColor: redColor,
              onTap: widget.onDelete,
            ),
          ],
        ),
        vpad(12)
      ],
    );
  }
}
