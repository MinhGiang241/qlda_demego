import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../assets/create_request_purchase_screen.dart';
import 'component/filter_letter.dart';
import 'detail_request_letter_screen.dart';

const data = [
  {
    "Mã phiếu": "0001",
    "Tiêu đề": "0001",
    "Loại đề xuất": "Đề xuất xuất kho",
    "Người tạo": "Nguyễn Văn A",
    "Lý do": "Xuất kho",
    "Ngày xuất kho": "01/01/2022",
    "Trạng thái": "Chờ thủ kho duyệt",
    "Danh mục": [
      {
        "Tên": "Bóng đèn",
        "Loại": 1,
        "Mã": "A",
        "Đơn vị": "Cái",
        "Số lượng": 5,
        "Mục đích": "Mượn"
      },
      {
        "Tên": "Bóng đèn",
        "Loại": 1,
        "Mã": "A",
        "Đơn vị": "Cái",
        "Số lượng": 5,
        "Mục đích": "Mượn"
      },
    ],
    "Lịch sử cập nhật": [
      {
        "Loại": "Tạo mới",
        "Người thực hiện": "Nguyễn Văn A-nguyenvana",
        "thời gian cập nhật": "01/01/2022 - 14:00"
      },
      {
        "Loại": "Cập nhật",
        "Người thực hiện": "Nguyễn Văn A-nguyenvana",
        "thời gian cập nhật": "01/01/2022 - 16:00"
      },
    ],
    "Lịch sử phê duyệt": [
      {
        "Quyết định": "Đồng ý",
        "Người thục hiện": "Nguyễn Văn A-nguyenvana",
        "Thời gian cập nhật": "01/01/2022 - 16:00",
        "Ghi chú": "Đồng ý phê duyệt"
      },
      {
        "Quyết định": "Đồng ý",
        "Người thục hiện": "Nguyễn Văn A-nguyenvana",
        "Thời gian cập nhật": "01/01/2022 - 16:00",
        "Ghi chú": "Đồng ý phê duyệt"
      }
    ],
    "Thông tin liên quan": {
      "Tiêu đề": "Xuất kho",
      "Tình trạng": "Hoàn thành",
      "Ngày duyệt": "01/01/2022 - 17:00"
    }
  },
  {
    "Mã phiếu": "0003",
    "Tiêu đề": "Đề xuất mua sắm vật tư A",
    "Loại đề xuất": "Đề xuất mua sắm tài sản",
    "Người tạo": "Nguyễn Văn A",
    "Lý do": "Lý do đề xuất mua sắm",
    "Thời hạn xử lý": "12/01/2022 - 16:00",
    "Trạng thái": "Đã duyệt",
    "Độ ưu tiên": "Trung bình",
    "Danh mục": [
      {
        "STT": 1,
        "Tên nhà cung cấp": "NCC1",
        "Số lượng": 12,
        "Mã tài sản": '',
        "Đơn Giá": '',
        "Thành tiền": 65000,
        "Danh sách": [
          {
            "Tài sản": "Bóng đèn",
            "Mã tài sản": "0001",
            "Số lượng": 5,
            "Đơn giá": 60000,
            "Thành Tiền": 300000
          },
          {
            "Tài sản": "Khăn",
            "Mã tài sản": "0002",
            "Số lượng": 4,
            "Đơn giá": 20000,
            "Thành Tiền": 80000
          },
          {
            "Tài sản": "Bóng đèn",
            "Mã tài sản": "0003",
            "Số lượng": 3,
            "Đơn giá": 90000,
            "Thành Tiền": 2700000
          },
        ]
      },
      {
        "STT": 2,
        "Tên nhà cung cấp": "NCC2",
        "Số lượng": 12,
        "Mã tài sản": '',
        "Đơn Giá": '',
        "Thành tiền": 65000,
        "Danh sách": [
          {
            "Tài sản": "Bóng đèn",
            "Mã tài sản": "0001",
            "Số lượng": 5,
            "Đơn giá": 60000,
            "Thành Tiền": 300000
          },
          {
            "Tài sản": "Khăn",
            "Mã tài sản": "0002",
            "Số lượng": 4,
            "Đơn giá": 20000,
            "Thành Tiền": 80000
          },
          {
            "Tài sản": "Bóng đèn",
            "Mã tài sản": "0003",
            "Số lượng": 3,
            "Đơn giá": 90000,
            "Thành Tiền": 2700000
          },
        ]
      },
      {
        "STT": 3,
        "Tên nhà cung cấp": "NCC3",
        "Số lượng": 12,
        "Mã tài sản": '',
        "Đơn Giá": '',
        "Thành tiền": 65000,
        "Danh sách": [
          {
            "Tài sản": "Bóng đèn",
            "Mã tài sản": "0001",
            "Số lượng": 5,
            "Đơn giá": 60000,
            "Thành Tiền": 300000
          },
          {
            "Tài sản": "Khăn",
            "Mã tài sản": "0002",
            "Số lượng": 4,
            "Đơn giá": 20000,
            "Thành Tiền": 80000
          },
          {
            "Tài sản": "Bóng đèn",
            "Mã tài sản": "0003",
            "Số lượng": 3,
            "Đơn giá": 90000,
            "Thành Tiền": 2700000
          },
        ]
      },
    ],
    "Lịch sử cập nhật": [
      {
        "Loại": "Tạo mới",
        "Người thực hiện": "Nguyễn Văn A-nguyenvana",
        "thời gian cập nhật": "01/01/2022 - 14:00"
      },
      {
        "Loại": "Cập nhật",
        "Người thực hiện": "Nguyễn Văn A-nguyenvana",
        "thời gian cập nhật": "01/01/2022 - 16:00"
      },
    ],
    "Lịch sử phê duyệt": [
      {
        "Quyết định": "Đồng ý",
        "Người thục hiện": "Nguyễn Văn A-nguyenvana",
        "Thời gian cập nhật": "01/01/2022 - 16:00",
        "Ghi chú": "Đồng ý phê duyệt"
      },
      {
        "Quyết định": "Đồng ý",
        "Người thục hiện": "Nguyễn Văn A-nguyenvana",
        "Thời gian cập nhật": "01/01/2022 - 16:00",
        "Ghi chú": "Đồng ý phê duyệt"
      }
    ],
    "Thông tin liên quan": {}
  },
  {
    "Mã phiếu": "0002",
    "Tiêu đề": "Đề xuất sửa chữa A",
    "Loại đề xuất": "Đề xuất sửa chữa/thay thế",
    "Người tạo": "Nguyễn Văn B",
    "Phòng ban": "Phòng kỹ t huật",
    "Ngày tạo": "01/01/2022 - 14:00",
    "Trạng thái": "Chờ thủ kho duyệt",
    "Vị trí": "Tòa A - Tầng 2",
    "Danh mục": [
      {
        "Nội dung": "Nội dung 1",
        "Lý do sửa chữa/thay thế": "Lý do 1",
        "Ghi chú": "Ghi chú 1"
      },
      {
        "Nội dung": "Nội dung 2",
        "Lý do sửa chữa/thay thế": "Lý do 2",
        "Ghi chú": "Ghi chú 2"
      },
    ],
    "Lịch sử cập nhật": [
      {
        "Loại": "Tạo mới",
        "Người thực hiện": "Nguyễn Văn A-nguyenvana",
        "thời gian cập nhật": "01/01/2022 - 14:00"
      },
      {
        "Loại": "Cập nhật",
        "Người thực hiện": "Nguyễn Văn A-nguyenvana",
        "thời gian cập nhật": "01/01/2022 - 16:00"
      },
    ],
    "Lịch sử phê duyệt": [
      {
        "Quyết định": "Đồng ý",
        "Người thục hiện": "Nguyễn Văn A-nguyenvana",
        "Thời gian cập nhật": "01/01/2022 - 16:00",
        "Ghi chú": "Đồng ý phê duyệt"
      },
      {
        "Quyết định": "Đồng ý",
        "Người thục hiện": "Nguyễn Văn A-nguyenvana",
        "Thời gian cập nhật": "01/01/2022 - 16:00",
        "Ghi chú": "Đồng ý phê duyệt"
      }
    ],
    "Thông tin liên quan": {
      "Tiêu đề": "Xuất kho",
      "Tình trạng": "Hoàn thành",
      "Ngày duyệt": "01/01/2022 - 17:00"
    }
  },
];

class RequestLetterListScreen extends StatelessWidget {
  const RequestLetterListScreen({super.key});
  static const routeName = "/request-letter";

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).req_letter_management),
      drawer: MainDrawer(),
      body: Column(
        children: [
          SearchBar(
            onPress: () {
              filterLetter(context);
            },
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) => InfoTable(
                data: data[index],
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DetailRequestLetterScreen.routeName,
                    arguments: data[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context)
              .pushNamed(CreateRequestPurchaseScreen.routeName);
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
