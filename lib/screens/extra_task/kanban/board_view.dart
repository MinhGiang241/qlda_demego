import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:boardview/boardview.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_card.dart';

import '../../../generated/l10n.dart';

class BoardItemObject {
  String? title;
  Widget? child;
  BoardItemObject({this.title}) {
    title ??= "";
    child = PrimaryCard(
      gradient: gradientPrimary,
      child: Column(
        children: [
          vpad(12),
          Text(
            title!,
            style: txtBodySmallRegular(color: Colors.white),
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

class BoardViewExample extends StatelessWidget {
  final List<BoardListObject> _listData = [
    BoardListObject(
      title: S.current.wait_assign,
      items: [BoardItemObject(title: "hello")],
    ),
    BoardListObject(
      title: S.current.wait_execute,
    ),
    BoardListObject(title: S.current.in_progress),
    BoardListObject(title: S.current.wait_confirm),
    BoardListObject(title: S.current.complete),
  ];

  //Can be used to animate to different sections of the BoardView
  BoardViewController boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
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

      //  Card(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text(itemObject.title!),
      //   ),
      // ),
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
      headerBackgroundColor: Colors.red, //Colors.white.withOpacity(0.5),
      backgroundColor: Colors.red, //Colors.white.withOpacity(0.5),
      header: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  list.title!,
                  textAlign: TextAlign.center,
                  style: txtBodySmallBold(),
                ))),
      ],
      items: items,
    );
  }
}
