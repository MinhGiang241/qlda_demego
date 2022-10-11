import 'package:flutter/material.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../screens/application/application_screen.dart';
import '../screens/assets/asset_screen.dart';
import '../screens/auth/sign_in/sign_in_screen.dart';
import '../screens/extra_task/extra_task_list_screen.dart';
import '../screens/letter/request_letter_list_screen.dart';
import '../services/provider/auth_provider.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function()? onTab) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: txtBodySmallBold(color: grayScaleColorBase),
      ),
      onTap: onTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AuthProvider()..start(),
      builder: (context, child) => Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(gradient: gradientPurple),
              child: DrawerHeader(
                // alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 4),
                child: Column(children: [
                  Text(
                    'Quản lý tòa nhà',
                    style: txtBold(18, secondaryColor5),
                  ),
                  vpad(20),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 25,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      hpad(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Trương Minh Giang",
                              textAlign: TextAlign.left,
                              style:
                                  txtBodyMediumRegular(color: secondaryColor5)),
                          Text("Vinhome Ocean Park",
                              textAlign: TextAlign.left,
                              style:
                                  txtBodySmallRegular(color: secondaryColor5)),
                          Text("Quản lý tòa nhà",
                              textAlign: TextAlign.left,
                              style:
                                  txtBodySmallRegular(color: secondaryColor5)),
                        ],
                      )
                    ],
                  )
                ]),
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  buildListTile(
                    S.of(context).application,
                    Icons.document_scanner,
                    () => Navigator.pushReplacementNamed(
                      context,
                      ApplicationScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).extr_tast,
                    Icons.list_alt,
                    () => Navigator.pushReplacementNamed(
                      context,
                      ExtraTaskListScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).period_task,
                    Icons.list_rounded,
                    () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).asset_manage,
                    Icons.money,
                    () => Navigator.pushReplacementNamed(
                      context,
                      AssetScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).req_letter_management,
                    Icons.receipt,
                    () => Navigator.pushReplacementNamed(
                      context,
                      RequestLetterListScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).parcel,
                    Icons.gif_box,
                    () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).penetration,
                    Icons.transform,
                    () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).resident_card,
                    Icons.portrait,
                    () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).verhicle_card,
                    Icons.car_rental,
                    () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  buildListTile(
                    S.of(context).customer,
                    Icons.dashboard,
                    () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  // ldalskdlasdkasl
                ],
              ),
            ),
            Stack(children: [
              Positioned(
                  child: Column(
                children: [
                  const Divider(thickness: 2),
                  buildListTile(S.of(context).sign_out, Icons.logout, () {
                    context.read<AuthProvider>().onSignOut(context);
                  }),
                ],
              )),
            ])
          ],
        ),
      ),
    );
  }
}
