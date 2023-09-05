import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_screen.dart';
import 'add_resident_card_screen.dart';
import 'resident_card_details_screen.dart';

const data = [
  {
    "ID": "0001",
    "Chủ thẻ": "Nguyễn Văn A",
    "Số điện thoại": "0123456789",
    "Số thẻ": "123",
    "Mặt bằng": "A1",
    "Tình trạng": "Hoạt động",
    "Dịch vụ": [
      {
        "Dịch vụ": "Bơi",
        "Trạng thái": "Hoạt động",
        "Ngày kích hoạt": "01/01/2022",
        "Ngày hết hạn": "01/01/2022",
        "Lịch sử gia hạn": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ],
        "Lịch sử cập nhật": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ]
      },
      {
        "Dịch vụ": "Gym",
        "Trạng thái": "Không hoạt động",
        "Ngày kích hoạt": "01/01/2022",
        "Ngày hết hạn": "01/01/2022",
        "Lịch sử gia hạn": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ],
        "Lịch sử cập nhật": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ]
      },
    ],
  },
  {
    "ID": "0002",
    "Chủ thẻ": "Nguyễn Văn A",
    "Số điện thoại": "0123456789",
    "Số thẻ": "123",
    "Mặt bằng": "A1",
    "Tình trạng": "Không hoạt động",
    "Dịch vụ": [
      {
        "Dịch vụ": "Bơi",
        "Trạng thái": "Hoạt động",
        "Ngày kích hoạt": "01/01/2022",
        "Ngày hết hạn": "01/01/2022",
        "Lịch sử gia hạn": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ],
        "Lịch sử cập nhật": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ]
      },
      {
        "Dịch vụ": "Gym",
        "Ngày kích hoạt": "01/01/2022",
        "Ngày hết hạn": "01/01/2022",
        "Trạng thái": "Không hoạt động",
        "Lịch sử gia hạn": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ],
        "Lịch sử cập nhật": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ]
      },
    ],
  },
  {
    "ID": "0003",
    "Chủ thẻ": "Nguyễn Văn A",
    "Số điện thoại": "0123456789",
    "Số thẻ": "123",
    "Mặt bằng": "A1",
    "Tình trạng": "Chờ thẻ",
    "Dịch vụ": [
      {
        "Dịch vụ": "Bơi",
        "Trạng thái": "Hoạt động",
        "Ngày kích hoạt": "01/01/2022",
        "Ngày hết hạn": "01/01/2022",
        "Lịch sử gia hạn": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ],
        "Lịch sử cập nhật": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ]
      },
      {
        "Dịch vụ": "Gym",
        "Trạng thái": "Không hoạt động",
        "Ngày kích hoạt": "01/01/2022",
        "Ngày hết hạn": "01/01/2022",
        "Lịch sử gia hạn": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ],
        "Lịch sử cập nhật": [
          {
            "Dịch vụ": "Bơi",
            "Ngày tạo": "01/01/2022 - 10:00",
            "Ngày bắt đầu": "01/01/2022",
            "Gia hạn dịch vụ": "Bơi",
            "Ngày kết thúc": "01/01/2022 - 10:00"
          }
        ]
      },
    ],
  },
];

class ResidentCardListScreen extends StatelessWidget {
  const ResidentCardListScreen({super.key});
  static const routeName = '/resident-card';
  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).res_card_list),
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
                              ResidentCarDetailsScreen.routeName,
                              arguments: data[e.key],
                            );
                          },
                          data: data[e.key],
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
                                    ResidentCarDetailsScreen.routeName,
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
            AddResidentCardScreen.routeName,
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
