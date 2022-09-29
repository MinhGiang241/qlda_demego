import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/screens/application/tabs/history_approve_tab.dart';
import 'package:qlda_demego/screens/application/tabs/history_update_tab.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_screen.dart';
import '../../widgets/primary_tabbar.dart';
import 'application_screen.dart';
import 'tabs/category_tab.dart';
import 'confirm_letter_screen.dart';
import 'reply_letter_screen.dart';

class LetterDetailScreen extends StatefulWidget {
  const LetterDetailScreen({super.key});
  static const routeName = "/application/detail";

  @override
  State<LetterDetailScreen> createState() => _LetterDetailScreenState();
}

class _LetterDetailScreenState extends State<LetterDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //  =new TabController(length: 3, vsync: TickerProvider());
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;

    return PrimaryScreen(
      appBar: PrimaryAppbar(
          title: S.of(context).letter_detail,
          leading: BackButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, ApplicationScreen.routeName))),
      body: Stack(children: [
        Column(
          children: [
            PrimaryTabBar(controller: _tabController, titles: [
              S.of(context).category,
              S.of(context).history_update,
              S.of(context).history_approve,
            ]),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CategoryTab(data: arg),
                  HistoryUpdateTab(data: arg),
                  HistoryApproveTab(data: arg),
                ],
              ),
            )
          ],
        ),
        Positioned(
            bottom: 12,
            child: Container(
              color: Colors.transparent.withOpacity(0),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  PrimaryButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ConfirmLetterScreen.routeName,
                          arguments: arg);
                    },
                    width: dvWidth(context) - 24,
                    text: S.of(context).confirm,
                  ),
                  vpad(12),
                  PrimaryButton(
                    onTap: () {
                      Navigator.pushNamed(context, ReplyLetterScreen.routeName,
                          arguments: arg);
                    },
                    buttonType: ButtonType.secondary,
                    secondaryBackgroundColor: secondaryColorBase,
                    width: dvWidth(context) - 24,
                    text: S.of(context).reply,
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
