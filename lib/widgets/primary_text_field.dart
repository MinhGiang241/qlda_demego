import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_card.dart';

import '../constant/constants.dart';
import '../generated/l10n.dart';

class PrimaryTextField extends StatelessWidget {
  PrimaryTextField({
    super.key,
    this.lable,
    this.initialValue,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.isReadOnly = false,
    this.onTap,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
    this.maxLines = 1,
    this.autoFocus = false,
    this.validateString,
  });
  final String? lable;
  final String? initialValue;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isReadOnly;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isRequired;
  final int? maxLines;
  final bool autoFocus;
  final String? validateString;
  late StreamController<bool>? showPassController = StreamController<bool>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lable != null)
          Row(
            children: [
              Text(lable!,
                  style: txtBodySmallRegular(color: grayScaleColorBase)),
              if (isRequired) hpad(4),
              if (isRequired)
                Text("*", style: txtBodySmallRegular(color: redColorBase))
            ],
          ),
        if (lable != null) vpad(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<bool>(
              initialData: false,
              stream: showPassController?.stream,
              builder: (context, snapshot) {
                final showPass = snapshot.data!;
                return PrimaryCard(
                  child: TextFormField(
                    autofocus: autoFocus,
                    controller: controller,
                    initialValue: initialValue,
                    obscureText: !showPass && obscureText,
                    readOnly: isReadOnly,
                    onTap: onTap,
                    cursorHeight: 15,
                    keyboardType: keyboardType,
                    textCapitalization: textCapitalization,
                    textInputAction: textInputAction,
                    style: txtBodySmallBold(),
                    cursorColor: primaryColor2,
                    maxLines: maxLines,
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: txtBodySmallBold(color: grayScaleColor3),
                        errorStyle: const TextStyle(fontSize: 0, height: 0),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        prefixIcon: prefixIcon,
                        suffixIcon: obscureText
                            ? showPass
                                ? IconButton(
                                    onPressed: () {
                                      showPassController?.add(false);
                                    },
                                    icon: const Icon(Icons.visibility_off))
                                : IconButton(
                                    onPressed: () {
                                      showPassController?.add(true);
                                    },
                                    icon: const Icon(Icons.visibility))
                            : suffixIcon,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: primaryColor2, width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: redColor2, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none)),
                    validator: isRequired
                        ? validator
                        : (val) {
                            if (val!.isEmpty) {
                              return S.of(context).can_not_empty;
                            }
                            return null;
                          },
                  ),
                );
              },
            ),
            if (validateString != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 4),
                child: Text(
                  validateString!,
                  style: txtRegular(13, redColorBase),
                ),
              )
          ],
        )
      ],
    );
  }
}
