import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constant/constants.dart';

class FloatLabelButton extends StatelessWidget {
  FloatLabelButton(
      {super.key,
      this.onPress,
      required this.icon,
      this.primary,
      this.onPrimary,
      required this.label});
  final Function()? onPress;
  final String label;
  final IconData icon;
  Color? primary;
  Color? onPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(12, 3, 0, 3),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: txtBodyMediumBold(color: Colors.white)),
            ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),

                primary: primary, // <-- Button color
                onPrimary: onPrimary, // <-- Splash color
              ),
              child: Icon(icon, color: Colors.white),
            )
          ],
        ));
  }
}
