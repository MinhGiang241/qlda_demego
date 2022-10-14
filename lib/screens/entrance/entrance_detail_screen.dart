import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widgets/float_button.dart';
import '../../widgets/primary_screen.dart';

class EntranceDetailsScreen extends StatelessWidget {
  const EntranceDetailsScreen({super.key});
  static const routeName = '/entrance/detail';

  @override
  Widget build(BuildContext context) {
    var floatButtons = [
      DialChildren(
        label: S.of(context).transfer,
        icon: Icons.send,
        primary: secondaryColorBase,
        onPress: () {},
      ),
      DialChildren(
        label: S.of(context).edit,
        icon: Icons.edit_note,
        primary: yellowColor,
        onPress: () {},
      ),
    ];
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).entrance_detail),
      floatingActionButton: FloatDialButton(data: floatButtons),
    );
  }
}
