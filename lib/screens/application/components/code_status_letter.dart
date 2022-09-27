import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constant/constants.dart';
import '../../../widgets/primary_card.dart';

class CodeStatusLetter extends StatelessWidget {
  const CodeStatusLetter({super.key, this.code = '', this.status = ''});

  final String? code;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
        margin: const EdgeInsets.symmetric(horizontal: 12),
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
                            style:
                                txtBodySmallRegular(color: grayScaleColorBase),
                          )),
                      Expanded(
                          child: Text(
                        code!,
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
                            style:
                                txtBodySmallRegular(color: grayScaleColorBase),
                          )),
                      Expanded(
                          child: Text(
                        overflow: TextOverflow.ellipsis,
                        status as String,
                        style: txtBodySmallBold(color: grayScaleColorBase),
                      )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
