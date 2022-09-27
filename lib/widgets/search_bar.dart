import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/constant/constants.dart';
import 'package:qlda_demego/widgets/primary_icon.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../generated/l10n.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key, this.onPress});

  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  textInputAction: TextInputAction.go,
                  margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  hint: S.of(context).search,
                  prefixIcon: InkWell(
                    onTap: () {
                      print('tabb');
                      FocusScope.of(context).unfocus();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: PrimaryIcon(
                          icons: PrimaryIcons.search_outline,
                          color: grayScaleColor2),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 32,
                          color: const Color(0xff6575A7).withOpacity(0.08),
                          offset: const Offset(0, 8))
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: IconButton(
                    onPressed: onPress,
                    icon: const Icon(
                      Icons.filter_alt,
                      size: 30,
                    )),
              )
            ],
          ),
        )),
      ],
    ));
  }
}
