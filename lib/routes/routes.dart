// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qlda_demego/screens/root/root_screen.dart';
import 'package:qlda_demego/screens/splash/splash_screen.dart';
import 'package:qlda_demego/services/provider/auth_provider.dart';
import 'package:qlda_demego/services/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

import '../screens/auth/forgot_pass/forgot_pass_screen.dart';
import '../screens/auth/sign_in/sign_in_screen.dart';
import '../screens/ho/select_project_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/offline_tech/offline_tech.dart';

import '../screens/technique/electric_screen.dart';
import '../screens/technique/local_indicator_screen.dart';
import '../screens/technique/technical_screen.dart';
import '../screens/technique/water_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RootScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const RootScreen(),
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => SplashScreen(),
        );
      case SignInScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => MultiProvider(
            providers: [
              // ChangeNotifierProvider(
              //   create: (context) => AuthProvider()..start(),
              // ),
              ChangeNotifierProvider(
                create: (context) =>
                    SignInProvider(authPrv: context.read<AuthProvider>()),
              ),
            ],
            builder: ((context, child) => SignInScreen()),
          ),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (context) => HomeScreen(),
        );

      //start again
      case ForgotPassScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ForgotPassScreen()),
        );
      case SelectProjectScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => SelectProjectScreen()),
        );
      case TechnicalSceen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => TechnicalSceen()),
        );
      case WaterScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => WaterScreen()),
        );
      case ElectricScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ElectricScreen()),
        );
      case LocalIndicatorScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => LocalIndicatorScreen()),
        );
      case OfflineTechScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => OfflineTechScreen()),
        );

      default:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
