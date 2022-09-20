import 'package:flutter/material.dart';

import '../constant/constants.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key, this.appBar, this.body});
  final PreferredSizeWidget? appBar;
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          extendBodyBehindAppBar: true,
          appBar: appBar,
          body: body,
        ));
  }
}
