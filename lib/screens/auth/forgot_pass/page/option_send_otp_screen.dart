import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/screens/auth/forgot_pass/prv/forgot_pass_prv.dart';

import '../../../../constant/constants.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/primary_button.dart';

class OptionSendOtpScreen extends StatelessWidget {
  const OptionSendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectOption = context.watch<ForgotPassPrv>().selectedOption;
    var phone = context.watch<ForgotPassPrv>().phone;
    var email = context.watch<ForgotPassPrv>().email;
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(0),
          children: [
            vpad(24),
            Center(
              child: Text(
                S.of(context).reset_pass,
                style: txtDisplayMedium(),
              ),
            ),
            vpad(50),
            Text(
              S.of(context).send_otp_to,
              style: txtBodySmallRegular(color: grayScaleColorBase),
              textAlign: TextAlign.center,
            ),
            vpad(45),
            Text(
              (selectOption == 1 ? phone : email) ?? "",
              style: txtBodySmallRegular(color: grayScaleColorBase),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PrimaryButton(
              width: dvWidth(context) - 48,
              text: S.of(context).next,
              isLoading: context.read<ForgotPassPrv>().isLoading2,
              onTap: context.read<ForgotPassPrv>().isLoading2
                  ? null
                  : () {
                      context.read<ForgotPassPrv>().onStep3Next(context);
                    },
            ),
          ),
        )
      ],
    );
  }
}
