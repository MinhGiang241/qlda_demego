import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';
import 'application_screen.dart';

class AbsentLetter extends StatelessWidget {
  const AbsentLetter({super.key});
  static const routeName = '/application/absent-letter';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PrimaryScreen(
          appBar: PrimaryAppbar(
            title: S.of(context).cr_absent,
            leading: BackButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, ApplicationScreen.routeName)),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ListView(
              children: [
                // ignore: prefer_const_constructors
                vpad(16),
                PrimaryDropDown(
                  label: S.of(context).choose_off,
                  isRequired: true,
                ),
                vpad(16),
                Row(children: [
                  Text(S.of(context).time_off,
                      style: txtBodySmallRegular(color: grayScaleColorBase)),
                  hpad(4),
                  Text("*", style: txtBodySmallRegular(color: redColorBase))
                ]),
                vpad(16),

                Container(
                  height: dvHeight(context) * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: SfDateRangePicker(
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.range,
                  ),
                ),

                vpad(16),
                PrimaryTextField(
                  label: S.of(context).note,
                  maxLines: 3,
                  hint: S.of(context).enter_note,
                ),
                vpad(80),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 11,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PrimaryButton(
              width: dvWidth(context) - 24,
              text: S.of(context).send,
            ),
          ),
        ),
      ],
    );
  }
}
