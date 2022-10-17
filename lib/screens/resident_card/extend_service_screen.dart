import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_screen.dart';

class ExtendServiceScreen extends StatelessWidget {
  ExtendServiceScreen({super.key});
  static const routeName = '/resident-card/extend';

  TextEditingController activateDateController = TextEditingController();
  TextEditingController overDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    activateDateController.text = arg['Ngày kích hoạt'];
    overDateController.text = arg['Ngày hết hạn'];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).extend_service,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            PrimaryTextField(
              initialValue: arg['Dịch vụ'],
              label: S.of(context).service,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
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
            vpad(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: S.of(context).save,
                  buttonSize: ButtonSize.medium,
                  onTap: () {},
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
  }
}
