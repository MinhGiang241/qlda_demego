import 'package:bloc/bloc.dart';
import 'package:qlda_demego/bloc/asset/asset_list_action.dart';

import 'asset_list_state.dart';

class AssetListBloc {
  AssetListBloc();

  on<LoadAssetListAction>(event, emit) async {
    //start loaing
    emit(AssetListState(isLoading: true, assetList: []));
  }
}
