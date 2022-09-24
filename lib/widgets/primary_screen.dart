import 'package:flutter/material.dart';

import '../constant/constants.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen(
      {super.key,
      this.appBar,
      this.body,
      this.drawer,
      this.floatingActionButton});
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;
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
          drawer: drawer,
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
        ));
  }
}
