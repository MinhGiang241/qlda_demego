import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qlda_demego/screens/auth/sign_in/sign_in_screen.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';

import '../../../../constant/constants.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/primary_screen.dart';
import '../../../../widgets/primary_text_field.dart';
import '../prv/forgot_pass_prv.dart';

class EnterUserScreen extends StatelessWidget {
  EnterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return

        // PrimaryScreen(
        //   appBar: AppBar(
        //     backgroundColor: Colors.transparent,
        //     leading: BackButton(
        //       onPressed: () => Navigator.pushReplacementNamed(
        //         context,
        //         SignInScreen.routeName,
        //       ),
        //     ),
        //   ),
        //   body:

        SafeArea(
      child: Form(
        onChanged: context.watch<ForgotPassPrv>().autoValidStep1
            ? () => context.read<ForgotPassPrv>().validate1(context)
            : null,
        autovalidateMode: context.watch<ForgotPassPrv>().autoValidStep1
            ? AutovalidateMode.onUserInteraction
            : null,
        key: context.read<ForgotPassPrv>().formKey1,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(S.of(context).forgot_pass, style: txtDisplaySmall()),
            ),
            Positioned(
              top: 80,
              child: SizedBox(
                width: dvWidth(context) - 24,
                child: PrimaryTextField(
                  isRequired: true,
                  isShow: false,
                  label: S.of(context).username,
                  hint: S.of(context).enter_employee_code,
                  controller: context.read<ForgotPassPrv>().userController,
                  validateString:
                      context.watch<ForgotPassPrv>().validateUsername,
                  validator: Utils.emptyValidator,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: PrimaryButton(
                isLoading: context.watch<ForgotPassPrv>().isLoading,
                onTap: () => context.read<ForgotPassPrv>().onStep1Next(context),
                width: dvWidth(context) - 24,
                text: S.of(context).next,
              ),
            )
          ],
        ),
      ),
    );
    // );
  }
}
