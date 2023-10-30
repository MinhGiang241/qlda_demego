import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:qlda_demego/services/api/api_services.dart';
import 'package:qlda_demego/utils/sqlflite.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/apartment.dart';
import '../../../utils/utils.dart';
import '../../../widgets/choose_month_year.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';
import '../../../widgets/select_media_widget.dart';

class LocalIndicatorPrv extends ChangeNotifier {
  LocalIndicatorPrv() {
    dateController.text = '$month/$year';
    SqlfliteServices.shared.openSQLDatabase().then((_) {
      getAllApartmentFromLocal(true);
    });
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController searchConttroller = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  List<File> listImages = [];
  final formatter = NumberFormat('#,###,###');
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  List<ApartmentFromSQL> electricApartments = [];
  List<ApartmentFromSQL> waterApartments = [];
  int limit = 40;
  int skip = 0;

  Future getAllApartmentFromLocal(bool init) async {
    if (init) {
      skip = 0;
      electricApartments.clear();
      waterApartments.clear();
    } else {
      skip += limit;
    }
    await SqlfliteServices.shared
        .findAllIndicatorWithCodeAndMonthWithFilter(
      year,
      month,
      limit,
      skip,
      ApiService.shared.regCode,
      searchConttroller.text.trim(),
    )
        .then((v) {
      if (v != null) {
        for (var i in v) {
          var a = ApartmentFromSQL.fromMap(i);
          if (a.electric_last != null && a.electric_head != null) {
            electricApartments.add(a);
          }
          if (a.water_head != null && a.water_last != null) {
            waterApartments.add(a);
          }
        }
      }
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  pickDate(BuildContext context) async {
    await DatePicker.showPicker(
      context,
      onChanged: (v) {},
      onConfirm: (v) {
        year = v.year;
        month = v.month;
        dateController.text = '$month/$year';
      },
      pickerModel: CustomMonthPicker(
        minTime: DateTime(DateTime.now().year - 40, 1, 1),
        maxTime: DateTime(DateTime.now().year, 12, 31),
        currentTime: DateTime(
          year,
          month,
          1,
        ),
        custom: [1, 1, 0],
        locale: LocaleType.vi,
      ),
    );
  }

  tapRow(BuildContext context, ApartmentFromSQL e, bool isElctric) {
    startController.text = isElctric
        ? formatter.format(e.electric_head)
        : formatter.format(e.water_head);
    endController.text = isElctric
        ? formatter.format(e.electric_last)
        : formatter.format(e.water_last);
    Utils.showDialog(
      context: context,
      dialog: PrimaryDialog.custom(
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Căn ${e.code}',
                    style: txtRegular(12),
                  ),
                ),
                hpad(5),
                Expanded(
                  child: Text(
                    'Mã ${e.electrical_code}',
                    style: txtRegular(12),
                  ),
                ),
              ],
            ),
            vpad(5),
            const Divider(),
            vpad(12),
            Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    controller: startController,
                    label: 'Chỉ số đầu',
                    onlyNum: true,
                    enable: false,
                  ),
                ),
                hpad(10),
                Expanded(
                  child: PrimaryTextField(
                    controller: endController,
                    label: 'Chỉ số đầu',
                    onlyNum: true,
                    enable: false,
                  ),
                ),
              ],
            ),
            vpad(12),
            SelectMediaWidget(
              enable: false,
              images: e.offline_images_e != null
                  ? e.offline_images_e!.split(',').map((i) => File(i)).toList()
                  : [],
            ),
            vpad(18),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: S.of(context).close,
                    buttonType: ButtonType.red,
                    buttonSize: ButtonSize.medium,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                hpad(10),
                Expanded(
                  child: PrimaryButton(
                    text: S.of(context).save,
                    buttonSize: ButtonSize.medium,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
