import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qlda_demego/screens/splash/splash_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/primary_empty_widget.dart';
import '../../widgets/primary_error_widget.dart';
import '../../widgets/primary_icon.dart';
import '../../widgets/primary_loading.dart';
import '../../widgets/primary_screen.dart';
import 'prv/ho_account_service_prv.dart';

class SelectProjectScreen extends StatefulWidget {
  const SelectProjectScreen({super.key});
  static const routeName = '/select-project';

  @override
  State<SelectProjectScreen> createState() => _SelectProjectScreenState();
}

class _SelectProjectScreenState extends State<SelectProjectScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var loading = false;

  setLogin(bool v) {
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await AutoNavigation.autoSelectProject(context, setLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: PrimaryScreen(
            appBar: AppBar(
              elevation: 0,
              leading: BackButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    SplashScreen.routeName,
                  );
                },
              ),
              // actions: [
              //   IconButton(
              //     onPressed: () {
              //       context.read<HOAccountServicePrv>().logOutHO(context);
              //     },
              //     icon: const Icon(Icons.logout),
              //   ),
              //   hpad(12),
              // ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      S.of(context).select_project,
                      style: txtDisplayMedium(),
                    ),
                  ),
                  vpad(20),
                  Expanded(
                    child: FutureBuilder(
                      future: context
                          .read<HOAccountServicePrv>()
                          .getAllProjectList(context),
                      builder: (context, snapshot) {
                        var list =
                            context.watch<HOAccountServicePrv>().tenantList;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: PrimaryLoading());
                        } else if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return PrimaryErrorWidget(
                            code: snapshot.hasError ? 'err' : '1',
                            message: snapshot.data.toString(),
                            onRetry: () async {
                              setState(() {});
                            },
                          );
                        } else if (list.isEmpty) {
                          return SafeArea(
                            child: SmartRefresher(
                              enablePullDown: true,
                              enablePullUp: false,
                              header: WaterDropMaterialHeader(
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              controller: _refreshController,
                              onRefresh: () {
                                setState(() {});
                                _refreshController.refreshCompleted();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text.rich(
                                  //   TextSpan(
                                  //     children: [
                                  //       TextSpan(
                                  //         text: 'S.of(context).if_not_resident',
                                  //         style: txtMedium(14, grayScaleColor2),
                                  //       ),
                                  //       TextSpan(
                                  //         text: "S.of(context).click_here",
                                  //         style:
                                  //             txtMedium(14, primaryColorBase),
                                  //         recognizer: TapGestureRecognizer()
                                  //           ..onTap = () {
                                  //             // Navigator.pushNamed(
                                  //             //   context,
                                  //             //   ProjectRegistrationScreen
                                  //             //       .routeName,
                                  //             // );
                                  //           },
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                  Expanded(
                                    child: PrimaryEmptyWidget(
                                      emptyText: S.of(context).no_project,
                                      icons: PrimaryIcons.home,
                                      action: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: false,
                          header: WaterDropMaterialHeader(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          controller: _refreshController,
                          onRefresh: () {
                            setState(() {});
                            _refreshController.refreshCompleted();
                          },
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              // Text.rich(
                              //   TextSpan(
                              //     children: [
                              //       TextSpan(
                              //         text: ' S.of(context).if_not_resident',
                              //         style: txtMedium(14, grayScaleColor2),
                              //       ),
                              //       TextSpan(
                              //         text: " S.of(context).click_here",
                              //         style: txtMedium(14, primaryColorBase),
                              //         recognizer: TapGestureRecognizer()
                              //           ..onTap = () {
                              //             // Navigator.pushNamed(
                              //             //   context,
                              //             //   ProjectRegistrationScreen.routeName,
                              //             // );
                              //           },
                              //       ),
                              //     ],
                              //   ),
                              //   textAlign: TextAlign.center,
                              // ),
                              // vpad(10),
                              ...list.map(
                                (e) => PrimaryCard(
                                  onTap: () async {
                                    await context
                                        .read<HOAccountServicePrv>()
                                        .navigateToProject(context, e);
                                  },
                                  margin: const EdgeInsets.only(
                                    bottom: 16,
                                    // left: 12,
                                    // right: 12,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 12,
                                  ),
                                  child: Row(
                                    children: [
                                      const PrimaryIcon(
                                        icons: PrimaryIcons.home,
                                        style: PrimaryIconStyle.gradient,
                                        gradients: PrimaryIconGradient.yellow,
                                        size: 32,
                                        padding: EdgeInsets.all(12),
                                        color: Colors.white,
                                      ),
                                      hpad(10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.p?.project_name ?? "",
                                              style: txtBold(
                                                13,
                                                grayScaleColorBase,
                                              ),
                                            ),
                                            Text(
                                              e.p?.project_location ?? "",
                                              style: txtRegular(
                                                13,
                                                grayScaleColorBase,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              vpad(20),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (loading)
          Positioned(
            child: Container(
              color: Colors.white,
              child: const Center(child: PrimaryLoading()),
            ),
          ),
      ],
    );
  }
}
