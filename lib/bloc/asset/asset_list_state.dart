import 'package:qlda_demego/utils/error_handler.dart';

import '../../models/asset_model.dart';

abstract class AssetState {
  bool? isLoading;
  List<Object?>? assetList;
  ErrorHandle? errorHandle;
}

class AssetListState extends AssetState {
  AssetListState({
    required this.isLoading,
    this.init = false,
    required this.assetList,
    this.errorHandle,
  });
  final bool isLoading;
  final bool? init;
  final List<Asset> assetList;
  final ErrorHandle? errorHandle;

  AssetListState.empty()
      : isLoading = true,
        init = true,
        assetList = [],
        errorHandle = null;
}
