import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qlda_demego/screens/home/home_screen.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/ho_model.dart';
import '../../../services/api/api_ho_account.dart';
import '../../../services/api/api_ho_services.dart';
import '../../../services/api/api_services.dart';
import '../../../services/api/prf_data.dart';
import '../../../services/provider/auth_provider.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../auth/sign_in/sign_in_screen.dart';

class HOAccountServicePrv extends ChangeNotifier {
  HOAccountServicePrv();
  AuthStatus authStatus = AuthStatus.unauthen;
  String? access_token;
  DateTime? expireDate;
  List<Project> projectList = [];
  List<TenantRegistration> tenantList = [];
  List<RegistrationProjectList> registrationProjectList = [];
  List<ResidentResitration> registrationList = [];
  var isLoginLoading = false;
  var isSelectProjectLoading = false;
  var isSignupLoading = false;
  var isAutoLoginLoading = true;

  onSetAutoLoginLoading(bool value) {
    isAutoLoginLoading = value;
    notifyListeners();
  }

  // navigateToHomeScreen(BuildContext context, ResponseResidentOwn e) async {
  //   context.read<AuthPrv>().authStatus = AuthStatus.auth;

  //   Navigator.of(context).pushNamedAndRemoveUntil(
  //     HomeScreen.routeName,
  //     (route) => route.isCurrent,
  //   );
  // }

  navigateToProject(
    BuildContext context,
    TenantRegistration e,
  ) async {
    try {
      isSelectProjectLoading = true;
      notifyListeners();
      ApiService.shared.setAPI(
        e.d?.apiEndpoint ?? "",
        ApiHOService.shared.access_token,
        ApiHOService.shared.expireDate,
        e.code,
        e.d?.tokenEndpoint,
        e.code,
        e.d?.apiEndpoint,
        e.p?.domain,
      );
      await ApiService.shared.deleteCre();

      PrfData.shared.setProjectInStore(e);
      // var a = await APITower.mobileMe();
      //
      // print(a);
      // if (a != null) {
      // var userHO = UserAccountHO.fromMap(a);
      // await firebase.push_device(userHO.user?.userName ?? "");
      // await context.read<ResidentInfoPrv>().setUserInfoFromHO(userHO);
      // }

      // await context.read<ResidentInfoPrv>().setListOwn(context);
      // ignore: unused_local_variable
      // var residentId = context.read<ResidentInfoPrv>().residentId;
      // if (context.read<ResidentInfoPrv>().listOwn.isEmpty) {
      //   Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     HomeScreen.routeName,
      //     (route) => route.isCurrent,
      //   );
      // } else {
      //   Navigator.of(context).pushNamed(
      //     ApartmentSeletionScreen.routeName,
      //     arguments: {
      //       "project": e.project?.project_name,
      //       "not-auto": true,
      //     },
      //   );
      // }
      isSelectProjectLoading = false;
      notifyListeners();
      Navigator.pushNamed(
        context,
        SignInScreen.routeName,
      );
    } catch (e) {
      isSelectProjectLoading = false;
      notifyListeners();
      Utils.showErrorMessage(context, e.toString());
    }

    // await AuthPrv()
    //     .onSignIn(context, '0969881567', '1234');

    // Navigator.of(context).pushNamed(
    //   ApartmentSeletionScreen.routeName,
    //   arguments: e.project_name,
    // );
  }

  Future logOutHO(BuildContext context) async {
    Utils.showDialog(
      context: context,
      dialog: PrimaryDialog.custom(
        title: S.of(context).sign_out,
        content: Column(
          children: [
            Text(S.of(context).sign_out_msg),
            vpad(16),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: S.of(context).sign_out,
                    buttonSize: ButtonSize.small,
                    isFit: true,
                    buttonType: ButtonType.secondary,
                    secondaryBackgroundColor: redColor2,
                    onTap: () async {
                      ApiService.shared.clearToken();
                      Utils.pop(context, true);
                      // PrfData.shared.deleteApartment();
                      authStatus = AuthStatus.unauthen;
                      access_token = null;
                      expireDate = null;
                      // context.read<ResidentInfoPrv>().clearData();
                      await PrfData.shared.setAuthState(logOut);
                      await PrfData.shared.deleteProject();
                      notifyListeners();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        SignInScreen.routeName,
                        ((route) => route.isCurrent),
                      );
                    },
                  ),
                ),
                hpad(24),
                Expanded(
                  child: PrimaryButton(
                    isFit: true,
                    text: S.of(context).cancel,
                    buttonSize: ButtonSize.small,
                    buttonType: ButtonType.secondary,
                    secondaryBackgroundColor: primaryColor3,
                    textColor: Colors.white,
                    onTap: () {
                      Utils.pop(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future createAccount(
    String phone,
    String password,
    String email,
    String fullName,
    BuildContext context,
  ) async {
    isSignupLoading = true;
    notifyListeners();

    await APIHOAccount.createAccount(phone, password, email, fullName)
        .then((v) {
      isSignupLoading = false;
      notifyListeners();
      Utils.showSuccessMessage(
        context: context,
        e: S.of(context).success_sign_up,
        onClose: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInScreen.routeName,
            ((route) => route.isCurrent),
          );
        },
      );
    }).catchError((e) {
      isSignupLoading = false;
      notifyListeners();
      Utils.showErrorMessage(context, e);
    });
  }

  Future loginHO(
    String userName,
    String password,
    BuildContext context,
    bool remember,
  ) async {
    isLoginLoading = true;
    notifyListeners();
    await APIHOAccount.loginHO(userName, password).then((v) async {
      if (remember) {
        await PrfData.shared.setSignInStore(
          userName,
          password,
        );
        await PrfData.shared.setAuthState(logIn);
      } else {
        await PrfData.shared.deteleSignInStore();
      }
      isLoginLoading = false;
      notifyListeners();

      Navigator.pushNamed(
        context,
        HomeScreen.routeName,
        arguments: {
          "not-auto": true,
        },
      );
    }).catchError((e) {
      isLoginLoading = false;
      notifyListeners();
      if ((e as DioError).response?.statusCode == 401) {
        Utils.showErrorMessage(context, S.of(context).incorrect_usn_pass);
      } else {
        Utils.showErrorMessage(context, e.error.toString());
      }
    });
  }

  Future getAllProjectList(BuildContext context) async {
    await APIHOAccount.getAllProjects().then((v) {
      if (v != null) {
        tenantList.clear();
        for (var i in v) {
          tenantList.add(TenantRegistration.fromMap(i));
        }
      }
    });
  }

  Future getProjectList(BuildContext context) async {
    await APIHOAccount.getProjectListApi().then((v) {
      if (v != null) {
        registrationProjectList.clear();
        for (var i in v) {
          var pj = RegistrationProjectList.fromMap(i);

          registrationProjectList.add(pj);
        }
      }
      notifyListeners();
    }).catchError((e) {
      Utils.showErrorMessage(context, e);
    });

    return;
  }

  Future getRegisterList(BuildContext context) async {
    await APIHOAccount.getProjectListNotApprovedRegistrationApi().then((v) {
      if (v != null) {
        registrationList.clear();
        for (var i in v) {
          var resReg = ResidentResitration.fromMap(i);

          registrationList.add(resReg);
        }
      }
      print(projectList);
      notifyListeners();
    }).catchError((e) {
      Utils.showErrorMessage(context, e);
    });

    return;
  }
}
