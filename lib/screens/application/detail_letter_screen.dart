import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/screens/application/components/history_approve_tab.dart';
import 'package:qlda_demego/screens/application/components/history_update_tab.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../generated/l10n.dart';
import '../../widgets/primary_appbar.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_screen.dart';
import 'application_screen.dart';
import 'components/category_tab.dart';

class DetailLetterScreen extends StatefulWidget {
  const DetailLetterScreen({super.key});
  static const routeName = "/application/detail";

  @override
  State<DetailLetterScreen> createState() => _DetailLetterScreenState();
}

class _DetailLetterScreenState extends State<DetailLetterScreen>
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
          title: S.of(context).detail_letter,
          leading: BackButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, ApplicationScreen.routeName))),
      body: Stack(children: [
        Column(
          children: [
            SafeArea(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: TabBar(
                    labelStyle: txtBodySmallBold(),
                    labelColor: grayScaleColorBase,
                    controller: _tabController,
                    tabs: [
                      Tab(
                          child: AutoSizeText(
                        S.of(context).category,
                        maxLines: 1,
                        minFontSize: 1,
                        style: txtBodySmallBold(),
                      )),
                      Tab(
                          child: AutoSizeText(
                        S.of(context).history_update,
                        maxLines: 1,
                        minFontSize: 1,
                        style: txtBodySmallBold(),
                      )),
                      Tab(
                          child: AutoSizeText(
                        S.of(context).history_approve,
                        maxLines: 1,
                        minFontSize: 1,
                        style: txtBodySmallBold(),
                      )),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CategoryTab(data: arg),
                  HistoryUpdateTab(),
                  HistoryApproveTab(),
                ],
              ),
            )
          ],
        ),
        Positioned(
            bottom: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  PrimaryButton(
                    width: dvWidth(context) - 24,
                    text: S.of(context).confirm,
                  ),
                  vpad(12),
                  PrimaryButton(
                    buttonType: ButtonType.secondary,
                    secondaryBackgroundColor: secondaryColorBase,
                    width: dvWidth(context) - 24,
                    text: S.of(context).rely,
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
