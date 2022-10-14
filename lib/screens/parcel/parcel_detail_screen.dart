import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/primary_screen.dart';
import 'add_parcel_screen.dart';
import 'dailog/parcel_dailog.dart';

var data = {
  "Thông tin gửi": {
    "Người gửi": "Nguyễn Văn A",
    "Địa chỉ": "A2 - 2002",
    "Số Điện Thoại": "0987654321",
    "Thời gian gửi": "01/01/2022 - 14:00",
    "Ghi chú": "Nội dung",
  },
  "Thông tin giao": {
    "Người nhận": "Nguyễn Văn A",
    "Địa chỉ": "A2 - 2002",
    "Số Điện Thoại": "0123456789",
  },
  "Hình ảnh": [
    "https://unsplash.it/100/100",
    "https://unsplash.it/100/100",
    "https://unsplash.it/100/100",
    "https://unsplash.it/100/100",
    "https://unsplash.it/100/100",
  ]
};

class ParcelDetailScreen extends StatelessWidget {
  const ParcelDetailScreen({super.key});
  static const routeName = '/parcel/details';

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).transfer,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {
          onEditParcel(context, () {});
        },
      ),
      DialChildren(
        label: S.of(context).edit,
        icon: Icons.edit_note,
        primary: yellowColor,
        onPress: () {
          Navigator.of(context).pushNamed(
            AddParcelScreen.routeName,
            arguments: {'isEdit': true},
          );
        },
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).parcel_detail),
      body: ListView(
        children: [
          vpad(12),
          PrimaryCard(
            child: IntrinsicWidth(
              child: Column(
                children: [
                  vpad(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      hpad(12),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${S.of(context).parcel_name} :',
                          style: txtBodySmallRegular(color: grayScaleColorBase),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Giấy',
                          style: txtBodySmallBold(),
                        ),
                      ),
                    ],
                  ),
                  vpad(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      hpad(12),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${S.of(context).status} :',
                          style: txtBodySmallRegular(color: grayScaleColorBase),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Hoàn thành',
                          style: txtBodySmallBold(),
                        ),
                      ),
                    ],
                  ),
                  vpad(12),
                ],
              ),
            ),
          ),
          vpad(12),
          InfoTable(
            titleWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Thông tin gửi',
                style: txtBodySmallRegular(color: primaryColorBase),
              ),
            ),
            data: data['Thông tin gửi'],
            child: Row(
              children: [
                hpad(24),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hình ảnh :',
                      textAlign: TextAlign.start,
                      style: txtBodySmallRegular(color: grayScaleColorBase),
                    ),
                    vpad(12),
                    SizedBox(
                      height: 100,
                      width: dvWidth(context) - 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...(data['Hình ảnh'] as List).map(
                            (e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Image.network(
                                e,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          vpad(12),
          InfoTable(
            titleWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Thông tin giao',
                style: txtBodySmallRegular(color: primaryColorBase),
              ),
            ),
            data: data['Thông tin giao'],
            child: Row(
              children: [
                hpad(24),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hình ảnh :',
                      textAlign: TextAlign.start,
                      style: txtBodySmallRegular(color: grayScaleColorBase),
                    ),
                    vpad(12),
                    SizedBox(
                      height: 100,
                      width: dvWidth(context) - 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...(data['Hình ảnh'] as List).map(
                            (e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Image.network(
                                e,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          vpad(70)
        ],
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
