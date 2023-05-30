import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constants.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/primary_button.dart';
import '../../../../widgets/primary_screen.dart';
import '../prv/forgot_pass_prv.dart';

class SelectOtpScreen extends StatelessWidget {
  SelectOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ForgotPassPrv>().getPhoneAndEmailByAccount(context),
      builder: (context, builder) {
        var _selectedOption = context.watch<ForgotPassPrv>().selectedOption;
        var phone = context.watch<ForgotPassPrv>().phone;
        var email = context.watch<ForgotPassPrv>().email;
        var onChange = context.read<ForgotPassPrv>().onChnageSelectionOtp;
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
                vpad(20),
                Text(
                  S.of(context).way_send_otp,
                  style: txtBodySmallRegular(color: grayScaleColorBase),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                vpad(42),
                if (phone != null)
                  RadioListTile<int>(
                    title: Text(
                      '${S.of(context).send_to_phone}: $phone',
                      style: txtBodySmallRegular(color: grayScaleColorBase),
                    ),
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      onChange(value!);
                    },
                  ),
                if (email != null)
                  RadioListTile<int>(
                    title: Text(
                      '${S.of(context).send_to_email}: $email',
                      style: txtBodySmallRegular(color: grayScaleColorBase),
                    ),
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      onChange(value!);
                    },
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
                  onTap: () {
                    context.read<ForgotPassPrv>().onStep2Next(context);
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
