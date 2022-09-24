import 'package:flutter/material.dart';
import '../constant/constants.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard(
      {Key? key,
      required this.child,
      this.onTap,
      this.borderRadius,
      this.height,
      this.width,
      this.margin})
      : super(key: key);
  final Widget child;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.white54, width: 0.5),
            boxShadow: [
              BoxShadow(
                  blurRadius: 32,
                  color: shadowColor.withOpacity(0.12),
                  offset: const Offset(0, 8))
            ]),
        child: Material(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            color: Colors.transparent,
            child: InkWell(
                borderRadius: borderRadius ?? BorderRadius.circular(12),
                onTap: onTap,
                child: child)),
      ),
    );
  }
}
