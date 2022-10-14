import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:qlda_demego/widgets/float_button.dart';
import 'package:boardview/boardview.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/search_bar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import 'kanban/board_view_status.dart';
import 'kanban_assign_screen.dart';

class KanbanTaskScreen extends StatefulWidget {
  KanbanTaskScreen({super.key});
  static const routeName = '/extra-task/kanban';

  @override
  State<KanbanTaskScreen> createState() => _KanbanTaskScreenState();
}

class _KanbanTaskScreenState extends State<KanbanTaskScreen> {
  int _currentIndex = 0;
  final _bottomNavigationColor = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).cr_task,
        icon: Icons.add_box,
        primary: greenColor6,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).task_list,
        icon: Icons.article,
        primary: yellowColor7,
        onPress: () {},
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
      appBar: PrimaryAppbar(title: S.of(context).kanban_view),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SearchBar(),
            Flexible(
              child: BoardViewStatus(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
