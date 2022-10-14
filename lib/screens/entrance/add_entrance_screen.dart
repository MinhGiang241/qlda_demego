import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';

class AddEntranceScreen extends StatelessWidget {
  AddEntranceScreen({super.key});
  static const routeName = '/entrance/add';
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var arg;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      arg = ModalRoute.of(context)!.settings.arguments as Map;
    } else {
      arg = {"isEdit": false};
    }
    var floatButtons = [
      DialChildren(
        label: S.of(context).save,
        icon: Icons.save,
        primary: greenColor6,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).cancel,
        icon: Icons.edit_note,
        primary: redColor2,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: arg['isEdit']
            ? S.of(context).edit_entrance
            : S.of(context).cr_entrance,
      ),
      body: ListView(
        children: [
          vpad(12),
          PrimaryTextField(
            label: S.of(context).name,
            isRequired: true,
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).phone_num,
                  isRequired: true,
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).cccd_passport,
                  isRequired: true,
                ),
              )
            ],
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).building,
                  isRequired: true,
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).visit_card_num,
                  isRequired: true,
                ),
              )
            ],
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).time_send,
            controller: timeController,
            onTap: () async {
              var valueDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                lastDate: DateTime(DateTime.now().year + 10, 1, 1),
              );

              var valueTime = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 0, minute: 0),
              );

              if (valueDate != null && valueTime != null) {
                timeController.text =
                    "${valueDate.toIso8601String().formatDateTimeDMY()} - ${valueTime.hour.toString().padLeft(2, '0')} : ${valueTime.minute.toString().padLeft(2, '0')}";
              }
            },
            isRequired: true,
            enable: false,
            suffixIcon: const Icon(
              Icons.calendar_month_rounded,
            ), //access_time_rounded
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).reason,
            isRequired: true,
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).note,
          ),
          vpad(12),
          Text(
            S.of(context).confirm,
            textAlign: TextAlign.center,
            style: txtBodySmallRegular(color: primaryColorBase),
          ),
          vpad(12),
          PrimaryTextField(
            background: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
            label: S.of(context).confirm_person,
            enable: false,
            textAlign: TextAlign.center,
            initialValue: "Phan Văn C",
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  background: Colors.black.withOpacity(0.5),
                  textColor: Colors.white,
                  enable: false,
                  textAlign: TextAlign.center,
                  initialValue: "Lễ tân",
                  label: S.of(context).building,
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryTextField(
                  background: Colors.black.withOpacity(0.5),
                  textColor: Colors.white,
                  enable: false,
                  textAlign: TextAlign.center,
                  initialValue: "Trưởng Lễ tân",
                  label: S.of(context).job_title,
                ),
              )
            ],
          ),
          vpad(80),
        ],
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
