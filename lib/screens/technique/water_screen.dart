// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qlda_demego/screens/technique/prv/apartment_prv.dart';
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
  final formatter = NumberFormat('#,###,###');
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (context.read<ApartmentPrv>().apartments.isEmpty) {
        await context.read<WaterPrv>().getApartments(context, true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map?;
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    List<Apartment> view = context.watch<WaterPrv>().apartmentView;
    // List<Apartment> view = context.watch<WaterPrv>().apartmentView;
    var count = context.watch<WaterPrv>().count;
    var total = context.watch<WaterPrv>().total;
    var latch = context.watch<WaterPrv>().latch;
    var initLoad = context.watch<WaterPrv>().initLoading;

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
      child: PrimaryScreen(
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
                        total != 0 && latch == total ? 'Đã chốt' : "Chưa chốt",
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
                  context.read<WaterPrv>().onSearchText(context);
                },
                textInputAction: TextInputAction.go,
                controller: context.read<WaterPrv>().searchController,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<WaterPrv>().onSearchText(context);
                  },
                  icon: Icon(Icons.search),
                ),
                hint: 'Tìm kiếm theo mã căn hộ',
              ),
              vpad(12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Đã nhập $count/$total căn", style: txtBold(14)),
              ),
              if (initLoad) Expanded(child: Center(child: PrimaryLoading())),
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
                      context.read<WaterPrv>().getApartments(context, false);
                      _refreshController.loadComplete();
                    },
                    child: ListView(
                      children: [
                        vpad(12),
                        if (view.isEmpty && !initLoad)
                          Center(
                            child: PrimaryEmptyWidget(
                              icons: PrimaryIcons.water,
                              emptyText: 'Không có căn hộ nào',
                            ),
                          ),
                        if (view.isNotEmpty && !initLoad)
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
                                  TableCellVerticalAlignment.middle,
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
                                    ...genCell([
                                      Text(
                                        "Mã căn",
                                        style: txtBold(12),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Mã đồng hồ",
                                        style: txtBold(12),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Đầu kỳ",
                                        style: txtBold(12),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Cuối kỳ",
                                        style: txtBold(12),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "Tiêu thụ",
                                        style: txtBold(12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ],
                                ),
                                ...genTable(view),
                              ]),
                        vpad(60),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Iterable<TableRow> genTable(List<Apartment> apartments) {
    return apartments.asMap().entries.map(
          (e) => (TableRow(
            children: [
              ...genCell(
                color:
                    e.value.w?.isLocal == true ? grayScaleColor4 : Colors.white,
                [
                  Text(
                    e.value.code ?? '',
                  ),
                  Text(e.value.water_code ?? ""),
                  Text(
                    e.value.lw?.water_last == null
                        ? ''
                        : formatter.format(
                            e.value.lw?.water_last ?? 0,
                          ),
                  ),
                  Text(
                    e.value.w?.water_last == null
                        ? ''
                        : formatter.format(
                            e.value.w?.water_last ?? 0,
                          ),
                  ),
                  Text(
                    (e.value.lw?.water_head == null ||
                            e.value.w?.water_last == null)
                        ? ''
                        : formatter.format(
                            (e.value.w?.water_last ?? 0) -
                                (e.value.lw?.water_last ??
                                    e.value.w?.water_head ??
                                    0),
                          ),
                    style: (e.value.lw?.water_last != null &&
                            e.value.w?.water_last != null &&
                            ((e.value.w?.water_last ?? 0) -
                                        (e.value.lw?.water_last ?? 0) <
                                    0 ||
                                (e.value.w?.water_last ?? 0) -
                                        (e.value.lw?.water_last ?? 0) >=
                                    30))
                        ? txtBold(12, redColor)
                        : null,
                  ),
                ],
                onTap: () {
                  context.read<WaterPrv>().tabRow(context, e.value);
                },
              ),
            ],
          )),
        );
  }

  Iterable<TableRowInkWell> genCell(
    List<Widget> listHeader, {
    Function()? onTap,
    Color? color,
  }) {
    return listHeader.map(
      (e) => TableRowInkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          child: Container(
            color: color,
            child: Center(
              child: e,
            ),
          ),
        ),
      ),
    );
  }
}
