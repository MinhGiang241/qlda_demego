import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/services/api/api_auth.dart';
import 'package:qlda_demego/services/provider/sign_in_provider.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:provider/provider.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../util/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = '/login';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberAccount = false;
  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: context.read<SignInProvider>().formKey,
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
                      validateString:
                          context.read<SignInProvider>().usernameValidate,
                      controller:
                          context.read<SignInProvider>().usernameController,
                      lable: S.of(context).username,
                      hint: S.of(context).enter_username,
                      isRequired: true,
                      validator: (v) {
                        return context
                            .read<SignInProvider>()
                            .validationAccount();
                      },
                    ),
                    vpad(24),
                    PrimaryTextField(
                      validateString:
                          context.read<SignInProvider>().passValidate,
                      controller: context.read<SignInProvider>().passController,
                      obscureText: true,
                      lable: S.of(context).password,
                      hint: S.of(context).enter_pas,
                      isRequired: true,
                      validator: (v) {
                        return context.read<SignInProvider>().validationPass();
                      },
                    ),
                    vpad(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Checkbox(
                                  value: rememberAccount,
                                  onChanged: (_) {
                                    setState(() {
                                      rememberAccount = !rememberAccount;
                                    });
                                  }),
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

                          await context.read<SignInProvider>().signIn(context);
                          setState(() {});
                        },
                        text: S.of(context).sign_in,
                        isLoading: context.watch<SignInProvider>().isLoading,
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
