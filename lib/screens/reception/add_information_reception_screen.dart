import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_dropdown.dart';
import '../../widgets/primary_screen.dart';

class AddInformationReceptionScreen extends StatefulWidget {
  AddInformationReceptionScreen({super.key});
  static const routeName = '/reception/add';

  @override
  State<AddInformationReceptionScreen> createState() =>
      _AddInformationReceptionScreenState();
}

class _AddInformationReceptionScreenState
    extends State<AddInformationReceptionScreen> {
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
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).cr_info_recept),
      body: ListView(
        children: [
          vpad(12),
          PrimaryTextField(
            label: S.of(context).reporter,
            isRequired: true,
          ),
          vpad(12),
          Text(
            S.of(context).info_reception,
            style: txtBodySmallRegular(color: primaryColorBase),
          ),
          vpad(12),
          PrimaryTextField(
            label: S.of(context).title,
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
                child: PrimaryTextField(
                  label: S.of(context).sender_name,
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
                  label: S.of(context).info_type,
                  isRequired: true,
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryTextField(
                  label: S.of(context).time_recept,
                  isRequired: true,
                  controller: timeController,
                  suffixIcon: const Icon(Icons.calendar_month),
                  enable: false,
                  onTap: () async {
                    var valueDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                      lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                    );

                    if (valueDate != null) {
                      timeController.text =
                          valueDate.toIso8601String().formatDateTimeDMY();
                    }
                  },
                ),
              ),
            ],
          ),
          vpad(12),
          Row(
            children: [
              Expanded(
                child: PrimaryDropDown(
                  label: S.of(context).res_department,
                  isRequired: true,
                ),
              ),
              hpad(35),
              Expanded(
                child: PrimaryDropDown(
                  label: S.of(context).res_person,
                  isRequired: true,
                ),
              ),
            ],
          ),
          vpad(12),
          PrimaryDropDown(
            label: S.of(context).related_department,
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
          vpad(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: S.of(context).save,
                buttonSize: ButtonSize.large,
                width: 135,
              ),
              hpad(18),
              PrimaryButton(
                text: S.of(context).cancel,
                buttonSize: ButtonSize.large,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor4,
                textColor: redColor,
                width: 135,
              ),
            ],
          ),
          vpad(20),
        ],
      ),
    );
  }
}
