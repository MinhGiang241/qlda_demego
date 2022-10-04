import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/models/asset_model.dart';

enum UpdateStateType {
  init,
  loading,
  submit,
}

class AssetUpdateState {
  UpdateStateType? type;
  bool isLoading = false;
  bool isInit = false;
  String? typeController;
  String? id;
  String? code;
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? unitController;
  String? supplierController;
  TextEditingController branchController = TextEditingController();
  String? manageController;

  List<Unit>? unitList;
  List<Supplier>? suplierList;
  List<AssetType>? assetTypeList;

  AssetUpdateState.empty()
      : isLoading = true,
        type = UpdateStateType.init,
        isInit = true,
        unitList = [],
        suplierList = [],
        assetTypeList = [];

  AssetUpdateState.loaded({
    assetCode,
    assetId,
    initName,
    initAmount,
    initBranch,
    initManage,
    initType,
    initUnit,
    initSuply,
    loadedAmount,
    loadedUnitList,
    loadedUnitListSuplierList,
    loadedAssetTypeList,
  })  : type = UpdateStateType.loading,
        id = assetId,
        code = assetCode,
        isLoading = false,
        isInit = false,
        unitList = loadedUnitList,
        suplierList = loadedUnitListSuplierList,
        assetTypeList = loadedAssetTypeList,
        typeController = initType,
        unitController = initUnit,
        manageController = initManage,
        supplierController = initSuply {
    amountController.text = initAmount.toString();
    branchController.text = initBranch ?? '';
    nameController.text = initName ?? '';
  }

  AssetUpdateState.submit()
      : type = UpdateStateType.submit,
        isLoading = false,
        isInit = false,
        unitList = [],
        suplierList = [],
        assetTypeList = [];
}
