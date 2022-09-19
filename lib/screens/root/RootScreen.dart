import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../splash/SplashScreen.dart';

class RootScreen extends StatelessWidget {
  static const routeName = '/';

  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
