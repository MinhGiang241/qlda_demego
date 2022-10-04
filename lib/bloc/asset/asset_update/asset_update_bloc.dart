import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/services/api/api_asset.dart';

import '../../../models/asset_model.dart';
import 'asset_update_action.dart';
import 'asset_update_state.dart';

class AssetUpdateBloc extends Bloc<AssetUpdateAction, AssetUpdateState> {
  AssetUpdateBloc() : super(AssetUpdateState.empty()) {
    on<AssetLoadingDataAction>((event, emit) async {
      final asetTypeData = await ApiAsset.getAssetTypeList();
      final unitData = await ApiAsset.getUnitList();
      final supplierData = await ApiAsset.getSupplierList();

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
        id: state.id,
        code: state.code,
        name: state.nameController.text,
        amount: int.parse(state.amountController.text),
        assetTypeId: state.typeController,
        supplierId: state.supplierController,
        unitId: state.unitController,
        manage: state.manageController,
      );
      var data = await ApiAsset.updateAsset(asset);
      print(data);
      emit(AssetUpdateState.submit());
    });
  }
}
