import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qlda_demego/screens/technique/prv/local_indicator_prv.dart';

import '../../../constant/constants.dart';
import '../../../models/apartment.dart';
import '../../../widgets/custom_footer.dart';

class IndicatorTab extends StatefulWidget {
  const IndicatorTab({super.key, required this.isElectric});
  final bool isElectric;

  @override
  State<IndicatorTab> createState() => _IndicatorTabState();
}

class _IndicatorTabState extends State<IndicatorTab> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    var apartments = widget.isElectric
        ? context.watch<LocalIndicatorPrv>().electricApartments
        : context.watch<LocalIndicatorPrv>().waterApartments;

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () async {
        await context.read<LocalIndicatorPrv>().getAllApartmentFromLocal(true);
        _refreshController.refreshCompleted();
        // setState(() {});
      },
      controller: _refreshController,
      header: WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footer: customFooter(),
      onLoading: () async {
        await context.read<LocalIndicatorPrv>().getAllApartmentFromLocal(false);
        _refreshController.loadComplete();
      },
      child: ListView(
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
            },
            textBaseline: TextBaseline.ideographic,
            defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
            border: const TableBorder(
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
              ...genTable(apartments, context),
            ],
          ),
        ],
      ),
    );
  }

  Iterable<TableRow> genTable(
    List<ApartmentFromSQL> apartments,
    BuildContext context,
  ) {
    return apartments.map(
      (e) => (TableRow(
        children: [
          ...genCell(
            [
              Text(e.code ?? ""),
              Text(
                widget.isElectric
                    ? e.electrical_code ?? ""
                    : e.water_code ?? "",
              ),
              Text(
                widget.isElectric
                    ? (e.electric_head != null ? '${e.electric_head}' : '')
                    : (e.water_head != null ? '${e.water_head}' : ''),
              ),
              Text(
                widget.isElectric
                    ? (e.electric_last != null ? '${e.electric_last}' : '')
                    : (e.water_last != null ? '${e.water_last}' : ''),
              ),
              Text(
                widget.isElectric
                    ? ((e.electric_head != null && e.electric_last != null)
                        ? '${e.electric_last! - e.electric_head!}'
                        : '')
                    : ((e.water_head != null && e.water_last != null)
                        ? '${e.water_last! - e.water_head!}'
                        : ''),
              ),
            ],
            onTap: () {
              context.read<LocalIndicatorPrv>().tapRow(
                    context,
                    e,
                    widget.isElectric,
                  );
            },
          ),
        ],
      )),
    );
  }

  Iterable<TableRowInkWell> genCell(
    List<Widget> listHeader, {
    Function()? onTap,
  }) {
    return listHeader.map(
      (e) => TableRowInkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          child: Center(
            child: e,
          ),
        ),
      ),
    );
  }
}
