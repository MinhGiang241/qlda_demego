import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qlda_demego/services/api/api_indicator.dart';
import 'package:qlda_demego/services/api/api_services.dart';
import 'package:qlda_demego/services/api/prf_data.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBacground,
    ),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: true,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBacground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("INDICATOR");
  var indicatorBox = Hive.box('INDICATOR');
  var listIndiDataKey = indicatorBox.keys.toList();
  var listIndiData = indicatorBox.values.toList();
  Timer.periodic(const Duration(seconds: 60), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        service.setForegroundNotificationInfo(
          title: "ALERT",
          content: "Đang gửi dữ liệu lên server",
        );
      }
    }

    // Perform some operation on  background which is not noticeable to the used everytime
    print('background service  running');
    service.invoke('update');

    // Send data
    print(listIndiDataKey);
    print(listIndiData);
    if (listIndiData.isEmpty) {
      service.stopSelf();
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        for (var i in listIndiData) {
          var a = json.decode(i);
          await APIIndicator.saveOfflineIndicatorData(
            a['electric'],
            a["water"],
            a["baseUrl"],
          ).then((v) async {
            await PrfData.shared.deleteIndicator(listIndiDataKey);
            service.stopSelf();
          });
        }
      }
    }
  });
}
