import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

extension ConvertDateTime on String {
  String formatDateTimeDMY() {
    DateTime dt = DateTime.parse(this);
    // DateTime d = dt.add(Duration(hours: 7));
    return "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}";
  }

  String formatDateTimeHmDMY() {
    DateTime dt = DateTime.parse(this);
    // DateTime d = dt.add(Duration(hours: 7));
    return "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} - ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  }
}
