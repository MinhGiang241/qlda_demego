// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/screens/technique/prv/technique_prv.dart';
import 'package:qlda_demego/widgets/main_drawer.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_card.dart';
import 'package:qlda_demego/widgets/primary_icon.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import 'electric_screen.dart';
import 'water_screen.dart';

class TechnicalSceen extends StatelessWidget {
  const TechnicalSceen({super.key});
  static const routeName = '/technique';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TechniquePrv(),
      builder: (context, state) {
        return PrimaryScreen(
          appBar: const PrimaryAppbar(
            title: "Kỹ thuật",
          ),
          drawer: MainDrawer(),
          body: FutureBuilder(
            future: () {}(),
            builder: (context, state) {
              return ListView(
                children: [
                  vpad(10),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ElectricScreen.routeName,
                            );
                          },
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              const PrimaryIcon(
                                icons: PrimaryIcons.electricity,
                              ),
                              hpad(5),
                              const Text("Chốt điện"),
                            ],
                          ),
                        ),
                      ),
                      hpad(10),
                      Expanded(
                        child: PrimaryCard(
                          onTap: () {
                            Navigator.pushNamed(context, WaterScreen.routeName);
                          },
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              const PrimaryIcon(
                                icons: PrimaryIcons.water,
                              ),
                              hpad(5),
                              const Text("Chốt nước"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  vpad(20),
                  Text(
                    "Việc cần làm",
                    style: txtBold(14),
                  ),
                  vpad(5),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                    },
                    textBaseline: TextBaseline.ideographic,
                    defaultVerticalAlignment:
                        TableCellVerticalAlignment.baseline,
                    border: TableBorder(
                      horizontalInside: BorderSide(),
                      verticalInside: BorderSide(),
                      top: BorderSide(),
                      bottom: BorderSide(),
                      right: BorderSide(),
                      left: BorderSide(),
                    ),
                    children: [
                      TableRow(
                        children: [
                          Text('Tên việc (job title)'),
                          Text('Hạn cuối'),
                          Text('Địa điểm'),
                          Text('Tình trạng'),
                        ],
                      ),
                    ],
                  ),
                  // PrimaryButton(
                  //   text: "foreground",
                  //   onTap: () {
                  //     FlutterBackgroundService().invoke('setAsForeground');
                  //   },
                  // ),
                  // PrimaryButton(
                  //   text: "background",
                  //   onTap: () async {
                  //     final service = FlutterBackgroundService();
                  //     bool isRunning = await service.isRunning();
                  //     if (isRunning) {
                  //       service.invoke("stopService");
                  //     } else {
                  //       service.startService();
                  //     }
                  //   },
                  // ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
