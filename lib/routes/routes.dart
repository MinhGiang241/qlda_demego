// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qlda_demego/screens/application/absent_letter.dart';
import 'package:qlda_demego/screens/application/break_time_letter.dart';
import 'package:qlda_demego/screens/application/change_shift_letter.dart';
import 'package:qlda_demego/screens/root/root_screen.dart';
import 'package:qlda_demego/screens/splash/splash_screen.dart';
import 'package:qlda_demego/services/provider/auth_provider.dart';
import 'package:qlda_demego/services/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../screens/application/application_screen.dart';
import '../screens/application/confirm_letter_screen.dart';
import '../screens/application/detail_letter_screen.dart';
import '../screens/application/reply_letter_screen.dart';
import '../screens/auth/sign_in/sign_in_screen.dart';
import '../screens/home/home_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RootScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RootScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case SignInScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => AuthProvider()..start(),
                    ),
                    ChangeNotifierProvider(
                      create: (context) =>
                          SignInProvider(authPrv: context.read<AuthProvider>()),
                    ),
                  ],
                  builder: ((context, child) => SignInScreen()),
                ));
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case ApplicationScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const ApplicationScreen());
      case AbsentLetter.routeName:
        return MaterialPageRoute(builder: ((context) => AbsentLetter()));
      case BreakTimeLetter.routeName:
        return MaterialPageRoute(builder: ((context) => BreakTimeLetter()));
      case ChangeShiftLetter.routeName:
        return MaterialPageRoute(builder: ((context) => ChangeShiftLetter()));
      case DetailLetterScreen.routeName:
        return MaterialPageRoute(
            settings: routeSetting,
            builder: ((context) => DetailLetterScreen()));
      case ReplyLetterScreen.routeName:
        return MaterialPageRoute(
            settings: routeSetting,
            builder: ((context) => ReplyLetterScreen()));
      case ConfirmLetterScreen.routeName:
        return MaterialPageRoute(
            settings: routeSetting,
            builder: ((context) => ConfirmLetterScreen()));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
