// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';

import '../../../widgets/primary_card.dart';

class DataAssetListTable extends StatelessWidget {
  DataAssetListTable({super.key, required this.data});
  var data;
  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            ...data[0]
                .entries
                .map((e) {
                  if (e.key == 'STT') {
                    return FlexColumnWidth(1);
                  }
                  return FlexColumnWidth(2);
                })
                .toList()
                .asMap()
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              children: [
                ...data[0].entries.map(
                      (e) => Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          e.key,
                          textAlign: TextAlign.center,
                          style: txtBodySmallBold(color: grayScaleColorBase),
                        ),
                      ),
                    )
              ],
            ),
            ...data
                .map(
                  (e) => TableRow(
                    children: [
                      ...e.keys
                          .map(
                            (j) => Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                border: j != 'STT'
                                    ? Border(
                                        left: BorderSide(
                                          color: grayScaleColor3,
                                          width: 1,
                                        ),
                                      )
                                    : null,
                              ),
                              child: Text(
                                e[j]!,
                                style: txtBodySmallBold(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
