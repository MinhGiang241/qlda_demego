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
          loadedAmount: 10,
          loadedAssetTypeList: asetTypeList,
          loadedUnitList: unitList,
          loadedUnitListSuplierList: supplierList,
        ),
      );
    });
  }
}
