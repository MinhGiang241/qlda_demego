import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/primary_card.dart';
import '../component/code_status_req_etter.dart';

class RelatedTabLetter extends StatelessWidget {
  const RelatedTabLetter({super.key, this.data});
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
        data['Thông tin liên quan'].keys.length == 0
            ? PrimaryCard(
                width: double.infinity,
                height: 130,
                child: Center(
                  child: Text(
                    S.of(context).no_data,
                    style: txtBodySmallBold(color: grayScaleColorBase),
                  ),
                ),
              )
            : InfoTable(
                data: data['Thông tin liên quan'],
              ),
        vpad(12),
      ],
    );
  }
}
