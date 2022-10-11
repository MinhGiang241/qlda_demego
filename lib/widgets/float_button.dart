import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constant/constants.dart';

class Dial extends StatelessWidget {
  Dial(
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
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
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

class DialChildren {
  DialChildren(
      {required this.label,
      this.onPress,
      this.primary,
      this.onPrimary,
      required this.icon});
  final IconData icon;
  final String label;
  final Function()? onPress;
  Color? primary;
  Color? onPrimary;
}

class FloatDialButton extends StatefulWidget {
  FloatDialButton({required this.data});

  final List<DialChildren> data;
  @override
  State<FloatDialButton> createState() => _FloatDialButtonState();
}

class _FloatDialButtonState extends State<FloatDialButton> {
  @override
  final isDialOpen = ValueNotifier(false);
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: SpeedDial(
          backgroundColor: primaryColorBase,
          overlayColor: Colors.black,
          overlayOpacity: 0.38,
          spacing: 0,
          spaceBetweenChildren: 0,
          closeManually: false,
          openCloseDial: isDialOpen,
          animatedIcon: AnimatedIcons.menu_close,
          children: widget.data
              .map((DialChildren e) => SpeedDialChild(
                    labelWidget: Dial(
                      icon: e.icon,
                      label: e.label,
                      onPress: () {
                        isDialOpen.value = false;
                        e.onPress!();
                      },
                      primary: e.primary,
                      onPrimary: e.onPrimary,
                    ),
                  ))
              .toList(),
        ));
  }
}
