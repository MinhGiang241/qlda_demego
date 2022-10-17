import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';

class AddTransportationCardScreen extends StatefulWidget {
  const AddTransportationCardScreen({super.key});
  static const routeName = '/transportation/add';

  @override
  State<AddTransportationCardScreen> createState() =>
      _AddTransportationCardScreenState();
}

class _AddTransportationCardScreenState
    extends State<AddTransportationCardScreen> {
  var images = [
    {'id': '1', 'url': 'https://unsplash.it/100/100'},
    {'id': '2', 'url': 'https://unsplash.it/100/100'},
    {'id': '3', 'url': 'https://unsplash.it/100/100'},
    {'id': '4', 'url': 'https://unsplash.it/100/100'},
    {'id': '5', 'url': 'https://unsplash.it/100/100'},
  ];
  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).activate,
        icon: Icons.send,
        primary: greenColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).wait,
        icon: Icons.access_time_rounded,
        primary: yellowColorBase,
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
      appBar: PrimaryAppbar(title: S.of(context).add_trans_card),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            Text(
              S.of(context).trans_owner_info,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).card_owner,
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).phone_num,
              isRequired: true,
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
            PrimaryDropDown(
              label: S.of(context).surface,
              isRequired: true,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).card_num,
              isRequired: true,
            ),
            vpad(12),
            Text(
              S.of(context).trans_info,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).type,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).variety,
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
                    label: S.of(context).license,
                    isRequired: true,
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    label: S.of(context).color,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).register_num,
              isRequired: true,
              keyboardType: TextInputType.number,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).note,
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
