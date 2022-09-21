import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';
import 'auth_provider.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? usernameValidate;
  String? passValidate;

  final AuthProvider authPrv;
  SignInProvider({required this.authPrv});

  bool isLoading = false;

  signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      usernameValidate = passValidate = null;
      isLoading = true;
      notifyListeners();

      await authPrv
          .onSignIn(context, usernameController.text, passController.text)
          .then((value) {});
    } else {
      if (usernameController.text.isEmpty) {
        usernameValidate = S.current.can_not_empty;
      }
      if (passController.text.isEmpty) {
        passValidate = S.current.can_not_empty;
      }
      notifyListeners();
    }
  }
}
