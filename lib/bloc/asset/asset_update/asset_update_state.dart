import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/models/asset_model.dart';

class AssetUpdateState {
  bool isLoading = false;
  bool isInit = false;
  TextEditingController typeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController manageController = TextEditingController();

  int amount;
  List<Unit>? unitList;
  List<Supplier>? suplierList;
  List<AssetType>? assetTypeList;

  AssetUpdateState.empty()
      : isLoading = true,
        isInit = true,
        amount = 0,
        unitList = [],
        suplierList = [],
        assetTypeList = [];

  AssetUpdateState.loaded({
    loadedAmount,
    loadedUnitList,
    loadedUnitListSuplierList,
    loadedAssetTypeList,
  })  : isLoading = false,
        isInit = false,
        amount = loadedAmount,
        unitList = loadedUnitList,
        suplierList = loadedUnitListSuplierList,
        assetTypeList = loadedAssetTypeList;
}
