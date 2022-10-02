import 'package:bloc/bloc.dart';
import 'package:qlda_demego/bloc/asset/asset_list_action.dart';

import '../../services/api/api_asset.dart';
import 'asset_list_state.dart';

class AssetListBloc extends Bloc<LoadAssetListAction, AssetListState> {
  AssetListBloc() : super(AssetListState(isLoading: true, assetList: [])) {
    // on<LoadAssetListAction>((event, emit) => null);
    on<LoadAssetListAction>((event, emit) async {
      //start loaing
      emit(AssetListState(isLoading: true, assetList: []));

      final listAsset = await ApiAsset.getAssetList();

      emit(
        AssetListState(isLoading: false, assetList: listAsset),
      );
    });
  }
}
