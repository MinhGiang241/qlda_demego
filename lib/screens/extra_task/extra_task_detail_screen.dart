import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_card.dart';
import 'dailog/show_dailog_extra_task.dart';
import 'edit_extra_task_screen.dart';

class ExtraTaskDetailScreen extends StatelessWidget {
  ExtraTaskDetailScreen({super.key});
  static const routeName = '/extra-task/detail';
  TextEditingController deathlineChangecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    final floatbuttons = [
      DialChildren(
        icon: Icons.check_box,
        label: S.of(context).complete,
        onPress: () {},
        primary: primaryColorBase,
      ),
      DialChildren(
        icon: Icons.remove_circle,
        label: S.of(context).refuse,
        onPress: () {
          refuseTask(context, () {});
        },
        primary: redColor2,
      ),
      DialChildren(
        icon: Icons.check_box_rounded,
        label: S.of(context).confirm,
        onPress: () {},
        primary: purpleColor7,
      ),
      DialChildren(
        icon: Icons.link,
        label: S.of(context).add_attached_file,
        onPress: () {
          addAttachedFile(context, () {});
        },
        primary: purpleColor6,
      ),
      DialChildren(
        icon: Icons.add_box,
        label: S.of(context).add_task,
        onPress: () {
          showAddTaskDailog(context, (_) {});
        },
        primary: greenColor6,
      ),
      DialChildren(
        icon: Icons.access_time_filled,
        label: S.of(context).change_deathline,
        onPress: () {
          changeDeathline(context, deathlineChangecontroller, () {});
        },
        primary: yellowColorBase,
      ),
      DialChildren(
        icon: Icons.edit_note,
        label: S.of(context).adjust,
        onPress: () {
          adjustTask(context, () {});
        },
        primary: secondaryColorBase,
      ),
      DialChildren(
        icon: Icons.edit,
        label: S.of(context).edit,
        onPress: () {
          Navigator.of(context).pushNamed(EditExtraTaskScreen.routeName);
        },
        primary: turquoiseColor,
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).ext_task_detail),
      body: ListView(
        shrinkWrap: true,
        children: [
          vpad(12),
          Text(
            S.of(context).task_detail,
            style: txtBodyMediumRegular(color: grayScaleColorBase),
          ),
          vpad(12),
          InfoTable(
            data: arg,
          ),
          vpad(12),
          Text(
            S.of(context).task,
            style: txtBodyMediumRegular(color: grayScaleColorBase),
          ),
          vpad(12),
          InfoTable(data: arg['Đầu việc'].asMap()),
          vpad(12),
          Text(
            S.of(context).attached_file,
            style: txtBodyMediumRegular(color: grayScaleColorBase),
          ),
          vpad(12),
          InfoTable(data: arg['Tệp đính kèm'].asMap()),
          vpad(12),
          Text(
            S.of(context).history,
            style: txtBodyMediumRegular(color: grayScaleColorBase),
          ),
          vpad(12),
          ...arg['Lịch sử'].map(
            (e) => PrimaryCard(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e['Ngày duyệt'],
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                  vpad(12),
                  Text(
                    e['Nội dung'],
                    style: txtRegular(13),
                  ),
                  vpad(12),
                  Text(
                    "${S.of(context).reason} : ${e['Lý do']}",
                    style: txtRegular(13),
                  ),
                ],
              ),
            ),
          ),
          vpad(50)
        ],
      ),
      floatingActionButton: FloatDialButton(data: floatbuttons),
    );
  }
}
