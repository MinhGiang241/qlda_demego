import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/primary_dialog.dart';

var showExistedDailog = (BuildContext context, Function() close) {
  Utils.showDialog(
      context: context, dialog: const PrimaryDialog.errorCode(code: 10));
};
