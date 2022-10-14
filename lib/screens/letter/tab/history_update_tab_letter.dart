import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/primary_card.dart';
import '../../../widgets/Info_table.dart';
import '../component/code_status_req_etter.dart';

class HistoryUpdateTabLetter extends StatelessWidget {
  const HistoryUpdateTabLetter({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        vpad(12),
        CodeStatusReqLetter(
          code: data['Mã phiếu'],
          status: data['Trạng thái'],
        ),
        vpad(12),
        Text(
          S.of(context).history_update,
          style: txtBodySmallBold(color: blueColor),
          textAlign: TextAlign.center,
        ),
        vpad(12),
        ...data["Lịch sử cập nhật"].map(
          (e) => InfoTable(
            titleWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              width: double.infinity,
              child: Text(
                e["Loại"],
                textAlign: TextAlign.start,
                style: txtBodyMediumBold(),
              ),
            ),
            // title: e["Loại"],
            data: e,
          ),
        )
      ],
    );
  }
}
