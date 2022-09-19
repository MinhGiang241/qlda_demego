import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constant/constants.dart';

enum ButtonType { primary, secondary, white }

enum ButtonSize { large, medium, small, xsmall }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.text,
      this.onTap,
      this.margin,
      this.secondaryBackgroundColor,
      this.textColor,
      this.buttonType,
      this.buttonSize,
      this.width,
      this.icon,
      this.isRectangle = false,
      this.isFit = false,
      this.isLoading = false});

  final String text;
  final Function? onTap;
  final EdgeInsets? margin;
  final Color? secondaryBackgroundColor;
  final Color? textColor;
  final ButtonType? buttonType;
  final ButtonSize? buttonSize;
  final double? width;
  final Widget? icon;
  final bool isRectangle;
  final bool isFit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: _backgroundColor(buttonType ?? ButtonType.primary),
        gradient: _gradientColor(buttonType ?? ButtonType.primary),
      ),
    );
  }

  Color? _backgroundColor(ButtonType type) {
    if (type != ButtonType.secondary) {
      return null;
    } else {
      return secondaryBackgroundColor ?? primaryColor5;
    }
  }

  LinearGradient? _gradientColor(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return gradientPrimary;
      case ButtonType.secondary:
        return null;
      case ButtonType.white:
        return gradientWhite;
      default:
        return gradientPrimary;
    }
  }
}
