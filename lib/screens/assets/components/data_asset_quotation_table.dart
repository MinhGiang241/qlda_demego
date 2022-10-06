import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_card.dart';

class DataAssetQuotationTable extends StatelessWidget {
  DataAssetQuotationTable({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    var titles = [
      'STT',
      'Tên nhà cung cấp',
      'Mã tài sản',
      'Số lượng',
      'Đơn giá',
      'Thành tiền'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...data.asMap().entries.map(
                (e) => Column(
                  children: [
                    PrimaryCard(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            ...titles.asMap().entries.map(
                                  (t) => Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      border: t.value != 'STT'
                                          ? const Border(
                                              left: BorderSide(
                                                color: grayScaleColor3,
                                                width: 1,
                                              ),
                                            )
                                          : null,
                                    ),
                                    width: t.value == "STT" ? 40 : 120,
                                    child: Column(
                                      children: [
                                        if (e.key == 0)
                                          Text(
                                            t.value.toString(),
                                            textAlign: TextAlign.center,
                                            style: txtBodySmallBold(
                                              color: grayScaleColorBase,
                                            ),
                                          ),
                                        if (e.key == 0) vpad(18),
                                        Row(
                                          mainAxisAlignment: t.value ==
                                                  "Tên nhà cung cấp"
                                              ? MainAxisAlignment.spaceAround
                                              : MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (e.value[t.key].runtimeType ==
                                                          List ||
                                                      e.value[t.value] == null)
                                                  ? ""
                                                  : e.value[t.value].toString(),
                                              textAlign: TextAlign.center,
                                              style: txtBodySmallBold(),
                                            ),
                                            if (t.value == "Tên nhà cung cấp")
                                              Icon(
                                                  size: 20,
                                                  Icons.arrow_drop_down)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                          ],
                        ),
                        Row(),
                      ],
                    )),
                    vpad(6),
                  ],
                ),
              )
        ],
      ),
    );
  }
}
