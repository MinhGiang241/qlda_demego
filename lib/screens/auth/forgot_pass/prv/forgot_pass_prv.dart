import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qlda_demego/services/api/api_auth.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/utils.dart';
import '../../sign_in/sign_in_screen.dart';

class ForgotPassPrv extends ChangeNotifier {
  final PageController controller = PageController();
  int activeStep = 0;
  int selectedOption = 1;
  bool autoValidStep1 = false;
  bool autoValidStep2 = false;
  bool isLoading = false;
  bool isBlockScroll = true;
  String? phone;
  String? email;

  StreamController<ErrorAnimationType> errorAnimationController =
      StreamController.broadcast();
  StreamController<int> timeResendController = StreamController.broadcast();
  bool isResending = false;
  int second = 30;

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final pinkey = GlobalKey();
  TextEditingController userController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController cNewPassController = TextEditingController();
  String? validateUsername;
  String? otpValidate;
  String? validateNewPass;
  String? validateCNewPass;
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

  validate2(BuildContext context) {
    if (formKey2.currentState!.validate()) {
      clearValidStringStep2();
    } else {
      genValidStep2();
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

  genValidStep2() {
    if (newPassController.text.trim().isEmpty) {
      validateNewPass = S.current.can_not_empty;
    } else {
      validateUsername = null;
    }
    if (cNewPassController.text.trim().isEmpty) {
      validateCNewPass = S.current.can_not_empty;
    } else if (newPassController.text.trim() !=
        cNewPassController.text.trim()) {
      validateCNewPass = S.current.password_not_match;
    } else {
      validateCNewPass = null;
    }
    notifyListeners();
  }

  clearValidStringStep1() {
    validateUsername = null;
    notifyListeners();
  }

  clearValidStringStep2() {
    validateNewPass = null;
    validateCNewPass = null;
    notifyListeners();
  }

  next() async {
    isBlockScroll = false;
    notifyListeners();
    await controller
        .animateToPage(
      ++activeStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.bounceInOut,
    )
        .then((v) {
      isBlockScroll = true;
      notifyListeners();
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

      await ApiAuth.checkExistAccount(userController.text.trim()).then((v) {
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

  Future getPhoneAndEmailByAccount(BuildContext context) async {
    return ApiAuth.getPhoneAndEmail(userController.text.trim()).then((v) {
      phone = v['phone'];
      email = v['email'];
    }).catchError((e) {
      Utils.showErrorMessage(context, e);
    });
  }

  onChnageSelectionOtp(int v) {
    selectedOption = v;
    notifyListeners();
  }

  onStep2Next(BuildContext context) {
    FocusScope.of(context).unfocus();
    next();
  }

  onStep3Next(BuildContext context) async {
    FocusScope.of(context).unfocus();
    isLoading = true;
    notifyListeners();
    if (selectedOption == 2) {
      await ApiAuth.sendOtpviaEmail(email!).then((v) {
        isLoading = false;
        notifyListeners();
        next();
      }).catchError((e) {
        isLoading = false;
        notifyListeners();
        Utils.showErrorMessage(context, e);
      });
    }
  }

  onStep4Next(BuildContext context) async {
    FocusScope.of(context).unfocus();
    isLoading = true;
    notifyListeners();
    await ApiAuth.verifyOTP(otpController.text.trim(), email!).then((v) {
      isLoading = false;
      notifyListeners();
      next();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      Utils.showErrorMessage(context, e);
    });
  }

  offTextError() {
    otpValidate = null;
    notifyListeners();
  }

  resend(BuildContext context) async {
    isResending = true;
    isLoading = true;
    notifyListeners();
    await ApiAuth.verifyOTP(otpController.text.trim(), email!).then((v) {
      next();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
      Utils.showErrorMessage(context, e);
    });
    //   email,
    //   false,
    //   context.read<ResidentInfoPrv>().userInfo?.account?.id ?? "",
    // ).then((v) {
    //   Utils.showSuccessMessage(context: context, e: S.of(context).success_opt);
    //   isSendLoading = false;

    //   second = 30;
    //   notifyListeners();
    //   _startTimer();
    // }).catchError((e) {
    //   isSendLoading = false;
    //   notifyListeners();
    //   Utils.showErrorMessage(context, e);
    // });
  }

  resetPass(BuildContext context) async {
    FocusScope.of(context).unfocus();
    autoValidStep2 = true;
    isLoading = true;
    notifyListeners();
    if (formKey2.currentState!.validate()) {
      ApiAuth.resetPass(
        userController.text.trim(),
        newPassController.text.trim(),
      ).then((v) {
        isLoading = false;
        notifyListeners();
        Utils.showSuccessMessage(
          context: context,
          e: S.of(context).success_change_pass,
          onClose: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SignInScreen.routeName,
              (route) => route.isFirst,
            );
          },
        );
      }).catchError((e) {
        Utils.showErrorMessage(context, e);
        isLoading = false;
        notifyListeners();
      });
    } else {
      isLoading = false;
      genValidStep2();
    }
  }
}
