// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:qlda_demego/screens/technique/prv/electric_prv.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../models/apartment.dart';
import '../../utils/utils.dart';
import '../../widgets/primary_error_widget.dart';
import '../../widgets/primary_icon.dart';
import '../../widgets/primary_loading.dart';

class ElectricScreen extends StatefulWidget {
  const ElectricScreen({super.key});
  static const routeName = '/electric';

  @override
  State<ElectricScreen> createState() => _ElectricScreenState();
}

class _ElectricScreenState extends State<ElectricScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###,###');
    return ChangeNotifierProvider(
      create: (context) => ElectricPrv(),
      builder: (context, state) {
        return PrimaryScreen(
          appBar: PrimaryAppbar(
            title: "Chỉ số điện",
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: FutureBuilder(
            future: context.read<ElectricPrv>().getApartments(context),
            builder: (context, snapshot) {
              List<Apartment> apartments =
                  context.watch<ElectricPrv>().apartments;
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
                              final y = context.read<ElectricPrv>().year;
                              final m = context.read<ElectricPrv>().month;
                              await context
                                  .read<ElectricPrv>()
                                  .pickDate(
                                    context,
                                  )
                                  .then((v) {
                                if (context.read<ElectricPrv>().year != y ||
                                    context.read<ElectricPrv>().month != m) {
                                  setState(() {});
                                }
                              });
                            },
                            suffixIcon: const PrimaryIcon(
                              icons: PrimaryIcons.calendar,
                            ),
                            controller:
                                context.read<ElectricPrv>().dateController,
                            // validateString: context.watch<ElectricPrv>().validateDate,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Chưa chốt",
                              style: txtBold(14, orangeColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    vpad(12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Đã nhập 14/300 căn", style: txtBold(14)),
                    ),
                    Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: false,
                        onRefresh: () {
                          setState(() {});
                          _refreshController.refreshCompleted();
                        },
                        controller: _refreshController,
                        header: WaterDropMaterialHeader(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onLoading: () {
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
                                              .read<ElectricPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(e.code ?? ''),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<ElectricPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(e.electrical_code ?? ""),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<ElectricPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(
                                          formatter.format(
                                            e.e?.electricity_head ?? 0,
                                          ),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<ElectricPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(
                                          formatter.format(
                                            e.e?.electricity_last ?? 0,
                                          ),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {
                                          context
                                              .read<ElectricPrv>()
                                              .tabRow(context, e);
                                        },
                                        child: Text(
                                          formatter.format(
                                            e.e?.electricity_consumption ?? 0,
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
