import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class WaterPrv extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  DateTime? date;

  pickDate(BuildContext context) async {
    await Utils.showDatePickers(
      context,
      initDate: date ?? DateTime.now(),
      startDate: DateTime(DateTime.now().year - 10, 1, 1),
      endDate: DateTime(DateTime.now().year + 10, 1, 1),
    ).then((v) {
      if (v != null) {
        dateController.text = Utils.dateFormat(v.toIso8601String(), 0);
        date = v;
      }
    });
  }

  tabRow(BuildContext context) {
    Utils.showSuccessMessage(context: context, e: 'hello');
  }
}
