import 'package:flutter/material.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/screens/home/home_screen.dart';
import '../generated/l10n.dart';
import '../screens/technique/technical_screen.dart';
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
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 170,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(gradient: gradientPurple),
            child: DrawerHeader(
              // alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                children: [
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
                          // Text(
                          //   "Trương Minh Giang",
                          //   textAlign: TextAlign.left,
                          //   style: txtBodyMediumRegular(color: secondaryColor5),
                          // ),
                          // Text(
                          //   "Vinhome Ocean Park",
                          //   textAlign: TextAlign.left,
                          //   style: txtBodySmallRegular(color: secondaryColor5),
                          // ),
                          Text(
                            "Quản lý tòa nhà",
                            textAlign: TextAlign.left,
                            style: txtBodySmallRegular(color: secondaryColor5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                buildListTile(
                  "Trang chủ",
                  Icons.table_view,
                  () => Navigator.pushReplacementNamed(
                    context,
                    HomeScreen.routeName,
                  ),
                ),
                buildListTile(
                  "Kỹ thuật",
                  Icons.document_scanner,
                  () => Navigator.pushReplacementNamed(
                    context,
                    TechnicalSceen.routeName,
                  ),
                ),
                // buildListTile(
                //   "Dữ liệu offline",
                //   Icons.document_scanner,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     OfflineTechScreen.routeName,
                //   ),
                // ),

                // buildListTile(
                //   S.of(context).extr_tast,
                //   Icons.list_alt,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     ExtraTaskListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).period_task,
                //   Icons.list_rounded,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     PeriodTaskListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).asset_manage,
                //   Icons.money,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     AssetScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).req_letter_management,
                //   Icons.receipt,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     RequestLetterListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).missing_obj_list,
                //   Icons.dangerous,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     MissingObjectListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).parcel,
                //   Icons.gif_box,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     ParcelListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).penetration,
                //   Icons.transform,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     EntranceListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).resident_card,
                //   Icons.portrait,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     ResidentCardListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).trans_card,
                //   Icons.car_rental,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     TransportationCardList.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).customer,
                //   Icons.dashboard,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     CustomerListScreen.routeName,
                //   ),
                // ),
                // buildListTile(
                //   S.of(context).info_reception,
                //   Icons.message,
                //   () => Navigator.pushReplacementNamed(
                //     context,
                //     InformationReceptionListScreen.routeName,
                //   ),
                // ),
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    const Divider(thickness: 2),
                    buildListTile(S.of(context).sign_out, Icons.logout, () {
                      context.read<AuthProvider>().onSignOut(context);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
