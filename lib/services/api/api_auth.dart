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

var SENDOTPVIAEMAIL = '''
mutation (\$mailTo: String) {
  response :authorization_generate_otp(mailTo: \$mailTo){
    code
    message
    data
    }
  }
''';

var VERYFYOTP = '''
mutation (\$otp:String,\$sendTo:String){
        response: authorization_veryfyOTP (otp: \$otp,sendTo: \$sendTo ) {
            code
            message
            data
        }
    }
''';

var RESETPASS = '''
mutation (\$userName:String,\$newPassword:String){
    response: authorization_reset (userName: \$userName,newPassword: \$newPassword ) {
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

  static Future sendOtpviaEmail(String email) async {
    return await shared.callApi(SENDOTPVIAEMAIL, {
      'mailTo': email,
    });
  }

  static Future verifyOTP(String otp, String email) async {
    return await shared.callApi(VERYFYOTP, {"otp": otp, "sendTo": email});
  }

  static Future resetPass(String acc, String newPassword) async {
    return await shared
        .callApi(RESETPASS, {"userName": acc, "newPassword": newPassword});
  }
}
