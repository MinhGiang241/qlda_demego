// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/screens/technique/prv/electric_prv.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../utils/utils.dart';
import '../../widgets/primary_icon.dart';

class ElectricScreen extends StatelessWidget {
  const ElectricScreen({super.key});
  static const routeName = '/electric';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ElectricPrv(),
      builder: (context, state) {
        return PrimaryScreen(
          appBar: PrimaryAppbar(
            title: "chỉ số điện",
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: FutureBuilder(
            future: () {}(),
            builder: (context, state) {
              return ListView(
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
                          hint: "dd/mm/yyyy",
                          onTap: () async {
                            await context.read<ElectricPrv>().pickDate(context);
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
                  Text("Đã nhập 14/300 căn", style: txtBold(14)),
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
                            onTap: () {
                              context.read<ElectricPrv>().tabRow(context);
                            },
                            child: Text("Mã căn"),
                          ),
                          TableRowInkWell(
                            onTap: () {
                              context.read<ElectricPrv>().tabRow(context);
                            },
                            child: Text("Mã đồng hồ"),
                          ),
                          TableRowInkWell(
                            onTap: () {
                              context.read<ElectricPrv>().tabRow(context);
                            },
                            child: Text("Đầu kỳ"),
                          ),
                          TableRowInkWell(
                            onTap: () {
                              context.read<ElectricPrv>().tabRow(context);
                            },
                            child: Text("cuối kỳ"),
                          ),
                          TableRowInkWell(
                            onTap: () {
                              context.read<ElectricPrv>().tabRow(context);
                            },
                            child: Text("Tiêu thụ"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
