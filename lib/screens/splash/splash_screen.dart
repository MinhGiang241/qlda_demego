import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';

import '../../generated/l10n.dart';
import '../../widgets/primary_button.dart';
import '../auth/sign_in/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: const BoxDecoration(gradient: gradientBackground),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Center(
                    child: SizedBox(
                      height: dvHeight(context) * 1.2,
                      width: dvWidth(context) * 1.2,
                      child: Image.asset(AppImage.splashBackground,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: MediaQuery.of(context).padding.top + 60,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Image.asset(AppImage.qltnLogo,
                              width: dvWidth(context) / 4),
                          vpad(16),
                          Text.rich(TextSpan(children: [
                            TextSpan(text: "DEME", style: txtBold(24)),
                            TextSpan(
                                text: "GO", style: txtBold(24, yellowColor1)),
                          ])),
                          const SizedBox(height: 4),
                          Text.rich(TextSpan(
                              text: S.of(context).building_management,
                              style: txtBold(14, grayScaleColor2))),
                          const SizedBox(height: 4),
                          Text.rich(TextSpan(
                              text: S.of(context).operation,
                              style: txtBold(12, grayScaleColor2, 0.67))),
                          Image.asset(AppImage.illustration,
                              width: dvWidth(context) * 0.8),
                          vpad(24),
                          SizedBox(
                            height: 150,
                            child: AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              switchInCurve: Curves.easeOutBack,
                              switchOutCurve: Curves.elasticIn,
                              transitionBuilder: (child, animation) => Center(
                                child: SlideTransition(
                                  position: animation.drive(Tween<Offset>(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero)),
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                ),
                              ),
                              child: PrimaryButton(
                                  text: S.of(context).start,
                                  width: dvWidth(context) * 0.7,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SignInScreen.routeName);
                                  }),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
