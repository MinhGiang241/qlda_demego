import 'package:flutter/cupertino.dart';
import 'package:qlda_demego/services/api/api_auth.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import '../../generated/l10n.dart';
import '../../util/utils.dart';
import '../../widgets/primary_dialog.dart';
import '../api/api_services.dart';

enum AuthStatus { unknown, auth, unauthen }

class AuthProvider with ChangeNotifier {
  AuthStatus authStatus = AuthStatus.unknown;
  bool isLoading = false;

  Future<void> start() async {
    await ApiService.shared.getExistClient().then((cre) async {
      if (cre != null) {
        if (cre.credentials.isExpired) {
          authStatus = AuthStatus.unauthen;
          await ApiService.shared.refresh(cre);
        }
        authStatus = AuthStatus.auth;
      } else {
        authStatus = AuthStatus.unauthen;
      }
      notifyListeners();
    });
  }

  Future<oauth2.Client?> onSignIn(
      BuildContext context, String username, String password) async {
    var credentials = await ApiAuth.signIn(
        username: username,
        password: password,
        onError: () async {
          Utils.showDialog(
              context: context,
              dailog: PrimaryDialog.error(msg: S.of(context).wrong_sign_in));
          isLoading = false;
        });
    isLoading = false;
    notifyListeners();
    return credentials;
  }
}
