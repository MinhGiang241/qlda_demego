abstract class AssetUpdateAction {
  const AssetUpdateAction();
}

class AssetInitLoadingAction extends AssetUpdateAction {}

class AssetLoadingDataAction extends AssetUpdateAction {
  AssetLoadingDataAction({
    required this.id,
    required this.name,
    required this.code,
    required this.assetTypeId,
    required this.unitId,
    this.supplierId,
    this.manage,
    this.amount = 0,
    this.branch,
  });
  final String name;
  final String code;
  final String id;
  final String assetTypeId;
  final String unitId;
  final String? supplierId;
  final String? manage;
  final int? amount;
  final String? branch;
}

class AssetSubmitDataAction extends AssetUpdateAction {}
