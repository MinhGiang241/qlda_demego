// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
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
import '../components/list_badges.dart';

class HistoryDeliveryTab extends StatelessWidget {
  const HistoryDeliveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    var badges = [
      {"text": S.of(context).comming, "color": grayScaleColor3, "number": 12},
      {"text": S.of(context).sum, "color": secondaryColor3, "number": 12},
      {"text": S.of(context).stock, "color": greenColor6, "number": 12},
      {"text": S.of(context).borrow, "color": yellowColor6, "number": 12},
      {"text": S.of(context).not_distribute, "color": redColor6, "number": 12},
      {"text": S.of(context).export, "color": redColor7, "number": 12},
      {"text": S.of(context).cancel, "color": redColor8, "number": 12},
      {
        "text": S.of(context).borrow_cus,
        "color": primaryColorBase,
        "number": 12
      },
    ];

    return Container(
        color: backgroundColor,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            vpad(12),
            ListBadges(
              badges: badges,
            ),
            vpad(12),
            ListBadges(
              badges: badges,
              assignee: "Hungng",
              dateAssign: DateTime.now(),
              amount: 4,
            ),
            vpad(12),
            ListBadges(
              badges: badges,
              assignee: "Hungng",
              dateAssign: DateTime.now(),
              amount: 4,
            ),
          ],
        )
        // ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [Text("âs")],
        // ),
        );
  }
}
