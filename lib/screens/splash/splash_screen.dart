import 'package:flutter/material.dart';
import 'package:qlda_demego/constant/constants.dart';

import '../../generated/l10n.dart';
import '../../services/api/api_services.dart';
import '../../widgets/primary_button.dart';
import '../auth/sign_in/sign_in_screen.dart';
import '../ho/select_project_screen.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
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
                  child: Image.asset(
                    AppImage.splashBackground,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: MediaQuery.of(context).padding.top + 60,
              child:
                  // SingleChildScrollView(
                  //   physics: const BouncingScrollPhysics(),
                  //   child:
                  Column(
                children: [
                  Image.asset(
                    AppImage.qltnLogo,
                    width: dvWidth(context) / 5,
                  ),
                  vpad(12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "DEME", style: txtBold(24)),
                        TextSpan(text: "GO", style: txtBold(24, yellowColor1)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text.rich(
                    TextSpan(
                      text: S.of(context).sologan,
                      style: txtBold(14, grayScaleColor2),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Text.rich(TextSpan(
                  //     text: S.of(context).operation,
                  //     style: txtBold(12, grayScaleColor2, 0.67))),
                  Image.asset(
                    AppImage.qltnLogo,
                    width: dvWidth(context) * 0.7,
                  ),
                  vpad(24),
                ],
              ),
              // ),
            ),
            Positioned(
              bottom: 20,
              child: SizedBox(
                width: dvWidth(context),
                height: 120,
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  switchInCurve: Curves.easeOutBack,
                  switchOutCurve: Curves.elasticIn,
                  transitionBuilder: (child, animation) => Center(
                    child: SlideTransition(
                      position: animation.drive(
                        Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ),
                      ),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  ),
                  child: PrimaryButton(
                    text: S.of(context).sign_in_account,
                    width: dvWidth(context) * 0.8,
                    onTap: () async {
                      // var cre = await ApiService.shared.getExistClient();

                      // if (cre != null) {
                      //   if (cre.credentials.expiration!
                      //           .compareTo(DateTime.now()) >
                      //       0) {
                      //     // ignore: use_build_context_synchronously
                      //     await Navigator.of(context).pushReplacementNamed(
                      //       HomeScreen.routeName,
                      //     );
                      //     return;
                      //   }
                      // }
                      // await ApiService.shared.deleteCre();

                      // ignore: use_build_context_synchronously
                      Navigator.of(context)
                          .pushNamed(SelectProjectScreen.routeName);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
