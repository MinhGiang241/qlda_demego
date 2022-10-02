class AssetListState {
  AssetListState({
    required this.isLoading,
    this.assetList,
  });
  final bool isLoading;
  final List<String>? assetList;
}
