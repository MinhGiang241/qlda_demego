import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_card.dart';

import 'data_table_expand.dart';

class DataAssetQuotationTable extends StatefulWidget {
  DataAssetQuotationTable({super.key, required this.data});
  final data;

  @override
  State<DataAssetQuotationTable> createState() =>
      _DataAssetQuotationTableState();
}

class _DataAssetQuotationTableState extends State<DataAssetQuotationTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var titles = [
      'STT',
      'Tên nhà cung cấp',
      'Mã tài sản',
      'Số lượng',
      'Đơn giá',
      'Thành tiền'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...widget.data.asMap().entries.map(
                (e) => DataTableExpand(
                  data: e,
                  titles: titles,
                ),
              )

          //   Column(
          //     children: [
          //       PrimaryCard(
          //           child: Column(
          //         children: [
          //           Row(
          //             children: [
          //               ...titles.asMap().entries.map(
          //                     (t) => DataTableExpand(
          //                       title: t,
          //                       data: e,
          //                     ),
          //                   )
          //             ],
          //           ),
          //           Row(),
          //         ],
          //       )),
          //       vpad(6),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
