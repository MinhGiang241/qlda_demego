// ignore_for_file: non_constant_identifier_names

import 'package:oauth2/oauth2.dart' as oauth2;

import 'api_services.dart';

var CHECKEXISTEDACCOUNT = '''
mutation (\$username:String){
    response: authorization_mobile_n_check_existed_account (username: \$username ) {
        code
        message
        data
    }
}
        
''';

var GETPHONEANDEMAIL = '''
mutation (\$account:String){
    response: account_mobile_n_get_phone_email_by_account (account: \$account ) {
        code
        message
        data
    }
}
        
''';

class ApiAuth {
  static ApiService shared = ApiService();
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

  static Future checkExistAccount(String username) async {
    return await shared.callApi(CHECKEXISTEDACCOUNT, {"username": username});
  }

  static Future getPhoneAndEmail(String account) async {
    return await shared.callApi(GETPHONEANDEMAIL, {"account": account});
  }
}
