import 'package:flutter/material.dart';
import 'package:qlda_demego/screens/root/RootScreen.dart';
import 'package:qlda_demego/screens/splash/splash_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RootScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RootScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
