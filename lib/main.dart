import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/routes/routes.dart';
import 'package:qlda_demego/services/provider/auth_provider.dart';
import 'constant/theme.dart';
import 'generated/l10n.dart';
import 'screens/ho/prv/ho_account_service_prv.dart';
import 'screens/technique/prv/apartment_prv.dart';
import 'screens/technique/prv/electric_prv.dart';
import 'screens/technique/prv/water_prv.dart';
import 'services/api/prf_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
    debug:
        true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl:
        true, // option: set to false to disable working with http links (default: false)
  );

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  //await initializeService();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  await Hive.initFlutter();
  await PrfData.open();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;

    assert(() {
      inDebug = true;
      return true;
    }());
    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error\n${details.exception}',
        style: const TextStyle(
          color: Colors.orangeAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoutes _appRouter = AppRoutes();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HOAccountServicePrv(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider()..start(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApartmentPrv(context: context),
        ),
        ChangeNotifierProvider(
          create: (context) => ElectricPrv(context: context),
        ),
        ChangeNotifierProvider(
          create: (context) => WaterPrv(context: context),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.2);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'DEMEPRO',
        theme: AppTheme.lightTheme(),
        onGenerateRoute: _appRouter.onGenerateRoute,
        locale: const Locale.fromSubtags(languageCode: 'vi'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
