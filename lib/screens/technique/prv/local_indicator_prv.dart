import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../widgets/choose_month_year.dart';

class LocalIndicatorPrv extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  TextEditingController searchConttroller = TextEditingController();
  int year = DateTime.now().year;
  int month = DateTime.now().month;

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
}
