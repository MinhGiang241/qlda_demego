import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/screens/auth/forgot_pass/prv/forgot_pass_prv.dart';

import '../../../../generated/l10n.dart';
import '../../../../widgets/primary_button.dart';
import '../../../../widgets/primary_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: context.watch<ForgotPassPrv>().autoValidStep2
          ? () => context.read<ForgotPassPrv>().validate2(context)
          : null,
      autovalidateMode: context.watch<ForgotPassPrv>().autoValidStep2
          ? AutovalidateMode.onUserInteraction
          : null,
      key: context.read<ForgotPassPrv>().formKey2,
      child: ListView(
        // padding: const EdgeInsets.all(24),
        children: [
          vpad(24),
          Center(
            child: Text(
              S.of(context).reset_pass,
              style: txtDisplaySmall(),
            ),
          ),
          vpad(45),
          PrimaryTextField(
            blockSpace: true,
            controller: context.read<ForgotPassPrv>().newPassController,
            obscureText: true,
            isRequired: true,
            label: S.of(context).new_pass,
            hint: S.of(context).enter_pas,
            validator: (v) {
              if (v!.isEmpty) {
                return "";
              }
              return null;
            },
            validateString: context.watch<ForgotPassPrv>().validateNewPass,
          ),
          vpad(16),
          PrimaryTextField(
            blockSpace: true,
            controller: context.read<ForgotPassPrv>().cNewPassController,
            obscureText: true,
            isRequired: true,
            label: S.of(context).c_new_pass,
            hint: S.of(context).enter_pas,
            validator: (v) {
              if (v!.isEmpty) {
                return "";
              } else if (v !=
                  context.read<ForgotPassPrv>().newPassController.text) {
                return "";
              }
              return null;
            },
            validateString: context.watch<ForgotPassPrv>().validateCNewPass,
          ),
          vpad(40),
          PrimaryButton(
            isLoading: context.watch<ForgotPassPrv>().isLoading,
            onTap: context.watch<ForgotPassPrv>().isLoading
                ? () {}
                : () async {
                    await context.read<ForgotPassPrv>().resetPass(context);
                  },
            text: S.of(context).confirm,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
