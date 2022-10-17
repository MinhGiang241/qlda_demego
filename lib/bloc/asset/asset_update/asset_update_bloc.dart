// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/services/api/api_asset.dart';

import '../../../constant/constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/asset_model.dart';
import '../../../screens/assets/asset_detail.dart';
import '../../../utils/error_handler.dart';
import '../../../utils/utils.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_dialog.dart';
import '../../../widgets/primary_icon.dart';
import 'asset_update_action.dart';
import 'asset_update_state.dart';

class AssetUpdateBloc extends Bloc<AssetUpdateAction, AssetUpdateState> {
  AssetUpdateBloc(context) : super(AssetUpdateState.empty()) {
    on<AssetLoadingDataAction>((event, emit) async {
      final asetTypeData = await ApiAsset.getAssetTypeList();
      final unitData = await ApiAsset.getUnitList();
      final supplierData = await ApiAsset.getSupplierList();

      if (asetTypeData['status'] == "internet_error" ||
          unitData['status'] == "internet_error" ||
          supplierData['status'] == "internet_error") {
        ErrorHandle e = ErrorHandle(type: ErrorType.networkError);
        emit(AssetUpdateState.initLoadingError(e));
      }

      if (asetTypeData['status'] == "error" ||
          unitData['status'] == "error" ||
          supplierData['status'] == "error") {
        var errorMessage =
            "${asetTypeData['message'] ?? ''} ,${unitData['message'] ?? ''}, ${supplierData['message'] ?? ''}";
        ErrorHandle e = ErrorHandle(msg: errorMessage);
        emit(AssetUpdateState.initLoadingError(e));
      }

      List<AssetType> asetTypeList = [];
      List<Unit> unitList = [];
      List<Supplier> supplierList = [];

      asetTypeData['query_AssetTypes_dto']['data'].forEach((e) {
        asetTypeList.add(AssetType.fromJson(e));
      });
      unitData['query_Units_dto']['data'].forEach((e) {
        unitList.add(Unit.fromJson(e));
      });
      supplierData['query_Suppliers_dto']['data'].forEach((e) {
        supplierList.add(Supplier.fromJson(e));
      });

      emit(
        AssetUpdateState.loaded(
          initCreatedTime: event.createdTime,
          assetCode: event.code,
          assetId: event.id,
          initName: event.name,
          initAmount: event.amount,
          initBranch: event.branch,
          initManage: event.manage,
          initSuply: event.supplierId,
          initType: event.assetTypeId,
          initUnit: event.unitId,
          loadedAssetTypeList: asetTypeList,
          loadedUnitList: unitList,
          loadedUnitListSuplierList: supplierList,
        ),
      );
    });

    on<AssetSubmitDataAction>((event, emit) async {
      Asset asset = Asset(
        assetType: state.assetTypeList!
            .firstWhere((AssetType el) => el.id == state.typeController),
        id: state.id,
        code: state.code,
        createdTime: state.createdTime,
        updatedTime: DateTime.now().toIso8601String(),
        name: state.nameController!.text,
        amount: int.parse(state.amountController!.text),
        assetTypeId: state.typeController,
        supplierId: state.supplierController,
        unitId: state.unitController,
        manage: state.manageController,
      );

      var data = await ApiAsset.updateAsset(asset);

      if (data['status'] == "internet_error") {
        ErrorHandle e = ErrorHandle(type: ErrorType.networkError);
        emit(AssetUpdateState.initLoadingError(e));
      }
      if (data['status'] == "error") {
        ErrorHandle e = ErrorHandle(msg: data['message']);
        emit(AssetUpdateState.initLoadingError(e));
      }

      emit(AssetUpdateState.submit());
      Utils.showDialog(
        context: context,
        dialog: PrimaryDialog.custom(
          title: S.of(context).success,
          content: Column(
            children: [
              Text(
                S.of(context).success,
                textAlign: TextAlign.center,
                style: txtRegular(14, grayScaleColorBase),
              ),
              vpad(27),
              const PrimaryIcon(
                icons: PrimaryIcons.check,
                color: Colors.white,
                style: PrimaryIconStyle.gradient,
                gradients: PrimaryIconGradient.green,
                size: 32,
                padding: EdgeInsets.all(12),
              ),
              vpad(27),
              PrimaryButton(
                text: S.of(context).back,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AssetDetailScreen.routeName,
                    arguments: {"data": asset},
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }

  get grayScaleColorBase => null;
}
