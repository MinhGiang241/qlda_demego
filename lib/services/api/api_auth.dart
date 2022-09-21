import 'package:oauth2/oauth2.dart' as oauth2;

import 'api_services.dart';

class ApiAuth {
  static Future<oauth2.Client?> signIn(
      {required String username,
      required String password,
      OnError? onError}) async {
    await ApiService.shared
        .getClient(username: username, password: password, onError: onError);
  }

  static Future<void> signOut({OnError? onError}) async {
    return await ApiService.shared.deleteCre();
  }
}
