import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/screens/extra_task/kanban_task_screen.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_tabbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import 'create_extra_task_screen.dart';
import 'kanban_assign_screen.dart';
import 'tabs/extra_task_list_tab.dart';

const data = [
  {
    "Tên công việc": "Bảo trì thang máy",
    "Loại công việc": "Công việc phát sinh",
    "Người giao việc": "Nguyễn Văn A",
    "Người được giao": "Nguyễn Văn B",
    "Phòng ban": "Phòng kỹ thuật",
    "Chốt": "A",
    "Từ": "06/08/2022 10:00",
    "Đến": "06/08/2022 10:00",
    "Người theo dõi": "Nguyễn Văn A - nguyenvana",
    "Xác nhận cv": "Thành viên và người giao việc",
    "Tiến độ": "100%",
    "Ưu tiên": 'Cao',
    "Thành viên": "Nguyễn A, Nguyễn B, Nguyễn C, Nguyễn D",
    "Đạt": 10,
    "Không đạt": 2,
    "Quá hạn": "1 ngày",
    "Trạng thái": "Hoàn thành",
    "Đầu việc": [
      "Đầu việc 1",
      "Đầu việc 2",
      "Đầu việc 3",
      "Đầu việc 4",
    ],
    "Tệp đính kèm": [
      "File1.pdf",
      "File2.pdf",
      "File3.pdf",
      "File4.pdf",
    ],
    "Lịch sử": [
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
    ]
  },
  {
    "Tên công việc": "Bảo trì thang máy",
    "Loại công việc": "Công việc phát sinh",
    "Người giao việc": "Nguyễn Văn A",
    "Người được giao": "Nguyễn Văn B",
    "Phòng ban": "Phòng kỹ thuật",
    "Chốt": "A",
    "Từ": "06/08/2022 10:00",
    "Đến": "06/08/2022 10:00",
    "Người theo dõi": "Nguyễn Văn A - nguyenvana",
    "Xác nhận cv": "Thành viên và người giao việc",
    "Tiến độ": "100%",
    "Ưu tiên": 'Cao',
    "Thành viên": "Nguyễn A, Nguyễn B, Nguyễn C, Nguyễn D",
    "Đạt": 10,
    "Không đạt": 2,
    "Quá hạn": "1 ngày",
    "Trạng thái": "Hoàn thành",
    "Đầu việc": [
      "Đầu việc 1",
      "Đầu việc 2",
      "Đầu việc 3",
      "Đầu việc 4",
    ],
    "Tệp đính kèm": [
      "File1.pdf",
      "File2.pdf",
      "File3.pdf",
      "File4.pdf",
    ],
    "Lịch sử": [
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
    ]
  },
  {
    "Tên công việc": "Bảo trì thang máy",
    "Loại công việc": "Công việc phát sinh",
    "Người giao việc": "Nguyễn Văn A",
    "Người được giao": "Nguyễn Văn B",
    "Phòng ban": "Phòng kỹ thuật",
    "Chốt": "A",
    "Từ": "06/08/2022 10:00",
    "Đến": "06/08/2022 10:00",
    "Người theo dõi": "Nguyễn Văn A - nguyenvana",
    "Xác nhận cv": "Thành viên và người giao việc",
    "Tiến độ": "100%",
    "Ưu tiên": 'Cao',
    "Thành viên": "Nguyễn A, Nguyễn B, Nguyễn C, Nguyễn D",
    "Đạt": 10,
    "Không đạt": 2,
    "Quá hạn": "1 ngày",
    "Trạng thái": "Hoàn thành",
    "Đầu việc": [
      "Đầu việc 1",
      "Đầu việc 2",
      "Đầu việc 3",
      "Đầu việc 4",
    ],
    "Tệp đính kèm": [
      "File1.pdf",
      "File2.pdf",
      "File3.pdf",
      "File4.pdf",
    ],
    "Lịch sử": [
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
    ]
  },
  {
    "Tên công việc": "Bảo trì thang máy",
    "Loại công việc": "Công việc phát sinh",
    "Người giao việc": "Nguyễn Văn A",
    "Người được giao": "Nguyễn Văn B",
    "Phòng ban": "Phòng kỹ thuật",
    "Chốt": "A",
    "Từ": "06/08/2022 10:00",
    "Đến": "06/08/2022 10:00",
    "Người theo dõi": "Nguyễn Văn A - nguyenvana",
    "Xác nhận cv": "Thành viên và người giao việc",
    "Tiến độ": "100%",
    "Ưu tiên": 'Cao',
    "Thành viên": "Nguyễn A, Nguyễn B, Nguyễn C, Nguyễn D",
    "Đạt": 10,
    "Không đạt": 2,
    "Quá hạn": "1 ngày",
    "Trạng thái": "Hoàn thành",
    "Đầu việc": [
      "Đầu việc 1",
      "Đầu việc 2",
      "Đầu việc 3",
      "Đầu việc 4",
    ],
    "Tệp đính kèm": [
      "File1.pdf",
      "File2.pdf",
      "File3.pdf",
      "File4.pdf",
    ],
    "Lịch sử": [
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "lý do": "Abc xyz"
      },
      {
        "Ngày duyệt": "02/02/2022 10:00",
        "Nội dung": "Nguyễn Văn A đã từ chối xác nhận",
        "Lý do": "Abc xyz"
      },
    ]
  },
];

class ExtraTaskListScreen extends StatefulWidget {
  const ExtraTaskListScreen({super.key});
  static const routeName = '/extra-task';

  @override
  State<ExtraTaskListScreen> createState() => _ExtraTaskListScreenState();
}

class _ExtraTaskListScreenState extends State<ExtraTaskListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //  =new TabController(length: 3, vsync: TickerProvider());
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).cr_task,
        icon: Icons.add_box,
        primary: greenColor6,
        onPress: () {
          Navigator.of(context).pushNamed(CreateExtraTaskScreen.routeName);
        },
      ),
      DialChildren(
        label: S.of(context).kanban_view,
        icon: Icons.hourglass_top,
        primary: yellowColor7,
        onPress: () {
          Navigator.of(context).pushNamed(KanbanTaskScreen.routeName);
        },
      ),
      DialChildren(
        label: S.of(context).assign_task,
        icon: Icons.send,
        primary: redColor2,
        onPress: () {
          Navigator.of(context).pushNamed(KanbanAssignTask.routeName);
        },
      ),
    ];
    return PrimaryScreen(
      isPadding: false,
      appBar: PrimaryAppbar(title: S.of(context).ext_task_list),
      drawer: MainDrawer(),
      body: Column(
        children: [
          PrimaryTabBar(
            isScrollable: true,
            controller: _tabController,
            titles: [
              S.of(context).wait_assign,
              S.of(context).wait_execute,
              S.of(context).in_progress,
              S.of(context).wait_confirm,
              S.of(context).complete,
              S.of(context).over_time,
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ExtraTaskListTab(data: data),
                const ExtraTaskListTab(data: data),
                const ExtraTaskListTab(data: data),
                const ExtraTaskListTab(data: data),
                const ExtraTaskListTab(data: data),
                const ExtraTaskListTab(data: data),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
