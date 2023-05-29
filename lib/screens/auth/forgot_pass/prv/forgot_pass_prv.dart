import 'package:flutter/material.dart';
import 'package:qlda_demego/services/api/api_auth.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/utils.dart';

class ForgotPassPrv extends ChangeNotifier {
  final PageController controller = PageController();
  int activeStep = 0;
  bool autoValidStep1 = false;
  bool autoValidStep2 = false;
  bool isLoading = false;
  bool isBlockScroll = true;

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  String? validateUsername;
  onPageChanged(v) {
    activeStep = v;
    notifyListeners();
  }

  validate1(BuildContext context) {
    if (formKey1.currentState!.validate()) {
      clearValidStringStep1();
    } else {
      genValidStep1();
    }

    notifyListeners();
  }

  genValidStep1() {
    if (userController.text.trim().isEmpty) {
      validateUsername = S.current.can_not_empty;
    } else {
      validateUsername = null;
    }
    notifyListeners();
  }

  clearValidStringStep1() {
    validateUsername = null;
    notifyListeners();
  }

  next() async {
    isBlockScroll = false;

    await controller
        .animateToPage(
      ++activeStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.bounceInOut,
    )
        .then((v) {
      isBlockScroll = true;
    }).catchError((e) {
      print(e);
    });
  }

  prev() {
    isBlockScroll = false;

    controller
        .animateToPage(
      --activeStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.bounceInOut,
    )
        .then((v) {
      isBlockScroll = true;
    });
  }

  onStep1Next(BuildContext context) async {
    FocusScope.of(context).unfocus();
    isLoading = true;
    autoValidStep1 = true;
    notifyListeners();
    var v = formKey1.currentState!.validate();
    if (v) {
      clearValidStringStep1();

      await ApiAuth.checkExistAccount(userController.text).then((v) {
        isLoading = false;
        notifyListeners();
        next();
      }).catchError((e) {
        Utils.showErrorMessage(context, e);
        isLoading = false;
        notifyListeners();
      });
    } else {
      isLoading = false;
      genValidStep1();
    }
  }
}
