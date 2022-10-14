import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/primary_screen.dart';

class AddParcelScreen extends StatefulWidget {
  const AddParcelScreen({super.key});
  static const routeName = '/parcel/add';

  @override
  State<AddParcelScreen> createState() => _AddParcelScreenState();
}

class _AddParcelScreenState extends State<AddParcelScreen> {
  TextEditingController timeController = TextEditingController();
  var images = [
    {'id': '1', 'url': 'https://unsplash.it/100/100'},
    {'id': '2', 'url': 'https://unsplash.it/100/100'},
    {'id': '3', 'url': 'https://unsplash.it/100/100'},
    {'id': '4', 'url': 'https://unsplash.it/100/100'},
    {'id': '5', 'url': 'https://unsplash.it/100/100'},
  ];
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
            ? S.of(context).edit_parcel
            : S.of(context).add_parcel,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).post,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).parcel_name,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).building,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).floor,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).surface,
              isRequired: true,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).sender,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).phone_num,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).receiver,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).phone_num,
                    isRequired: true,
                  ),
                ),
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
              label: S.of(context).note,
            ),
            vpad(12),
            Text(S.of(context).images),
            vpad(12),
            Wrap(
              children: [
                ...images.map(
                  (e) => Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        child: Image.network(
                          e['url']!,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            images.removeWhere(
                              (i) => i['id'] == e['id'],
                            );
                            setState(() {});
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.close,
                              // color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            vpad(12),
            InkWell(
              onTap: () {},
              child: DottedBorder(
                radius: const Radius.circular(12),
                borderType: BorderType.RRect,
                strokeWidth: 2,
                color: primaryColorBase,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_box,
                        color: primaryColorBase,
                      ),
                      Text(
                        S.of(context).add_photo,
                        style: txtBodySmallRegular(color: primaryColorBase),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            vpad(70)
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
