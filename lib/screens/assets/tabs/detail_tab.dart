import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/Info_table.dart';

class DetailTab extends StatelessWidget {
  DetailTab({super.key});

  var data = {
    "Tên tài sản": "Thẻ cư dân 2",
    "Loại": "Thẻ",
    "Bộ phận": "Bộ phận kỹ thuật",
    "Nhóm tài sản": "Thẻ cư dân",
    "Số hiệu": "THECUDAN2",
    "Xuất xứ": "-",
    "Hãng": "-",
    "Đơn vị": "Cái",
    "Hạn bảo hành": "-",
    "Mã tài sản": "THECUDANXYZ",
    "Ngày bảo trì gần nhất": "10/05/2022",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          vpad(12),
          InfoTable(
            data: data,
          )
        ],
      ),
    );
  }
}
