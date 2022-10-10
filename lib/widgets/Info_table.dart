import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constant/constants.dart';
import 'primary_card.dart';

class InfoTable extends StatelessWidget {
  InfoTable({super.key, this.data, this.onTap, this.title});
  final data;
  void Function()? onTap;
  String? title;
  @override
  Widget build(BuildContext context) {
    var infoData = {};

    for (var entry in data.entries) {
      if ((entry.value.runtimeType == String ||
              entry.value.runtimeType == int ||
              entry.value.runtimeType == double) &&
          (entry.key != 'id' && entry.key != 'Loại')) {
        infoData.putIfAbsent(entry.key, () => entry.value.toString());
      }
    }

    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: shadowColor.withOpacity(0.1), width: 1),
            boxShadow: [
              BoxShadow(
                spreadRadius: 4,
                blurRadius: 8,
                color: shadowColor.withOpacity(0.1),
                offset: const Offset(0, 2),
              )
            ],
          ),
          // width: double.infinity,
          child: Column(children: [
            if (title != null) vpad(12),
            if (title != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: Text(
                  title!,
                  textAlign: TextAlign.start,
                  style: txtBodyMediumBold(),
                ),
              ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: infoData.keys.length,
              itemBuilder: (ctx, j) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(children: [
                  hpad(24),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${infoData.keys.elementAt(j).toString()} :',
                      style: txtBodySmallRegular(color: grayScaleColor2),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      infoData.values.elementAt(j).toString(),
                      style: txtBodySmallBold(color: grayScaleColorBase),
                    ),
                  ),
                  hpad(24),
                ]),
              ),
            ),
          ])),
    );
  }
}
