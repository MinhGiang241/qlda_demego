import 'package:oauth2/oauth2.dart' as oauth2;

import 'api_services.dart';

class ApiAuth {
  static Future<oauth2.Client?> signIn(
      {required String username,
      required String password,
      bool remmenber = false,
      OnError? onError}) async {
    var client = await ApiService.shared.getClient(
      username: username,
      password: password,
      onError: onError,
      remmember: remmenber,
    );
    return client;
  }

  static Future<void> signOut({OnError? onError}) async {
    return await ApiService.shared.deleteCre();
  }
}
