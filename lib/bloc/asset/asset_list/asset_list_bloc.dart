import 'package:bloc/bloc.dart';
import 'package:qlda_demego/bloc/asset/asset_list/asset_list_action.dart';

import '../../../models/asset_model.dart';
import '../../../services/api/api_asset.dart';
import '../../../utils/error_handler.dart';
import 'asset_list_state.dart';
import '../../../utils/convert_date_time.dart';

class AssetListBloc extends Bloc<LoadAssetListAction, AssetListState> {
  AssetListBloc() : super(AssetListState.empty()) {
    // on<LoadAssetListAction>((event, emit) => null);
    on<LoadAssetListAction>((event, emit) async {
      //start loaing
      emit(AssetListState(init: false, isLoading: true, assetList: []));

      final data = await ApiAsset.getAssetList();
      if (data['status'] == "internet_error") {
        emit(
          AssetListState(
            init: false,
            isLoading: false,
            assetList: [],
            errorHandle: ErrorHandle(type: ErrorType.networkError),
          ),
        );
      } else {
        if (data['query_Assets_dto']['code'] != 0) {
          emit(
            AssetListState(
              init: false,
              isLoading: false,
              assetList: [],
              errorHandle:
                  ErrorHandle(msg: data['query_Assets_dto']['message']),
            ),
          );
        } else {
          List<Asset> listAssets = [];
          data['query_Assets_dto']["data"].forEach((e) {
            listAssets.add(Asset.fromJson(e));
          });

          emit(
            AssetListState(
              init: false,
              isLoading: false,
              assetList: listAssets,
            ),
          );
        }
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
