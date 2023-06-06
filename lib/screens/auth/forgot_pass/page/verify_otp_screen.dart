import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/screens/auth/forgot_pass/prv/forgot_pass_prv.dart';

import '../../../../constant/constants.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/primary_button.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  void initState() {
    widget.ctx.read<ForgotPassPrv>().second = 30;
    widget.ctx.read<ForgotPassPrv>().startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectOption = context.watch<ForgotPassPrv>().selectedOption;
    var phone = context.watch<ForgotPassPrv>().phone;
    var email = context.watch<ForgotPassPrv>().email;

    return ListView(
      children: [
        vpad(24),
        Center(
          child: Text(
            S.of(context).code_verify,
            style: txtDisplaySmall(),
          ),
        ),
        vpad(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Text(
                S.of(context).otp_msg,
                style: txtMedium(14, grayScaleColor2),
                textAlign: TextAlign.center,
              ),
              vpad(24),
              Text(
                S.of(context).we_send_to(
                      (selectOption == 1 ? phone : email) ?? "",
                    ),
                style: txtMedium(14, grayScaleColor2),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        vpad(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: PinCodeTextField(
            // key: context.read<ForgotPassPrv>().pinkey,
            autoDisposeControllers: false,
            controller: widget.ctx.read<ForgotPassPrv>().otpController,
            appContext: widget.ctx,
            length: 6,
            onTap: () {},
            onChanged: (v) {
              widget.ctx.read<ForgotPassPrv>().offTextError();
            },
            autoFocus: true,
            animationType: AnimationType.fade,
            cursorColor: grayScaleColor1,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              selectedColor: primaryColorBase,
              selectedFillColor: Colors.white,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 48,
              fieldWidth: 48,
              inactiveColor: grayScaleColor5,
              activeFillColor: Colors.white,
              activeColor: Colors.white,
              inactiveFillColor: Colors.white,
            ),
            errorAnimationController:
                widget.ctx.read<ForgotPassPrv>().errorAnimationController,
            enableActiveFill: true,
            animationDuration: const Duration(milliseconds: 300),
          ),
        ),
        vpad(14),
        if (context.watch<ForgotPassPrv>().otpValidate != null)
          Center(
            child: Text(
              S.of(context).otp_invalid,
              style: txtMedium(14, redColorBase),
            ),
          ),
        vpad(14),
        StreamBuilder<int>(
          initialData: 30,
          stream: context.read<ForgotPassPrv>().timeResendController.stream,
          builder: (context, snapshot) {
            var second = snapshot.data ?? 30;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    S.of(context).not_get_otp,
                    style: txtMedium(14, grayScaleColor2),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                hpad(12),
                context.watch<ForgotPassPrv>().isResending
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : GestureDetector(
                        onTap: () async {
                          if (second <= 0) {
                            await context.read<ForgotPassPrv>().resend(context);
                          }
                        },
                        child: Text(
                          S.of(context).resend,
                          style: txtLinkSmall(
                            color: (second <= 0 ||
                                    context.watch<ForgotPassPrv>().isResending)
                                ? primaryColorBase
                                : primaryColor4,
                          ),
                        ),
                      ),
                hpad(8),
                if (second > 0)
                  Text(
                    "(${second}s)",
                    style: txtMedium(14, grayScaleColor2),
                  ),
              ],
            );
          },
        ),
        vpad(32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PrimaryButton(
            isLoading: context.watch<ForgotPassPrv>().isLoading,
            text: S.of(context).next,
            onTap: context.watch<ForgotPassPrv>().isLoading
                ? () {}
                : () {
                    context.read<ForgotPassPrv>().onStep4Next(context);
                  },
          ),
        ),
        vpad(32),
      ],
    );
  }
}
