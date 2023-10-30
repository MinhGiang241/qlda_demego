import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/services/api/api_services.dart';
import 'package:qlda_demego/utils/sqlflite.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import 'prv/offline_tech_prv.dart';

class OfflineTechScreen extends StatelessWidget {
  const OfflineTechScreen({super.key});
  static const routeName = '/offline_tech';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OfflineTechPrv(context: context),
      builder: (context, _) {
        var apartmentList = context.watch<OfflineTechPrv>().apartmentList;
        return PrimaryScreen(
          drawer: MainDrawer(),
          appBar: const PrimaryAppbar(title: "Dữ liệu offline"),
          body: SafeArea(
            child: Column(
              children: [
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    context.read<OfflineTechPrv>().openSQLDatabase();
                  },
                  text: "open database",
                ),
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    context.read<OfflineTechPrv>().getApartmentList(context);
                  },
                  text: "lấy dữ liệu căn hộ",
                ),
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    context.read<OfflineTechPrv>().getAllApartmentFromSQL();
                  },
                  text: "in ra dữ liệu căn hộ",
                ),
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    context.read<OfflineTechPrv>().deleteTable();
                  },
                  text: "xoá dữ liệu căn hộ",
                ),
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    context.read<OfflineTechPrv>().dropTable();
                  },
                  text: "drop dữ liệu căn hộ",
                ),
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () {
                    context.read<OfflineTechPrv>().findSQLDatabase();
                  },
                  text: "tìm dữ liệu căn hộ",
                ),
                PrimaryButton(
                  buttonSize: ButtonSize.small,
                  onTap: () async {
                    var a = await SqlfliteServices.shared
                        .findAllIndicatorWithCodeAndMonthWithFilter(
                      2023,
                      10,
                      10,
                      0,
                      ApiService.shared.regCode,
                      "CH",
                    );
                    var b = a[0];
                    var c = b['code'];
                    print(c);
                  },
                  text: "tìm dữ liệu căn hộ",
                ),
                ...apartmentList.map(
                  (e) => Text(
                      '${e.id}, ${e.code}, ${e.electrical_code}, ${e.water_code} '),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
