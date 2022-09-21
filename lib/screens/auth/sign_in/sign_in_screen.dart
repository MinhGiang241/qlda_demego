import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/services/api/api_auth.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../util/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
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
                      obscureText: true,
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
                    vpad(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Checkbox(value: true, onChanged: (v) {}),
                              Text(
                                S.of(context).remember_acc,
                                style: txtBodySmallRegular(
                                    color: grayScaleColorBase),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Utils.showDialog(
                                context: context,
                                dailog: PrimaryDialog.custom(
                                  title: S.of(context).forgot_pass,
                                  content: Column(children: [
                                    Text(
                                      S.of(context).contact_receptionist,
                                      textAlign: TextAlign.center,
                                      style: txtRegular(14, grayScaleColorBase),
                                    ),
                                    vpad(27),
                                    PrimaryButton(
                                      text: S.of(context).close,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ]),
                                ));
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Text(
                            S.of(context).forgot_pass,
                            style: txtLinkSmall(color: primaryColorBase),
                          ),
                        )
                      ],
                    ),
                    vpad(32),
                    PrimaryButton(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          await ApiAuth.signIn(
                              username: 'admin', password: 'admin');
                        },
                        text: S.of(context).sign_in,
                        isLoading: false,
                        width: double.infinity),
                    vpad(32),
                    Text(S.of(context).no_acc,
                        style: txtRegular(12, grayScaleColor2, .78)),
                    vpad(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(S.of(context).contact_receptionist,
                          textAlign: TextAlign.center,
                          style: txtRegular(14, grayScaleColor1, .6)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
