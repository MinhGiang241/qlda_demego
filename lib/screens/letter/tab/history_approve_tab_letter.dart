import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/Info_table.dart';
import '../component/code_status_req_etter.dart';

class HistoryApproveTabLetter extends StatelessWidget {
  const HistoryApproveTabLetter({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      // padding: EdgeInsets.zero,
      children: [
        vpad(12),
        CodeStatusReqLetter(
          code: data['Mã phiếu'],
          status: data['Trạng thái'],
        ),
        vpad(12),
        Text(
          S.of(context).history_approve,
          style: txtBodySmallBold(color: blueColor),
          textAlign: TextAlign.center,
        ),
        vpad(12),
        data['Lịch sử phê duyệt'] != null
            ? Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data['Lịch sử phê duyệt'].length,
                  itemBuilder: ((context, index) => InfoTable(
                        data: data['Lịch sử phê duyệt'][index],
                      )),
                ),
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
