import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import '../../../widgets/primary_card.dart';
import '../../../widgets/Info_table.dart';
import '../components/code_status_letter.dart';

class HistoryUpdateTab extends StatelessWidget {
  const HistoryUpdateTab({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        vpad(12),
        CodeStatusLetter(
          code: '0001',
          status: data['Trạng thái'],
        ),
        vpad(16),
        InfoTable(
          title: "Cập nhật",
          data: data['Lịch sử cập nhật'][0],
        ),
        InfoTable(
          title: "Tạo mới",
          data: {
            "Người thực hiện": data["Người tạo"],
            "Thời gian tạo": data["Thời gian tạo"]
          },
        ),
      ],
    );
  }
}
