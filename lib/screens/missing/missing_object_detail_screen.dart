import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_card.dart';

class MissingObjectDetailScreen extends StatelessWidget {
  const MissingObjectDetailScreen({super.key});
  static const routeName = '/missing-object/detail';

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).complete,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).edit,
        icon: Icons.edit_note,
        primary: yellowColorBase,
        onPress: () {},
      ),
    ];

    var data = {
      "Người báo cáo": {
        "Người báo cáo": "Nguyễn Văn A",
        "Địa điểm": "Sảnh nhà A",
        "Thời gian": "01/01/2022 - 12:00",
        "Ghi chú": "Nội dung",
      },
      "Người nhận": {
        "Người nhận": "Nguyễn Văn B",
        "Số CCCD/CMTND/Hộ chiếu": "A2 - 2002",
        "Địa chỉ": "01/01/2022 - 12:00",
        "Số điện thoại": "0123456789",
        "Thời gian": "01/01/2022 - 12:00",
        "Ghi chú": "Nội dung",
      },
      "Hình ảnh": ["https://unsplash.it/640/425"]
    };

    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).missing_obj_detail),
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
                          '${S.of(context).missing_obj_name} :',
                          style: txtBodySmallRegular(color: grayScaleColorBase),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Thẻ xe',
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
                'Người báo cáo',
                style: txtBodySmallRegular(color: primaryColorBase),
              ),
            ),
            data: data['Người báo cáo'],
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
                'Hoàn trả',
                style: txtBodySmallRegular(color: primaryColorBase),
              ),
            ),
            data: data['Người nhận'],
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
