import 'package:flutter/cupertino.dart';

class Utils {
  static Future<T?> showDialog<T extends Object?>(
      {required BuildContext context, required Widget dailog}) {
    return showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 250),
        barrierDismissible: true,
        barrierLabel: "",
        transitionBuilder: (context, Animation<double> animation,
            Animation<double> secondaryAnimation, child) {
          final CurvedAnimation curvedAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack);

          return FadeTransition(
              opacity: curvedAnimation,
              child: ScaleTransition(scale: curvedAnimation, child: child));
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            dailog);
  }
}
