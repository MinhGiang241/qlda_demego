import 'package:boardview/boardview.dart';
import 'package:flutter/material.dart';
import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview_controller.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/primary_card.dart';

class BoardItemObject {
  String? title;
  String? note;

  Widget? child;
  BoardItemObject({this.title, this.note}) {
    title ??= "";

    child = PrimaryCard(
      gradient: gradientPrimary,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vpad(12),
          Text(
            title!,
            style: txtBodySmallBold(color: Colors.white),
          ),
          vpad(6),
          if (note != null)
            Text(
              note!,
              style: txtBodyXSmallRegular(color: Colors.white),
            ),
          vpad(12),
        ],
      ),
    );
  }
}

class BoardListObject {
  String? title;
  List<BoardItemObject>? items;

  BoardListObject({this.title, this.items}) {
    title ??= "";
    items ??= [];
  }
}

final a = BoardItemObject(
  title: "Kiểm tra tài sản tầng 1",
  note: '0/10 checklist item ',
);

class BoardViewAssign extends StatelessWidget {
  BoardViewAssign({super.key});
  final List<BoardListObject> _listData = [
    BoardListObject(title: S.current.task, items: [a, a, a]),
    BoardListObject(title: "Nguyễn Văn A", items: [a, a]),
    BoardListObject(title: "Nguyễn Văn B", items: [a]),
    BoardListObject(title: "Nguyễn Văn C", items: [a]),
  ];

  //Can be used to animate to different sections of the BoardView
  BoardViewController boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<BoardList> _lists = [];
    for (int i = 0; i < _listData.length; i++) {
      _lists.add(_createBoardList(_listData[i]) as BoardList);
    }
    return BoardView(
      lists: _lists,
      boardViewController: boardViewController,
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
      onStartDragItem:
          (int? listIndex, int? itemIndex, BoardItemState? state) {},
      onDropItem: (
        int? listIndex,
        int? itemIndex,
        int? oldListIndex,
        int? oldItemIndex,
        BoardItemState? state,
      ) {
        //Used to update our local item data
        var item = _listData[oldListIndex!].items![oldItemIndex!];
        _listData[oldListIndex].items!.removeAt(oldItemIndex);
        _listData[listIndex!].items!.insert(itemIndex!, item);
      },
      onTapItem:
          (int? listIndex, int? itemIndex, BoardItemState? state) async {},
      item: itemObject.child,
    );
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
    }

    return BoardList(
      footer: vpad(30),
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _listData[oldListIndex!];
        _listData.removeAt(oldListIndex);
        _listData.insert(listIndex!, list);
      },
      headerBackgroundColor: null,
      backgroundColor: grayScaleColorBase.withOpacity(0.1),
      header: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              list.title!,
              textAlign: TextAlign.center,
              style: txtBodySmallBold(),
            ),
          ),
        ),
      ],
      items: items,
    );
  }
}
