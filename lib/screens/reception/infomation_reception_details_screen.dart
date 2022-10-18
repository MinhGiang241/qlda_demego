import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_tabbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_screen.dart';
import 'dialog/reception_dialog.dart';
import 'tab/detail_reception_tab_all.dart';
import 'tab/reception_note_tab.dart';

class InformationReceptionDetailScreen extends StatefulWidget {
  const InformationReceptionDetailScreen({super.key});
  static const routeName = '/reception/detail';

  @override
  State<InformationReceptionDetailScreen> createState() =>
      _InformationReceptionDetailScreenState();
}

class _InformationReceptionDetailScreenState
    extends State<InformationReceptionDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var _currentIndex = 1;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
  }

  // ignore: prefer_final_fields
  // var _handleTabSelection = () {

  // };

  var showDialAddNote = false;
  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var floatButtons = [
      DialChildren(
        label: S.of(context).add_work,
        icon: Icons.add,
        primary: secondaryColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).reply,
        icon: Icons.send,
        primary: yellowColorBase,
        onPress: () {},
      ),
    ];

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    return PrimaryScreen(
      isPadding: false,
      appBar: PrimaryAppbar(
        title: S.of(context).info_recept_details,
      ),
      body: Column(
        children: [
          PrimaryTabBar(
            isScrollable: true,
            controller: _tabController,
            titles: [
              S.of(context).all,
              S.of(context).activity,
              S.of(context).note,
              S.of(context).phone_num,
              S.of(context).mess,
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DetailReceptionTabAll(data: arg),
                Container(),
                ReceptionNoteTab(data: arg['Ghi chú']),
                Container(),
                Container(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatDialButton(
        data: [
          ...floatButtons,
          if (_currentIndex == 2)
            DialChildren(
              label: S.of(context).add_note,
              icon: Icons.note,
              primary: greenColor6,
              onPress: () {
                showAddNoteDialog(context, (String note) {
                  var notes = [
                    ...arg['Ghi chú'],
                    {
                      "Người tạo": "Nguyễn Văn A",
                      "Nội dung": note,
                      "Thời gian": DateTime.now()
                          .toIso8601String()
                          .formatDateTimeHmDMY(),
                    }
                  ];

                  setState(() {
                    arg['Ghi chú'] = notes;
                  });

                  print(notes);
                });
              },
            ),
        ],
      ),
    );
  }
}
