import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_screen.dart';
import '../../widgets/search_bar.dart';
import 'dialog/show_dialog_extra_task.dart';
import 'kanban/board_view_assign.dart';

class KanbanAssignTask extends StatelessWidget {
  const KanbanAssignTask({super.key});
  static const routeName = '/extra-task/assign';

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).assign_task),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SearchBar(),
            Flexible(
              child: BoardViewAssign(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorBase,
        onPressed: () {
          showAddEmployeedialog(context, (_) {});
        },
        child: const Icon(
          Icons.person_add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
