import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_icon.dart';

import '../constant/constants.dart';
import '../generated/l10n.dart';

enum DialogType { success, error, custom }

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      this.title = '',
      this.msg,
      this.code,
      this.content,
      this.type = DialogType.custom});

  final String? title;
  final String? msg;
  final int? code;
  final Widget? content;
  final DialogType type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        elevation: 0,
        insetAnimationCurve: Curves.bounceInOut,
        insetPadding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            border: Border.all(color: Colors.white54, width: 0.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  vpad(24),
                  if (type != DialogType.custom)
                    PrimaryIcon(
                      icons: type == DialogType.success
                          ? PrimaryIcons.check
                          : PrimaryIcons.error,
                      color: Colors.white,
                      style: PrimaryIconStyle.gradient,
                      gradients: type == DialogType.success
                          ? PrimaryIconGradient.green
                          : PrimaryIconGradient.red,
                      size: 32,
                      padding: const EdgeInsets.all(12),
                    ),
                  if (type != DialogType.custom) vpad(16),
                  Text(_title(), style: txtDisplayMedium()),
                  vpad(16),
                  if (type != DialogType.custom)
                    code == null
                        ? Text(msg ?? "",
                            style: txtBodySmallRegular(),
                            textAlign: TextAlign.center)
                        : Text(errorCodeToString(context, code),
                            style: txtBodySmallRegular(),
                            textAlign: TextAlign.center),
                  if (type != DialogType.custom) vpad(20),
                  if (type != DialogType.custom)
                    PrimaryButton(
                      text: S.of(context).close,
                      buttonSize: ButtonSize.medium,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  if (content != null) content!,
                  vpad(24),
                ]),
          ),
        ),
      ),
    );
  }

  _title() {
    switch (type) {
      case DialogType.success:
        return S.current.success;
      case DialogType.error:
        return S.current.failure;
      default:
        return title;
    }
  }

  String errorCodeToString(BuildContext context, int? code) {
    switch (code) {
      case 1:
        return S.of(context).reg_success;
      case 2:
        return S.of(context).missing;
      case 3:
        return S.of(context).not_match;
      case 4:
        return S.of(context).val_pass;
      case 5:
        return S.of(context).account_existed;
      case 7:
        return S.of(context).account_not_avaiable;
      case 8:
        return S.of(context).invalid_code;
      case 9:
        return S.of(context).systeme_error;
      default:
        return "[Code : $code]";
    }
  }
}

class PrimaryDialog extends CustomDialog {
  const PrimaryDialog.success({Key? key, String? msg})
      : super(type: DialogType.success, msg: msg, key: key);
  const PrimaryDialog.error({Key? key, String? msg})
      : super(type: DialogType.error, msg: msg, key: key);
  const PrimaryDialog.errorCode({Key? key, int? code})
      : super(type: DialogType.error, code: code, key: key);
  const PrimaryDialog.custom({Key? key, required String title, Widget? content})
      : super(
          type: DialogType.custom,
          key: key,
          title: title,
          content: content,
        );
}
