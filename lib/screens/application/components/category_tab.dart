import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import 'application_card.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        vpad(12),
        PrimaryCard(
            padding: const EdgeInsets.fromLTRB(24, 16, 0, 16),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: primaryColorBase,
                  child: Icon(
                    size: 30,
                    Icons.description,
                    color: Colors.white,
                  ),
                ),
                hpad(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicWidth(
                      child: Row(
                        children: [
                          SizedBox(
                              width: 80,
                              child: Text(
                                textAlign: TextAlign.start,
                                "Mã đơn từ :",
                                style: txtBodySmallRegular(
                                    color: grayScaleColorBase),
                              )),
                          Expanded(
                              child: Text(
                            "0001",
                            style: txtBodySmallBold(color: grayScaleColorBase),
                          )),
                        ],
                      ),
                    ),
                    vpad(16),
                    IntrinsicWidth(
                      child: Row(
                        children: [
                          SizedBox(
                              width: 80,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                "Trạng thái :",
                                style: txtBodySmallRegular(
                                    color: grayScaleColorBase),
                              )),
                          Expanded(
                              child: Text(
                            overflow: TextOverflow.ellipsis,
                            data["Trạng thái"] as String,
                            style: txtBodySmallBold(color: grayScaleColorBase),
                          )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
        vpad(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ApllicationCard(
            data: data,
          ),
        )
      ],
    );
  }
}
