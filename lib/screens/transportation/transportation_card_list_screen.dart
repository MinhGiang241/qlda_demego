import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_button.dart';
import 'add_transportation_card_screen.dart';
import 'transportation_card_details_screen.dart';

var data = [
  {
    "ID": "0001",
    "Chủ thẻ": "Nguyễn Văn A",
    "Địa chỉ": "A2",
    "Loại phương tiện": "Xe máy",
    "Biển kiểm soát": "29C1-342.13",
    "Tình trạng": "Hoạt động",
    "Số điện thoại": "0123456789",
    "Số thẻ": "8993003",
    "Thông tin xe": {
      "Trạng thái": "Hoạt động",
      "Loại": "Xe máy",
      "Dòng": "Honda",
      "Biển kiểm soát": "29G1-132.12",
      "Màu": "Đen",
      "Số đăng ký": "0123455"
    },
    "Lịch sử thanh toán": [
      {
        "Ngày thanh toán": "01/01/2022",
        "Nội dung":
            "Thanh toán vé xe máy từ ngày 01/01/2022 đến ngày 31/01/2022"
      },
      {
        "Ngày thanh toán": "01/01/2022",
        "Nội dung":
            "Thanh toán vé xe máy từ ngày 01/01/2022 đến ngày 31/01/2022"
      },
    ]
  },
  {
    "ID": "0002",
    "Chủ thẻ": "Nguyễn Văn B",
    "Địa chỉ": "A3",
    "Loại phương tiện": "Ô tô",
    "Biển kiểm soát": "29C1-342.11",
    "Tình trạng": "Không hoạt động",
    "Số điện thoại": "0123456789",
    "Số thẻ": "8993003",
    "Thông tin xe": {
      "Trạng thái": "Hoạt động",
      "Loại": "Xe máy",
      "Dòng": "Honda",
      "Biển kiểm soát": "29G1-132.12",
      "Màu": "Đen",
      "Số đăng ký": "0123455"
    },
    "Lịch sử thanh toán": [
      {
        "Ngày thanh toán": "01/01/2022",
        "Nội dung":
            "Thanh toán vé xe máy từ ngày 01/01/2022 đến ngày 31/01/2022"
      },
      {
        "Ngày thanh toán": "01/01/2022",
        "Nội dung":
            "Thanh toán vé xe máy từ ngày 01/01/2022 đến ngày 31/01/2022"
      },
    ]
  },
  {
    "ID": "0003",
    "Chủ thẻ": "Nguyễn Văn B",
    "Địa chỉ": "A2",
    "Loại phương tiện": "Xe máy",
    "Biển kiểm soát": "29C1-342.12",
    "Tình trạng": "Chờ thẻ",
    "Số điện thoại": "0123456789",
    "Số thẻ": "8993003",
    "Thông tin xe": {
      "Trạng thái": "Hoạt động",
      "Loại": "Xe máy",
      "Dòng": "Honda",
      "Biển kiểm soát": "29G1-132.12",
      "Màu": "Đen",
      "Số đăng ký": "0123455"
    },
    "Lịch sử thanh toán": [
      {
        "Ngày thanh toán": "01/01/2022",
        "Nội dung":
            "Thanh toán vé xe máy từ ngày 01/01/2022 đến ngày 31/01/2022"
      },
      {
        "Ngày thanh toán": "01/01/2022",
        "Nội dung":
            "Thanh toán vé xe máy từ ngày 01/01/2022 đến ngày 31/01/2022"
      },
    ]
  },
];

class TransportationCardList extends StatelessWidget {
  const TransportationCardList({super.key});
  static const routeName = '/transportation';

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).trans_card_list),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            Flexible(
              child: ListView(
                children: [
                  ...data.asMap().entries.map(
                        (e) => InfoTable(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              TransportationCardDetailScreen.routeName,
                              arguments: data[e.key],
                            );
                          },
                          data: e.value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PrimaryButton(
                                text: S.of(context).activate,
                                buttonType: ButtonType.black,
                                buttonSize: ButtonSize.small,
                                onTap: () {},
                              ),
                              hpad(12),
                              PrimaryButton(
                                text: S.of(context).edit,
                                buttonSize: ButtonSize.small,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    TransportationCardDetailScreen.routeName,
                                    arguments: data[e.key],
                                  );
                                },
                              ),
                              hpad(12),
                              PrimaryButton(
                                text: S.of(context).cancel,
                                buttonSize: ButtonSize.small,
                                buttonType: ButtonType.secondary,
                                secondaryBackgroundColor: redColor4,
                                textColor: redColor,
                                onTap: () {},
                              ),
                              hpad(12)
                            ],
                          ),
                        ),
                      ),
                  vpad(70)
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context).pushNamed(
            AddTransportationCardScreen.routeName,
          );
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
