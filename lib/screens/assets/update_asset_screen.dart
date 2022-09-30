import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';

class UpadteAssetScreen extends StatelessWidget {
  static const routeName = '/asset/update';
  const UpadteAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).update_asset),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  vpad(12),
                  PrimaryDropDown(
                    label: S.of(context).asset_type,
                    isRequired: true,
                  ),
                  vpad(12),
                  PrimaryDropDown(
                    label: S.of(context).asset_group,
                    isRequired: true,
                  ),
                  vpad(12),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryDropDown(
                          isRequired: true,
                          label: S.of(context).unit,
                        ),
                      ),
                      hpad(20),
                      Expanded(
                        child: PrimaryTextField(
                          isRequired: true,
                          label: S.of(context).origin,
                        ),
                      )
                    ],
                  ),
                  vpad(12),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          isRequired: true,
                          label: S.of(context).branch,
                        ),
                      ),
                      hpad(20),
                      Expanded(
                        child: PrimaryDropDown(
                          isRequired: true,
                          label: S.of(context).warranty,
                        ),
                      )
                    ],
                  ),
                  vpad(12),
                  Container(
                    child: Text(
                      S.of(context).attached_photo,
                      style: txtBodyMediumBold(),
                    ),
                  ),
                  vpad(6),
                  Text(
                    "1.jpg",
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                  vpad(6),
                  Row(
                    children: [
                      IconButton(
                        color: blueColor,
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ),
                      hpad(5),
                      Text(
                        S.of(context).add_photo,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      )
                    ],
                  ),
                  vpad(12),
                  Container(
                    child: Text(
                      S.of(context).attached_photo,
                      style: txtBodyMediumBold(),
                    ),
                  ),
                  vpad(12),
                  Text(
                    "file1",
                    style: txtBodySmallRegular(color: grayScaleColorBase),
                  ),
                  vpad(6),
                  Row(
                    children: [
                      IconButton(
                        color: blueColor,
                        onPressed: () {},
                        icon: const Icon(Icons.add_box),
                      ),
                      hpad(5),
                      Text(
                        S.of(context).add_file,
                        style: txtBodySmallRegular(color: grayScaleColorBase),
                      ),
                    ],
                  ),
                  vpad(100)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Container(
              width: dvWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PrimaryButton(
                    text: S.of(context).send,
                    width: 140,
                    onTap: () {},
                    buttonSize: ButtonSize.large,
                    buttonType: ButtonType.primary,
                  ),
                  PrimaryButton(
                    text: S.of(context).cancel,
                    width: 140,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonSize: ButtonSize.large,
                    buttonType: ButtonType.secondary,
                    secondaryBackgroundColor: redColorBase.withOpacity(0.19),
                    textColor: redColorBase,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
