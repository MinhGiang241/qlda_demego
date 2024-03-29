import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../widgets/primary_screen.dart';
import '../sign_in/sign_in_screen.dart';
import 'page/enter_user_screen.dart';
import 'page/option_send_otp_screen.dart';
import 'page/reset_password_screen.dart';
import 'page/select_otp_screen.dart';
import 'page/verify_otp_screen.dart';
import 'prv/forgot_pass_prv.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});
  static const routeName = '/forgot-pass';

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPassPrv(),
      builder: (context, builder) => PrimaryScreen(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (context.read<ForgotPassPrv>().activeStep == 0) {
                Navigator.pushReplacementNamed(
                  context,
                  SignInScreen.routeName,
                );
              } else {
                context.read<ForgotPassPrv>().prev();
                context.read<ForgotPassPrv>().otpController.clear();
              }
            },
          ),
        ),
        body: SafeArea(
          child: PageView(
            physics: context.watch<ForgotPassPrv>().isBlockScroll
                ? const NeverScrollableScrollPhysics()
                : null,
            onPageChanged: context.read<ForgotPassPrv>().onPageChanged,
            controller: context.read<ForgotPassPrv>().controller,
            children: <Widget>[
              EnterUserScreen(),
              SelectOtpScreen(),
              OptionSendOtpScreen(),
              VerifyOtpScreen(
                ctx: context,
              ),
              ResetPasswordScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
