import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/routes/routes.dart';
import 'package:qlda_demego/services/provider/auth_provider.dart';
import 'constant/theme.dart';
import 'generated/l10n.dart';
import 'screens/auth/sign_in/auth_prv.dart';
import 'services/api/prf_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  await Hive.initFlutter();
  await PrfData.open();
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
          create: (context) => AuthProvider()..start(),
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
        title: 'DEMEGO',
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
