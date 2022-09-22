import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';
import '../../constant/regex_text.dart';
import 'auth_provider.dart';

enum TypeValid { account, password }

class SignInProvider with ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? usernameValidate;
  String? passValidate;

  final AuthProvider authPrv;
  SignInProvider({required this.authPrv});

  bool isLoading = false;

  validationAccount() {
    if (usernameController.text.isEmpty) {
      usernameValidate = S.current.can_not_empty;
      return '';
    }
    usernameValidate = null;
    notifyListeners();
    return null;
  }

  validationPass() {
// remove later
    if (usernameController.text == 'admin' && passController.text == 'admin') {
      return null;
    }

    if (passController.text.isEmpty) {
      passValidate = S.current.can_not_empty;
      return '';
    } else if (!RegexText.minMaxString(
        value: passController.text, min: 4, max: 20)) {
      passValidate = S.current.min_max_pass;
      return '';
    } else if (!RegexText.requiredLowerCase(passController.text)) {
      passValidate = S.current.require_lowercase;
      return '';
    } else if (!RegexText.requiredUpperCase(passController.text)) {
      passValidate = S.current.require_uppercase;
      return '';
    } else if (!RegexText.requiredNumber(passController.text)) {
      passValidate = S.current.require_number;
      return '';
    } else if (RegexText.vietNameseChar(passController.text)) {
      passValidate = S.current.not_vietnamese;
      return '';
    } else if (!RegexText.requiredSpecialChar(passController.text)) {
      passValidate = S.current.require_special_char;
      return '';
    }
    passValidate = null;

    notifyListeners();
    return null;
  }

  signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      usernameValidate = passValidate = null;
      isLoading = true;
      notifyListeners();

      await authPrv.onSignIn(
          context, usernameController.text, passController.text);

      isLoading = false;
      notifyListeners();
    } else {}
  }
}
