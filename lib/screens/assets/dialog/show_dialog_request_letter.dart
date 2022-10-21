import 'package:flutter/material.dart';
import 'package:qlda_demego/widgets/primary_button.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_dropdown.dart';

var addRequestAsset = (BuildContext context) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      useBackground: true,
      title: null, //S.of(context).add_request_asset,
      content: SingleChildScrollView(
        child: Column(
          // scrollDirection: Axis.vertical,
          children: [
            Text(
              S.of(context).add_request_asset,
              style: txtBodySmallBold(color: blueColor),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            PrimaryDropDown(
              label: S.of(context).asset_in_stock,
            ),
            vpad(12),
            Text(
              S.of(context).requesting_purchase_asset,
              style: txtBodySmallBold(color: blueColor),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            Row(
              children: [
                Flexible(
                  child: PrimaryDropDown(
                    label: S.of(context).name,
                    isRequired: true,
                  ),
                ),
                hpad(20),
                Flexible(
                  child: PrimaryDropDown(
                    label: S.of(context).asset_code,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Flexible(
                  child: PrimaryDropDown(
                    label: S.of(context).type,
                    isRequired: true,
                  ),
                ),
                hpad(20),
                Flexible(
                  child: PrimaryDropDown(
                    label: S.of(context).group,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(12),
            Row(
              children: [
                Flexible(
                  child: PrimaryDropDown(
                    label: S.of(context).unit,
                    isRequired: true,
                  ),
                ),
                hpad(20),
                Flexible(
                  child: PrimaryDropDown(
                    label: S.of(context).amount,
                    isRequired: true,
                  ),
                ),
              ],
            ),
            vpad(20),
            SizedBox(
              width: double.infinity,
              child: Text(
                "IMG_001",
                textAlign: TextAlign.left,
                style: txtBodyMediumBold(),
              ),
            ),
            vpad(12),
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
                  style: txtBodySmallRegular(
                    color: grayScaleColorBase,
                  ),
                )
              ],
            ),
            vpad(12),
            PrimaryButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              isFit: true,
              text: S.of(context).update,
              buttonSize: ButtonSize.medium,
            )
          ],
        ),
      ),
    ),
  );
};

var addSupplier = (BuildContext context) {
  Utils.showDialog(
    context: context,
    dialog: PrimaryDialog.custom(
      title: null,
      useBackground: true,
      content: Column(
        children: [
          Text(
            S.of(context).add_supplier,
            style: txtBodySmallBold(color: blueColor),
            textAlign: TextAlign.center,
          ),
          vpad(12),
          PrimaryDropDown(
            label: S.of(context).add_supplier,
          ),
          vpad(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).add,
                buttonSize: ButtonSize.medium,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).cancel,
                buttonType: ButtonType.secondary,
                secondaryBackgroundColor: redColor2,
                buttonSize: ButtonSize.medium,
              )
            ],
          )
        ],
      ),
    ),
  );
};
