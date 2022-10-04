import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AssetListAction {
  const AssetListAction();
}

@immutable
class LoadAssetListAction extends AssetListAction {
  const LoadAssetListAction();
}
