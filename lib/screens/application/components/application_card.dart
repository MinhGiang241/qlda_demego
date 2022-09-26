import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constant/constants.dart';
import '../../../widgets/primary_card.dart';

class ApllicationCard extends StatelessWidget {
  ApllicationCard({super.key, this.data, this.onTap});
  final data;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: shadowColor.withOpacity(0.1), width: 1),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 4,
                    color: shadowColor.withOpacity(0.1),
                    offset: const Offset(0, 2))
              ]),
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (ctx, j) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(children: [
                hpad(24),
                Expanded(
                    flex: 1,
                    child: Text('${data.keys.elementAt(j)} :',
                        style: txtBodySmallRegular(color: grayScaleColor2))),
                Expanded(
                    flex: 1,
                    child: Text(data.values.elementAt(j),
                        style: txtBodySmallRegular(color: grayScaleColorBase))),
                hpad(24),
              ]),
            ),
          )),
    );
  }
}
