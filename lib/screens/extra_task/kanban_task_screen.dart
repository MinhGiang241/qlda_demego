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
import 'package:appflowy_board/appflowy_board.dart';

import '../../generated/l10n.dart';
import 'kanban/board_view.dart';
import 'kanban/multi_board_list_example.dart';
import 'kanban/single_board_list_example.dart';
import 'kanban/task_status.dart';

final AppFlowyBoardController controller = AppFlowyBoardController(
  onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
    debugPrint('Move item from $fromIndex to $toIndex');
  },
  onMoveGroupItem: (groupId, fromIndex, toIndex) {
    debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
  },
  onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
    debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
  },
);

class KanbanTaskScreen extends StatefulWidget {
  KanbanTaskScreen({super.key});
  static const routeName = '/extra-task/kanban';

  @override
  State<KanbanTaskScreen> createState() => _KanbanTaskScreenState();
}

class _KanbanTaskScreenState extends State<KanbanTaskScreen> {
  int _currentIndex = 0;
  final _bottomNavigationColor = Colors.blue;

  final List<Widget> _examples = [
    const SingleBoardListExample(),
    const MultiBoardListExample(),
    const StatusTask(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).kanban_view),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SearchBar(),
            Flexible(
              child: BoardViewExample(),
              // Container(
              //   color: Colors.white,
              //   child: _examples[_currentIndex],
              // ),
            ),
          ],
        ),
      ),
      //   bottomNavigationBar: BottomNavigationBar(
      //     fixedColor: _bottomNavigationColor,
      //     showSelectedLabels: true,
      //     showUnselectedLabels: false,
      //     currentIndex: _currentIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.grid_on, color: _bottomNavigationColor),
      //         label: "SingleColumn",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.grid_on, color: _bottomNavigationColor),
      //         label: "MultiColumn",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.grid_on, color: _bottomNavigationColor),
      //         label: "StatusTask",
      //       ),
      //     ],
      //     onTap: (int index) {
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     },
      //   ),
    );
  }
}
