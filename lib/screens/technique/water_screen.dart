// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qlda_demego/screens/technique/prv/water_prv.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../constant/constants.dart';
import '../../models/apartment.dart';
import '../../utils/utils.dart';
import '../../widgets/primary_error_widget.dart';
import '../../widgets/primary_icon.dart';
import '../../widgets/primary_loading.dart';
import '../../widgets/primary_text_field.dart';
import 'technical_screen.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});
  static const routeName = '/water';

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###,###');
    final arg = ModalRoute.of(context)!.settings.arguments as Map?;
    int year = DateTime.now().year;
    int month = DateTime.now().month;

    if (arg != null) {
      year = arg['year'];
      month = arg['month'];
    }
    return ChangeNotifierProvider(
      create: (context) => WaterPrv(year: year, month: month),
      builder: (context, state) {
        return PrimaryScreen(
          appBar: PrimaryAppbar(
            title: "Chỉ số nước",
            leading: BackButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  TechnicalSceen.routeName,
                );
              },
            ),
          ),
          body: FutureBuilder(
            future: context.read<WaterPrv>().getApartments(context, true),
            builder: (context, snapshot) {
              List<Apartment> apartments = context.watch<WaterPrv>().apartments;
              var count = context.watch<WaterPrv>().count;
              var total = context.watch<WaterPrv>().total;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: PrimaryLoading());
              } else if (snapshot.connectionState == ConnectionState.none) {
                return PrimaryErrorWidget(
                  code: snapshot.hasError ? "err" : "1",
                  message: snapshot.data.toString(),
                  onRetry: () async {
                    setState(() {});
                  },
                );
              }
              return SafeArea(
                child: Column(
                  children: [
                    vpad(10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: PrimaryTextField(
                            validator: Utils.emptyValidator,
                            isRequired: true,
                            isReadOnly: true,
                            hint: "mm/yyyy",
                            onTap: () async {
                              final y = context.read<WaterPrv>().year;
                              final m = context.read<WaterPrv>().month;
                              await context
                                  .read<WaterPrv>()
                                  .pickDate(
                                    context,
                                  )
                                  .then((v) {
                                if (context.read<WaterPrv>().year != y ||
                                    context.read<WaterPrv>().month != m) {
                                  setState(() {});
                                }
                              });
                            },
                            suffixIcon: const PrimaryIcon(
                              icons: PrimaryIcons.calendar,
                            ),
                            controller: context.read<WaterPrv>().dateController,
                            // validateString: context.watch<ElectricPrv>().validateDate,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              count == total ? 'Đã chốt' : "Chưa chốt",
                              style: txtBold(14,
                                  count == total ? greenColor10 : orangeColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    vpad(12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("Đã nhập $count/$total căn", style: txtBold(14)),
                    ),
                    Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        onRefresh: () {
                          setState(() {});
                          _refreshController.refreshCompleted();
                        },
                        controller: _refreshController,
                        header: WaterDropMaterialHeader(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onLoading: () {
                          context
                              .read<WaterPrv>()
                              .getApartments(context, false);
                          _refreshController.loadComplete();
                        },
                        child: ListView(
                          children: [
                            vpad(12),
                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(1),
                                4: FlexColumnWidth(1),
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
                                    TableRowInkWell(
                                      child: Text("Mã căn"),
                                    ),
                                    TableRowInkWell(
                                      child: Text("Mã đồng hồ"),
                                    ),
                                    TableRowInkWell(
                                      child: Text("Đầu kỳ"),
                                    ),
                                    TableRowInkWell(
                                      child: Text("cuối kỳ"),
                                    ),
                                    TableRowInkWell(
                                      child: Text("Tiêu thụ"),
                                    ),
                                  ],
                                ),
                                ...apartments.map(
                                  (e) => TableRow(
                                    children: [
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<WaterPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(e.code ?? ''),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<WaterPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(e.water_code ?? ""),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<WaterPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(
                                          formatter.format(
                                            e.w?.water_head ?? 0,
                                          ),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<WaterPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(
                                          formatter.format(
                                            e.w?.water_last ?? 0,
                                          ),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<WaterPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(
                                          formatter.format(
                                            e.w?.water_consumption ?? 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            vpad(60),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
