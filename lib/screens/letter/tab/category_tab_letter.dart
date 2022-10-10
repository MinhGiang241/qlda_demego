import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/Info_table.dart';
import '../../assets/components/data_asset_quotation_table.dart';
import '../component/code_status_req_etter.dart';

class CategoryTabLetter extends StatelessWidget {
  CategoryTabLetter({super.key, this.dataInfo, this.dataAssets});
  final dataInfo;
  final dataAssets;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        vpad(12),
        // ignore: prefer_const_constructors
        CodeStatusReqLetter(
          code: dataInfo['Mã phiếu'],
          status: dataInfo['Trạng thái'],
        ),
        vpad(12),
        Text(
          S.of(context).general_info,
          style: txtBodySmallBold(color: blueColor),
          textAlign: TextAlign.center,
        ),
        vpad(12),
        InfoTable(
          data: dataInfo,
        ),
        Text(
          S.of(context).category,
          style: txtBodySmallBold(color: blueColor),
          textAlign: TextAlign.center,
        ),
        vpad(12),
        dataInfo['Loại đề xuất'] == 'Đề xuất mua sắm tài sản'
            ? DataAssetQuotationTable(
                data: dataInfo['Danh mục'],
              )
            : Column(
                children: [
                  ...dataAssets.map(
                    (e) => InfoTable(
                      data: e,
                    ),
                  )
                ],
              ),

        vpad(50),
      ],
    );
  }
}
