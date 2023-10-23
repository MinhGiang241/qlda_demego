// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qlda_demego/screens/technique/prv/water_prv.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_empty_widget.dart';
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
    String text = '';
    if (arg != null) {
      year = arg['year'];
      month = arg['month'];
      text = arg['search'] ?? '';
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ChangeNotifierProvider(
        create: (context) =>
            WaterPrv(context: context, year: year, month: month, text: text),
        builder: (context, state) {
          List<Apartment> apartments = context.watch<WaterPrv>().apartments;
          var count = context.watch<WaterPrv>().count;
          var total = context.watch<WaterPrv>().total;
          var latch = context.watch<WaterPrv>().latch;
          var initLoad = context.watch<WaterPrv>().initLoading;
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
            body: SafeArea(
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
                                // setState(() {});
                                context
                                    .read<WaterPrv>()
                                    .getApartments(context, true);
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
                            total != 0 && latch == total
                                ? 'Đã chốt'
                                : "Chưa chốt",
                            style: txtBold(
                              14,
                              count == total ? greenColor10 : orangeColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  vpad(12),
                  PrimaryTextField(
                    onFieldSubmitted: (_) {
                      context.read<WaterPrv>().getApartments(context, true);
                    },
                    textInputAction: TextInputAction.go,
                    controller: context.read<WaterPrv>().searchController,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        await context
                            .read<WaterPrv>()
                            .getApartments(context, true);
                      },
                      icon: Icon(Icons.search),
                    ),
                    hint: 'Tìm kiếm theo mã căn hộ',
                  ),
                  vpad(12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Đã nhập $count/$total căn", style: txtBold(14)),
                  ),
                  if (initLoad)
                    Expanded(child: Center(child: PrimaryLoading())),
                  if (!initLoad)
                    Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        onRefresh: () async {
                          await context
                              .read<WaterPrv>()
                              .getApartments(context, true);
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
                            if (apartments.isEmpty && !initLoad)
                              Center(
                                child: PrimaryEmptyWidget(
                                  icons: PrimaryIcons.water,
                                  emptyText: 'Không có căn hộ nào',
                                ),
                              ),
                            if (apartments.isNotEmpty && !initLoad)
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
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: 50,
                                          ),
                                          child: Text("Mã căn"),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: 50,
                                          ),
                                          child: Text("Mã đồng hồ"),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: 50,
                                          ),
                                          child: Text("Đầu kỳ"),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: 50,
                                          ),
                                          child: Text("cuối kỳ"),
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minHeight: 50,
                                          ),
                                          child: Text("Tiêu thụ"),
                                        ),
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
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 50,
                                            ),
                                            child: Text(e.code ?? ''),
                                          ),
                                        ),
                                        TableRowInkWell(
                                          onTap: () {
                                            context
                                                .read<WaterPrv>()
                                                .tabRow(context, e);
                                          },
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 50,
                                            ),
                                            child: Text(e.water_code ?? ""),
                                          ),
                                        ),
                                        TableRowInkWell(
                                          onTap: () {
                                            context
                                                .read<WaterPrv>()
                                                .tabRow(context, e);
                                          },
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 50,
                                            ),
                                            child: Text(
                                              formatter.format(
                                                e.lw?.water_last ?? 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableRowInkWell(
                                          onTap: () {
                                            context
                                                .read<WaterPrv>()
                                                .tabRow(context, e);
                                          },
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 50,
                                            ),
                                            child: Text(
                                              formatter.format(
                                                e.w?.water_last ?? 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableRowInkWell(
                                          onTap: () {
                                            context
                                                .read<WaterPrv>()
                                                .tabRow(context, e);
                                          },
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 50,
                                            ),
                                            child: Text(
                                              formatter.format(
                                                (e.w?.water_last ?? 0) -
                                                    (e.lw?.water_last ?? 0),
                                              ),
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
            ),
          );
        },
      ),
    );
  }
}
