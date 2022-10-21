import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/screens/resident_card/service_detail_screen.dart';
import 'package:qlda_demego/widgets/float_button.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/primary_screen.dart';
import 'add_service_for_resident_screen.dart';
import 'extend_service_screen.dart';

class ResidentCarDetailsScreen extends StatelessWidget {
  const ResidentCarDetailsScreen({super.key});
  static const routeName = '/resident-card/detail';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
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
      appBar: (PrimaryAppbar(
        title: S.of(context).res_car_detail,
      )),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            Text(
              S.of(context).card_info,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).card_owner,
              initialValue: arg['Chủ thẻ'],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).resister,
              initialValue: arg['Chủ thẻ'],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).phone_num,
              keyboardType: TextInputType.number,
              initialValue: arg['Số điện thoại'],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).surface,
              initialValue: arg['Mặt bằng'],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).status,
              initialValue: arg['Tình trạng'],
            ),
            vpad(12),
            Text(
              S.of(context).service,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            ...arg['Dịch vụ'].map(
              (e) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ServiceDetailScreen.routeName,
                    arguments: e,
                  );
                },
                child: PrimaryCard(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dịch vụ :",
                              style: txtBodySmallRegular(
                                  color: grayScaleColorBase),
                              textAlign: TextAlign.left,
                            ),
                            vpad(12),
                            Text(
                              "Trạng thái :",
                              style: txtBodySmallRegular(
                                  color: grayScaleColorBase),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['Dịch vụ']),
                            vpad(12),
                            Text(
                              e['Trạng thái'],
                              style: txtBodySmallRegular(
                                color: e['Trạng thái'] == "Không hoạt động"
                                    ? redColor
                                    : secondaryColorBase,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: PrimaryButton(
                          text: S.of(context).extend,
                          buttonSize: ButtonSize.small,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ExtendServiceScreen.routeName,
                              arguments: arg,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: S.of(context).add_service,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AddServiceForResidentScreen.routeName,
                      arguments: arg,
                    );
                  },
                ),
              ],
            ),
            vpad(70),
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
