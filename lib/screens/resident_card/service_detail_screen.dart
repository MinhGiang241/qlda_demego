import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/utils/convert_date_time.dart';
import 'package:qlda_demego/utils/dialog.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/Info_table.dart';
import '../../widgets/primary_screen.dart';
import 'extend_service_screen.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});
  static const routeName = '/resident-card/service-details';

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  TextEditingController activateDateController = TextEditingController();
  TextEditingController overDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    activateDateController.text = arg['Ngày kích hoạt'];
    overDateController.text = arg['Ngày hết hạn'];
    return PrimaryScreen(
      appBar: PrimaryAppbar(
        title: S.of(context).service_detail,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            vpad(12),
            PrimaryTextField(
              label: S.of(context).service,
              initialValue: arg['Dịch vụ'],
            ),
            vpad(12),
            PrimaryTextField(
              label: S.of(context).status,
              initialValue: arg['Trạng thái'],
            ),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    // initialValue: arg['Ngày kích hoạt'],
                    controller: activateDateController,
                    suffixIcon: const Icon(Icons.calendar_month),
                    label: S.of(context).activate_date,
                    enable: false,
                    onTap: () async {
                      var valueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

                      if (valueDate != null) {
                        activateDateController.text =
                            valueDate.toIso8601String().formatDateTimeDMY();
                      }
                    },
                  ),
                ),
                hpad(35),
                Expanded(
                  child: PrimaryTextField(
                    // initialValue: arg['Ngày hết hạn'],
                    controller: overDateController,
                    suffixIcon: const Icon(Icons.calendar_month),
                    label: S.of(context).over_date,
                    enable: false,
                    onTap: () async {
                      var valueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10, 1, 1),
                        lastDate: DateTime(DateTime.now().year + 10, 1, 1),
                      );

                      if (valueDate != null) {
                        overDateController.text =
                            valueDate.toIso8601String().formatDateTimeDMY();
                      }
                    },
                  ),
                ),
              ],
            ),
            vpad(12),
            Text(
              S.of(context).history_ext,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            ...arg["Lịch sử gia hạn"].map((e) => InfoTable(data: e)),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: S.of(context).extend,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ExtendServiceScreen.routeName,
                      arguments: arg,
                    );
                  },
                )
              ],
            ),
            vpad(12),
            Text(
              S.of(context).history_update,
              style: txtBodySmallRegular(color: primaryColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            ...arg["Lịch sử cập nhật"].map(
              (e) => InfoTable(
                data: e,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
