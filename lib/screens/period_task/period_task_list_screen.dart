import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/Info_table.dart';
import 'package:qlda_demego/widgets/float_button.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_dialog.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../utils/dialog.dart';
import '../../utils/utils.dart';
import '../../widgets/search_bar.dart';
import 'dialog/period_task_dialog.dart';
import 'edit_task_config_screen.dart';

class PeriodTaskListScreen extends StatefulWidget {
  PeriodTaskListScreen({super.key});
  static const routeName = '/period-task';

  @override
  State<PeriodTaskListScreen> createState() => _PeriodTaskListScreenState();
}

class _PeriodTaskListScreenState extends State<PeriodTaskListScreen> {
  var data = [
    {
      "id": "1",
      "Tên công việc": "Bảo trì thang máy tòa B2",
      "Phòng ban phụ trách": "Kỹ thuật",
      "Người giao việc": "Nguyễn Văn B",
      "Tần suất": "Hàng ngày",
      "Thời gian lập": "10:00 , 14:00",
      "Công việc tạc trước": "1 phút",
      "Trạng thái": "Không hoạt động"
    },
    {
      "id": "2",
      "Tên công việc": "Bảo trì thang máy tòa B2",
      "Phòng ban phụ trách": "Kỹ thuật",
      "Người giao việc": "Nguyễn Văn B",
      "Tần suất": "Hàng ngày",
      "Thời gian lập": "10:00 , 14:00",
      "Công việc tạc trước": "1 phút",
      "Trạng thái": "Không hoạt động"
    },
    {
      "id": "3",
      "Tên công việc": "Bảo trì thang máy tòa B2",
      "Phòng ban phụ trách": "Kỹ thuật",
      "Người giao việc": "Nguyễn Văn B",
      "Tần suất": "Hàng ngày",
      "Thời gian lập": "10:00 , 14:00",
      "Công việc tạc trước": "1 phút",
      "Trạng thái": "Không hoạt động"
    },
    {
      "id": "4",
      "Tên công việc": "Bảo trì thang máy tòa B2",
      "Phòng ban phụ trách": "Kỹ thuật",
      "Người giao việc": "Nguyễn Văn B",
      "Tần suất": "Hàng ngày",
      "Thời gian lập": "10:00 , 14:00",
      "Công việc tạc trước": "1 phút",
      "Trạng thái": "Không hoạt động"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).period_task_list,
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) => InfoTable(
                  data: data[index],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        text: S.of(context).sua,
                        buttonSize: ButtonSize.medium,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            EditTaskConfigScreen.routeName,
                            arguments: {'isEdit': true},
                          );
                        },
                      ),
                      hpad(35),
                      PrimaryButton(
                        onTap: () {
                          onConfirmDelete(
                              context, S.of(context).confirm_detele_config, () {
                            data.removeWhere(
                              (element) => element['id'] == data[index]['id'],
                            );
                            setState(() {});
                            Navigator.pop(context);
                          });
                        },
                        text: S.of(context).delete,
                        buttonSize: ButtonSize.medium,
                        buttonType: ButtonType.secondary,
                        secondaryBackgroundColor: redColor4,
                        textColor: redColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditTaskConfigScreen.routeName,
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
