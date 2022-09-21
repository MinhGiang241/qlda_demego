import 'package:flutter/cupertino.dart';
import 'package:qlda_demego/services/api/api_auth.dart';

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

  Future<void> onSignIn(
      BuildContext context, String username, String password) async {
    isLoading = true;
    notifyListeners();
    await ApiAuth.signIn(
        username: username,
        password: password,
        onError: () {
          Utils.showDialog(
              context: context,
              dailog: PrimaryDialog.error(msg: S.of(context).wrong_sign_in));
        }).then((value) async {});
  }
}
