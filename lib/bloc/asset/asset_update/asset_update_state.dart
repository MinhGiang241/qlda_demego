import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/models/asset_model.dart';
import 'package:qlda_demego/utils/error_handler.dart';

enum UpdateStateType { init, loading, submit, networkError }

class AssetUpdateState {
  AssetUpdateState({
    this.amountController,
    this.type,
    this.typeController,
    this.id,
    this.code,
    this.nameController,
    this.unitController,
    this.supplierController,
    this.branchController,
    this.manageController,
    this.unitList,
    this.suplierList,
    this.assetTypeList,
  });
  UpdateStateType? type;
  bool isLoading = false;
  bool isInit = false;
  String? typeController;
  String? id;
  String? code;
  String? createdTime;
  TextEditingController? amountController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  String? unitController;
  String? supplierController;
  TextEditingController? branchController = TextEditingController();
  String? manageController;
  ErrorHandle? errorHandle;

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
    initCreatedTime,
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
        createdTime = initCreatedTime,
        isLoading = false,
        isInit = false,
        unitList = loadedUnitList,
        suplierList = loadedUnitListSuplierList,
        assetTypeList = loadedAssetTypeList,
        typeController = initType,
        unitController = initUnit,
        manageController = initManage,
        supplierController = initSuply {
    amountController!.text = initAmount.toString();
    branchController!.text = initBranch ?? '';
    nameController!.text = initName ?? '';
  }

  AssetUpdateState.initLoadingError(e)
      : type = UpdateStateType.networkError,
        isInit = false,
        isLoading = false,
        errorHandle = e;

  AssetUpdateState.submit()
      : type = UpdateStateType.submit,
        isLoading = false,
        isInit = false,
        unitList = [],
        suplierList = [],
        assetTypeList = [];
}
