import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:qlda_demego/constant/constants.dart';

import '../../../generated/l10n.dart';

class StatusTask extends StatefulWidget {
  const StatusTask({super.key});

  @override
  State<StatusTask> createState() => _StatusTaskState();
}

class _StatusTaskState extends State<StatusTask> {
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

  late AppFlowyBoardScrollController boardController;
  @override
  void initState() {
    boardController = AppFlowyBoardScrollController();
    final group1 = AppFlowyGroupData(
      id: S.current.wait_assign,
      name: S.current.wait_assign,
      items: <AppFlowyGroupItem>[
        TextItem("Card 1"),
        TextItem("Card 2"),
        RichTextItem(title: "Card 3", subtitle: 'Aug 1, 2020 4:05 PM'),
        TextItem("Card 4"),
        TextItem("Card 5"),
        TextItem("Card 6"),
        RichTextItem(title: "Card 7", subtitle: 'Aug 1, 2020 4:05 PM'),
        RichTextItem(title: "Card 8", subtitle: 'Aug 1, 2020 4:05 PM'),
        TextItem("Card 9"),
      ],
    );
    final group2 = AppFlowyGroupData(
      id: S.current.wait_execute,
      name: S.current.wait_execute,
      items: <AppFlowyGroupItem>[
        TextItem("Card 1"),
        TextItem("Card 2"),
      ],
    );
    final group3 = AppFlowyGroupData(
      id: S.current.in_progress,
      name: S.current.in_progress,
      items: <AppFlowyGroupItem>[],
    );
    final group4 = AppFlowyGroupData(
      id: S.current.wait_confirm,
      name: S.current.wait_confirm,
      items: <AppFlowyGroupItem>[],
    );
    final group5 = AppFlowyGroupData(
      id: S.current.complete,
      name: S.current.complete,
      items: <AppFlowyGroupItem>[],
    );
    // controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);
    controller.addGroup(group4);
    controller.addGroup(group5);
    super.initState();
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TextItem) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(item.s),
        ),
      );
    }

    if (item is RichTextItem) {
      return RichTextCard(item: item);
    }

    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: grayScaleColorBase,
    );
    return AppFlowyBoard(
      config: config,
      controller: controller,
      groupConstraints: const BoxConstraints.tightFor(width: 240),
      cardBuilder: ((context, groupData, groupItem) {
        return AppFlowyGroupCard(
          key: ValueKey(groupItem.id),
          child: _buildCard(groupItem),
        );
      }),
      headerBuilder: (context, columnData) {
        return AppFlowyGroupHeader(
          height: 50,
          margin: config.groupItemPadding,
          title: SizedBox(
            width: 150,
            child: TextField(
              controller: TextEditingController()
                ..text = columnData.headerData.groupName,
              onSubmitted: (val) {},
            ),
          ),
        );
      },
    );
  }
}

class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}

class RichTextItem extends AppFlowyGroupItem {
  final String title;
  final String subtitle;

  RichTextItem({required this.title, required this.subtitle});

  @override
  String get id => title;
}

/// RictextCard

class RichTextCard extends StatefulWidget {
  final RichTextItem item;
  const RichTextCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<RichTextCard> createState() => _RichTextCardState();
}

class _RichTextCardState extends State<RichTextCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.title,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              widget.item.subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
