import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/screens/home/home_screen.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_tabbar.dart';
import '../application/components/code_status_letter.dart';
import '../assets/create_request_purchase_screen.dart';
import 'tab/category_tab_letter.dart';
import 'tab/history_approve_tab_letter.dart';
import 'tab/history_update_tab_letter.dart';
import 'tab/related_tab_letter.dart';

class DetailRequestLetterScreen extends StatefulWidget {
  const DetailRequestLetterScreen({super.key});
  static const routeName = '/request-letter/detail';

  @override
  State<DetailRequestLetterScreen> createState() =>
      _DetailRequestLetterScreenState();
}

class _DetailRequestLetterScreenState extends State<DetailRequestLetterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var floatButtons = [
      DialChildren(
        label: S.of(context).recommend_purchase,
        icon: Icons.shopping_cart,
        primary: purpleColor6,
        onPress: () {
          Navigator.of(context)
              .pushNamed(CreateRequestPurchaseScreen.routeName);
        },
      ),
      DialChildren(
        label: S.of(context).reply,
        icon: Icons.chat,
        primary: greenColor6,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).fix,
        icon: Icons.edit_note,
        primary: yellowColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).delete,
        icon: Icons.delete,
        primary: redColor2,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).send,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title:
            '${S.of(context).detail_letter} ${arg['Loại đề xuất'].toLowerCase()} ',
      ),
      body: Column(
        children: [
          PrimaryTabBar(
            controller: _tabController,
            titles: [
              S.of(context).category,
              S.of(context).history_update,
              S.of(context).history_approve,
              S.of(context).related_info,
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CategoryTabLetter(
                  dataInfo: arg,
                  dataAssets: arg['Danh mục'],
                ),
                HistoryUpdateTabLetter(data: arg),
                HistoryApproveTabLetter(data: arg),
                RelatedTabLetter(data: arg)
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatDialButton(
        data: floatButtons,
      ),
    );
  }
}
