import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constant/constants.dart';
import '../generated/l10n.dart';

class PrimaryTabBar extends StatelessWidget {
  PrimaryTabBar({
    super.key,
    required this.titles,
    this.controller,
    this.isScrollable = false,
  });
  final List<String> titles;
  final TabController? controller;
  bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: TabBar(
          isScrollable: isScrollable,
          labelStyle: txtBodySmallBold(),
          labelColor: grayScaleColorBase,
          controller: controller,
          tabs: titles
              .map(
                (e) => Tab(
                  child: AutoSizeText(e,
                      maxLines: 2, minFontSize: 1, style: txtBodySmallBold()),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
