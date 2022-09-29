// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_icon.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/primary_card.dart';
import '../../application/components/code_status_letter.dart';

class HistoryDeliveryTab extends StatelessWidget {
  const HistoryDeliveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    var badges = [
      {"text": S.of(context).comming, "color": yellowColor, "number": 12},
      {"text": S.of(context).sum, "color": yellowColor, "number": 12},
      {"text": S.of(context).stock, "color": yellowColor, "number": 12},
      {"text": S.of(context).borrow, "color": yellowColor, "number": 12},
      {
        "text": S.of(context).not_distribute,
        "color": yellowColor,
        "number": 12
      },
      {"text": S.of(context).export, "color": yellowColor, "number": 12},
      {"text": S.of(context).cancel, "color": yellowColor, "number": 12},
      {"text": S.of(context).borrow_cus, "color": yellowColor, "number": 12},
    ];
    return Container(
        color: backgroundColor,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            vpad(12),
            PrimaryCard(
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(children: [
                          ...badges.map((e) => Row(children: [
                                hpad(6),
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //
                                      Flexible(
                                          child: RichText(
                                        text: TextSpan(
                                            text: e['text'] as String,
                                            style: txtBodySmallRegular(
                                                color: grayScaleColorBase)),
                                      )),
                                      vpad(12),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            color: e['color'] as Color),
                                        height: 26,
                                        width: 60,
                                        child: Text(
                                          e['number'].toString(),
                                          textAlign: TextAlign.center,
                                          style: txtBodyMediumBold(
                                              color: Colors.white),
                                        ),
                                      )
                                    ]),
                              ])),
                        ]),
                      )
                    ],
                  ),
                ))
          ],
        )
        // ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [Text("âs")],
        // ),
        );
  }
}
