import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';

import '../../../constant/constants.dart';

class DetailReceptionTabAll extends StatelessWidget {
  const DetailReceptionTabAll({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      children: [
        vpad(12),
        InfoTable(
          data: data,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  "Hình ảnh",
                  textAlign: TextAlign.start,
                  style: txtBodySmallRegular(color: grayScaleColorBase),
                ),
              ),
              vpad(12),
              SizedBox(
                height: 100,
                width: dvWidth(context) - 60,
                child: ListView(
                  // physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    vpad(12),
                    ...(data['Hình ảnh'] as List).map(
                      (e) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.network(
                          e,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
