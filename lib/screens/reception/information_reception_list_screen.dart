import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_tabbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_screen.dart';
import 'add_information_reception_screen.dart';
import 'tab/reception_list_tab.dart';

var data = [
  {
    "Tiêu đề": "Tiêu đề 1",
    "Trạng thái": "Đang xử lý",
    "Mã đơn": "0001",
    "Người báo cáo": "Nguyễn Văn A",
    "Loại thông tin": "Hỗ trợ",
    "Thời gian tiếp nhận": "01/01/2022 - 10:00",
    "Nôi dung thông tin": "-",
    "Phòng ban chịu trách nhiệm": "Kỹ thuật",
    "Phòng ban liên quan": "-",
    "Hình ảnh": [
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
    ],
    "Ghi chú": [
      {
        "Người tạo": "Nguyễn Văn A",
        "Nội dung": "Nội dung ghi chú",
        "Thời gian": "01/01/2022 - 14:00",
      },
      {
        "Người tạo": "Nguyễn Văn A",
        "Nội dung": "Nội dung ghi chú",
        "Thời gian": "01/01/2022 - 14:00",
      },
    ]
  },
  {
    "Tiêu đề": "Tiêu đề 1",
    "Trạng thái": "Đang xử lý",
    "Mã đơn": "0001",
    "Người báo cáo": "Nguyễn Văn A",
    "Loại thông tin": "Hỗ trợ",
    "Thời gian tiếp nhận": "01/01/2022 - 10:00",
    "Nôi dung thông tin": "-",
    "Phòng ban chịu trách nhiệm": "Kỹ thuật",
    "Phòng ban liên quan": "-",
    "Hình ảnh": [
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
    ],
    "Ghi chú": [
      {
        "Người tạo": "Nguyễn Văn A",
        "Nội dung": "Nội dung ghi chú",
        "Thời gian": "01/01/2022 - 14:00",
      },
      {
        "Người tạo": "Nguyễn Văn A",
        "Nội dung": "Nội dung ghi chú",
        "Thời gian": "01/01/2022 - 14:00",
      },
    ]
  },
  {
    "Tiêu đề": "Tiêu đề 1",
    "Trạng thái": "Đang xử lý",
    "Mã đơn": "0001",
    "Người báo cáo": "Nguyễn Văn A",
    "Loại thông tin": "Hỗ trợ",
    "Thời gian tiếp nhận": "01/01/2022 - 10:00",
    "Nôi dung thông tin": "-",
    "Phòng ban chịu trách nhiệm": "Kỹ thuật",
    "Phòng ban liên quan": "-",
    "Hình ảnh": [
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
      "https://unsplash.it/100/100",
    ],
    "Ghi chú": [
      {
        "Người tạo": "Nguyễn Văn A",
        "Nội dung": "Nội dung ghi chú",
        "Thời gian": "01/01/2022 - 14:00",
      },
      {
        "Người tạo": "Nguyễn Văn A",
        "Nội dung": "Nội dung ghi chú",
        "Thời gian": "01/01/2022 - 14:00",
      },
    ]
  },
];

class InformationReceptionListScreen extends StatefulWidget {
  InformationReceptionListScreen({super.key});
  static const routeName = '/reception';

  @override
  State<InformationReceptionListScreen> createState() =>
      _InformationReceptionListScreenState();
}

class _InformationReceptionListScreenState
    extends State<InformationReceptionListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //  =new TabController(length: 3, vsync: TickerProvider());
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      isPadding: false,
      appBar: PrimaryAppbar(title: S.of(context).info_reception_list),
      drawer: MainDrawer(),
      body: Column(
        children: [
          PrimaryTabBar(
            // isScrollable: true,
            controller: _tabController,
            titles: [
              S.of(context).all,
              S.of(context).wait_exc,
              S.of(context).in_progress,
              S.of(context).exc_done,
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ReceptionListTab(data: data),
                ReceptionListTab(data: data),
                ReceptionListTab(data: data),
                ReceptionListTab(data: data),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context).pushNamed(
            AddInformationReceptionScreen.routeName,
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
