import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import 'application_card.dart';
import 'code_status_letter.dart';

class HistoryApproveTab extends StatelessWidget {
  const HistoryApproveTab({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      // padding: EdgeInsets.zero,
      children: [
        vpad(12),
        CodeStatusLetter(
          code: '0001',
          status: data['Trạng thái'],
        ),
        vpad(16),
        data['Lịch sử phê duyệt'] != null
            ? Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: data['Lịch sử phê duyệt'].length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ApllicationCard(
                            data: data['Lịch sử phê duyệt'][index],
                          ),
                        ))),
              )
            : Expanded(
                child: Center(
                child: Text(
                  "Chưa có lịch sử duyệt!",
                  style: txtBodyMediumRegular(color: grayScaleColorBase),
                ),
              )),
        vpad(130)
      ],
    );
  }
}
