import 'package:flutter/foundation.dart' show immutable;

@immutable
class AssetListState {
  AssetListState({
    required this.isLoading,
    required this.assetList,
  });
  final bool isLoading;
  final List<Object?> assetList;
}
