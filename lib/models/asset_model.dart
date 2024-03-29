// ignore_for_file: prefer_collection_literals, unnecessary_null_in_if_null_operators, curly_braces_in_flow_control_structures

class Asset {
  Asset({
    this.id,
    this.apartments,
    this.assetTypeId,
    this.code,
    this.buildings,
    this.name,
    this.supplierId,
    this.unitId,
    this.manage,
    this.amount,
    this.createdTime,
    this.updatedTime,
    this.assetType,
  });
  String? id;
  String? code;
  String? displayName;
  String? name;
  String? createdTime;
  String? updatedTime;
  String? supplierId;
  String? manage;
  String? describe;
  String? inventory;
  String? assetTypeId;
  String? unitId;
  String? tenantId;
  int? amount;
  Supplier? supplier;
  Unit? unit;

  AssetType? assetType;
  List<Floor>? floors;
  List<Building>? buildings;
  List<Apartments>? apartments;

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    code = json['code'];
    displayName = json['display_name'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    name = json['name'];
    supplierId = json['supplierId'];
    assetTypeId = json['assetTypeId'];
    unitId = json['unitId'];
    tenantId = json['tenantId'];
    manage = json['manage'];
    describe = json['describe'];
    inventory = json['inventory'];
    amount = json['amount'];
    supplier = Supplier.fromJson(json['ref_supplierId_SupplierDto']);
    unit = Unit.fromJson(json['ref_unitId_UnitDto']);
    assetType = AssetType.fromJson(json['ref_assetTypeId_AssetTypeDto']);
    floors = [];
    buildings = [];
    apartments = [];
    if (json['ref_FloorAssets_assetIdDto'] != null)
      json['ref_FloorAssets_assetIdDto'].forEach((e) {
        floors!.add(Floor.fromJson(e));
      });
    if (json['ref_BuildingAssets_assetIdDto'] != null)
      json['ref_BuildingAssets_assetIdDto'].forEach((e) {
        buildings!.add(Building.fromJson(e));
      });
    if (json['ref_ApartmentAssets_assetIdDto'] != null)
      json['ref_ApartmentAssets_assetIdDto'].forEach((e) {
        apartments!.add(Apartments.fromJson(e));
      });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['display_name'] = displayName;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['supplierId'] = supplierId;
    data['assetTypeId'] = assetTypeId;
    data['unitId'] = unitId;
    data['manage'] = manage;
    data['describe'] = describe;
    data['inventory'] = inventory;
    return data;
  }
}

class Supplier {
  String? id;
  String? displayName;
  Supplier.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['name'] ?? null;
    }
  }
}

class Unit {
  String? id;
  String? displayName;
  Unit.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['display_name'] ?? null;
    }
  }
}

class Floor {
  String? id;
  String? displayName;
  Floor.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['display_name'] ?? null;
    }
  }
}

class AssetType {
  String? id;
  String? displayName;
  AssetType.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['display_name'] ?? null;
    }
  }
}

class Building {
  String? id;
  String? displayName;
  Building.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['display_name'] ?? null;
    }
  }
}

class Apartments {
  String? id;
  String? displayName;
  Apartments.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['display_name'] ?? null;
    }
  }
}
