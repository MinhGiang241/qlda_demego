import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
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
  Timer.periodic(const Duration(seconds: 30), (timer) async {
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
    var listIndiDataKey = PrfData.shared.getAllKeysIndicator();
    var listIndiData = PrfData.shared.getAllValuesIndicator();

    if (listIndiData.isEmpty) {
      service.stopSelf();
    } else {
      for (var i in listIndiData) {
        var a = json.decode(i);
        await APIIndicator.saveOfflineIndicatorData(
          a['electric'],
          a["water"],
          a["baseUrl"],
        );
      }
      await PrfData.shared.deleteIndicator(listIndiDataKey);
    }
  });
}

sendIndicationData() async {}
