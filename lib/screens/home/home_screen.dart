import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';

import '../../widgets/main_drawer.dart';
import '../../widgets/primary_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        title: "Welcome",
      ),
      drawer: MainDrawer(),
      body: Center(
        child:
            Text("Welcome", style: txtBodyLargeBold(color: grayScaleColorBase)),
      ),
    );
  }
}
