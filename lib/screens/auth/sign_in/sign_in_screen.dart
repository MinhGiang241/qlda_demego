import 'package:flutter/material.dart';
import 'package:qlda_demego/screens/splash/splash_screen.dart';
import 'package:qlda_demego/services/provider/sign_in_provider.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:provider/provider.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_text_field.dart';
import '../forgot_pass/forgot_pass_screen.dart';
import 'auth_prv.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            SplashScreen.routeName,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: context.read<SignInProvider>().formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView(
              children: [
                Center(
                  child: Text(S.of(context).wellcome_back,
                      style: txtDisplaySmall()),
                ),
                vpad(30),
                PrimaryTextField(
                  blockSpace: true,
                  margin: EdgeInsets.zero,
                  validateString:
                      context.read<SignInProvider>().usernameValidate,
                  controller: context.read<SignInProvider>().usernameController,
                  label: S.of(context).username,
                  hint: S.of(context).enter_here,
                  isRequired: true,
                  validator: (v) {
                    return context.read<SignInProvider>().validationAccount();
                  },
                ),
                vpad(24),
                PrimaryTextField(
                  blockSpace: true,
                  margin: EdgeInsets.zero,
                  validateString: context.read<SignInProvider>().passValidate,
                  controller: context.read<SignInProvider>().passController,
                  obscureText: true,
                  label: S.of(context).password,
                  hint: S.of(context).enter_here,
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
                          SizedBox(
                            width: 22.0,
                            height: 22.0,
                            child: Checkbox(
                              fillColor:
                                  MaterialStateProperty.all(primaryColorBase),
                              value: context.watch<SignInProvider>().remember,
                              onChanged: (_) {
                                context.read<SignInProvider>().toggleRemember();
                              },
                            ),
                          ),
                          hpad(5),
                          InkWell(
                            onTap: () {
                              context.read<SignInProvider>().toggleRemember();
                            },
                            child: Text(
                              S.of(context).remember_acc,
                              style: txtLinkXSmall(color: primaryColorBase),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(
                          context,
                          ForgotPassScreen.routeName,
                        );
                        // Utils.showDialog(
                        //   context: context,
                        //   dialog: PrimaryDialog.custom(
                        //     title: S.of(context).forgot_pass,
                        //     content: Column(
                        //       children: [
                        //         Text(
                        //           S.of(context).contact_receptionist,
                        //           textAlign: TextAlign.center,
                        //           style: txtRegular(14, grayScaleColorBase),
                        //         ),
                        //         vpad(27),
                        //         PrimaryButton(
                        //           text: S.of(context).close,
                        //           onTap: () {
                        //             Navigator.pop(context);
                        //           },
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                      child: Text(
                        "${S.of(context).forgot_pass}?",
                        style: txtLinkXSmall(color: primaryColorBase),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //       height: 23,
                //       width: 23,
                //       child: Row(
                //         children: [
                //           Checkbox(
                //             value: rememberAccount,
                //             onChanged: (_) {
                //               setState(() {
                //                 rememberAccount = !rememberAccount;
                //               });
                //             },
                //           ),
                //           Text(
                //             S.of(context).remember_acc,
                //             style: txtBodySmallRegular(
                //                 color: grayScaleColorBase),
                //           )
                //         ],
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () async {
                //         await Utils.showDialog(
                //           context: context,
                //           dialog: PrimaryDialog.custom(
                //             title: S.of(context).forgot_pass,
                //             content: Column(
                //               children: [
                //                 Text(
                //                   S.of(context).contact_receptionist,
                //                   textAlign: TextAlign.center,
                //                   style: txtRegular(14, grayScaleColorBase),
                //                 ),
                //                 vpad(27),
                //                 PrimaryButton(
                //                   text: S.of(context).close,
                //                   onTap: () {
                //                     Navigator.pop(context);
                //                   },
                //                 )
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //       borderRadius: BorderRadius.circular(5),
                //       child: Text(
                //         S.of(context).forgot_pass,
                //         style: txtLinkSmall(color: primaryColorBase),
                //       ),
                //     )
                //   ],
                // ),
                vpad(32),
                PrimaryButton(
                  onTap: () async {
                    FocusScope.of(context).unfocus();

                    await context.read<SignInProvider>().signIn(
                        context, context.read<SignInProvider>().remember);
                    setState(() {});
                  },
                  text: S.of(context).sign_in,
                  isLoading: context.watch<SignInProvider>().isLoading,
                  width: double.infinity,
                ),
                // vpad(32),
                // Text(
                //   S.of(context).no_acc,
                //   style: txtRegular(12, grayScaleColor2, .78),
                // ),
                // vpad(5),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 6),
                //   child: Text(
                //     S.of(context).contact_receptionist,
                //     textAlign: TextAlign.center,
                //     style: txtRegular(14, grayScaleColor1, .6),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
