import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';

class AddCustomerScreen extends StatefulWidget {
  AddCustomerScreen({super.key});
  static const routeName = '/customer/add';

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  var images = [
    {'id': '1', 'url': 'https://unsplash.it/100/100'},
    {'id': '2', 'url': 'https://unsplash.it/100/100'},
    {'id': '3', 'url': 'https://unsplash.it/100/100'},
    {'id': '4', 'url': 'https://unsplash.it/100/100'},
    {'id': '5', 'url': 'https://unsplash.it/100/100'},
  ];
  TextEditingController dobController = TextEditingController();

  TextEditingController issueDateController = TextEditingController();

  TextEditingController overDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).save,
        icon: Icons.save,
        primary: greenColor6,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).cancel,
        icon: Icons.close,
        primary: redColor2,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).add_customer,
      ),
      body: SafeArea(
        child: ListView(
          children: [
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
                    label: S.of(context).building,
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
                    label: S.of(context).surface,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).type,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).customer_name,
              isRequired: true,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).gender,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).dob,
                    isRequired: true,
                    controller: dobController,
                    onTap: () async {
                      var valueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

                      if (valueDate != null) {
                        dobController.text =
                            valueDate.toIso8601String().formatDateTimeDMY();
                      }
                    },
                    enable: false,
                    suffixIcon: const Icon(
                      Icons.calendar_month_rounded,
                    ),
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).phone_num,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).email,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).CCCD,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).nationality,
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
                    label: S.of(context).education_level,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).qualification,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).profession,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).work_place,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).martial_status,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).ethnic,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).pob,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryDropDown(label: S.of(context).poo),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryDropDown(
                    label: S.of(context).permanent_address,
                  ),
                ),
                hpad(35),
                Expanded(
                  child:
                      PrimaryDropDown(label: S.of(context).current_residence),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    controller: issueDateController,
                    suffixIcon: const Icon(Icons.calendar_month),
                    label: S.of(context).issue_date,
                    enable: false,
                    onTap: () async {
                      var valueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

                      if (valueDate != null) {
                        issueDateController.text =
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
              onTap: () {
                images.add({
                  "id": DateTime.now().toString(),
                  'url': 'https://unsplash.it/100/100'
                });
                setState(() {});
              },
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
            vpad(80)
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
