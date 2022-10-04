import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/services/api/api_asset.dart';
import 'package:qlda_demego/widgets/primary_appbar.dart';
import 'package:qlda_demego/widgets/primary_button.dart';
import 'package:qlda_demego/widgets/primary_dropdown.dart';
import 'package:qlda_demego/widgets/primary_screen.dart';
import 'package:qlda_demego/widgets/primary_text_field.dart';

import '../../bloc/asset/asset_update/asset_update_action.dart';
import '../../bloc/asset/asset_update/asset_update_bloc.dart';
import '../../bloc/asset/asset_update/asset_update_state.dart';
import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../models/asset_model.dart';

class UpdateAssetScreen extends StatelessWidget {
  static const routeName = '/asset/update';
  const UpdateAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      appBar: PrimaryAppbar(title: S.of(context).update_asset),
      body: BlocBuilder<AssetUpdateBloc, AssetUpdateState>(
        builder: (context, state) {
          if (state.isInit == true) {
            context.read<AssetUpdateBloc>().add(AssetLoadingDataAction());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var listUnitChoices = state.unitList!.map(
              (Unit e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.displayName!, overflow: TextOverflow.ellipsis),
                );
              },
            ).toList();
            var listSupplierChoices = state.suplierList!.map(
              (Supplier e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.displayName!, overflow: TextOverflow.ellipsis),
                );
              },
            ).toList();
            var listAssetTypeChoices = state.assetTypeList!.map(
              (AssetType e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.displayName!, overflow: TextOverflow.ellipsis),
                );
              },
            ).toList();

            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SafeArea(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        vpad(12),
                        PrimaryDropDown(
                          controller: state.typeController,
                          label: S.of(context).asset_type,
                          isRequired: true,
                          selectList: listAssetTypeChoices,
                        ),
                        // vpad(12),
                        // PrimaryDropDown(
                        //   label: S.of(context).asset_group,
                        //   isRequired: true,
                        // ),
                        vpad(12),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryDropDown(
                                controller: state.unitController,
                                isRequired: true,
                                label: S.of(context).unit,
                                selectList: listUnitChoices,
                              ),
                            ),
                            hpad(20),
                            Expanded(
                              child: PrimaryDropDown(
                                isRequired: true,
                                label: S.of(context).supply,
                                selectList: listSupplierChoices,
                                controller: state.unitController,
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
                                controller: state.branchController,
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
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryTextField(
                                isRequired: true,
                                label: S.of(context).amount,
                                keyboardType: TextInputType.number,
                                controller: state.amountController,
                              ),
                            ),
                            hpad(20),
                            Expanded(
                              child: PrimaryDropDown(
                                isRequired: true,
                                label: S.of(context).manage,
                                controller: state.manageController,
                                // ignore: prefer_const_literals_to_create_immutables
                                selectList: [
                                  const DropdownMenuItem(
                                    value: "AMOUNT",
                                    child: Text('Theo số lượng'),
                                  ),
                                  const DropdownMenuItem(
                                    value: "SERIAL",
                                    child: Text('Theo số Serial'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        vpad(12),
                        Text(
                          S.of(context).attached_photo,
                          style: txtBodyMediumBold(),
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
                              style: txtBodySmallRegular(
                                  color: grayScaleColorBase),
                            )
                          ],
                        ),
                        vpad(12),
                        Text(
                          S.of(context).attached_photo,
                          style: txtBodyMediumBold(),
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
                              style: txtBodySmallRegular(
                                color: grayScaleColorBase,
                              ),
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
                          onTap: () {
                            // print(state.amountController.value);
                            print(state.manageController.value);
                            print(state.typeController.value);
                            // print(state.branchController.value);
                            print(state.unitController.value);
                            print(state.supplierController.value);
                          },
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
                          secondaryBackgroundColor:
                              redColorBase.withOpacity(0.19),
                          textColor: redColorBase,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
