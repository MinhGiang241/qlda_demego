import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              vpad(24 + topSafePad(context) + appbarHeight(context)),
              Center(
                child: Text(S.of(context).sign_in, style: txtDisplayMedium()),
              ),
              vpad(46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    PrimaryTextField(
                      lable: S.of(context).username,
                      hint: S.of(context).enter_username,
                      isRequired: true,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),
                    vpad(24),
                    PrimaryTextField(
                      lable: S.of(context).password,
                      hint: S.of(context).enter_pas,
                      isRequired: true,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),
                    vpad(32),
                    PrimaryButton(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                        },
                        text: S.of(context).sign_in,
                        isLoading: false,
                        width: double.infinity),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: Text(
                        S.of(context).no_acc,
                        style: txtLinkSmall(color: primaryColorBase),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
