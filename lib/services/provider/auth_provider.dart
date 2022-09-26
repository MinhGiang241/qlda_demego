// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:qlda_demego/screens/auth/sign_in/sign_in_screen.dart';
import 'package:qlda_demego/screens/home/home_screen.dart';
import 'package:qlda_demego/services/api/api_auth.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../utils/utils.dart';
import '../../widgets/primary_button.dart';
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
        onError: (e) {
          if (e.code == 1) {
            Utils.showDialog(
                context: context,
                dailog: PrimaryDialog.error(msg: S.of(context).wrong_sign_in));
          } else if (e.code == 2) {
            Utils.showDialog(
                context: context,
                dailog: PrimaryDialog.error(msg: S.of(context).err_conn));
          } else {
            Utils.showDialog(
                context: context,
                dailog: PrimaryDialog.error(msg: S.of(context).err_unknown));
          }
        });
    if (credentials != null) {
      authStatus = AuthStatus.auth;
      // Utils.showDialog(context: context, dailog: const PrimaryDialog.success());
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (Route route) => false);
    }

    isLoading = false;
    notifyListeners();
    return credentials;
  }

  Future<void> onSignOut(BuildContext context) async {
    Utils.showDialog(
        context: context,
        dailog: PrimaryDialog.custom(
          title: S.of(context).sign_out,
          content: Column(
            children: [
              Text(S.of(context).sign_out_msg),
              vpad(16),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: S.of(context).sign_out,
                      buttonSize: ButtonSize.medium,
                      isFit: true,
                      buttonType: ButtonType.secondary,
                      secondaryBackgroundColor: redColor2,
                      onTap: () {
                        Navigator.pop(context, true);
                        authStatus = AuthStatus.unauthen;
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName);
                      },
                    ),
                  ),
                  hpad(24),
                  Expanded(
                    child: PrimaryButton(
                      text: S.of(context).cancel,
                      buttonSize: ButtonSize.medium,
                      buttonType: ButtonType.secondary,
                      secondaryBackgroundColor: primaryColor4,
                      textColor: primaryColorBase,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
