// ignore_for_file: prefer_collection_literals, unnecessary_null_in_if_null_operators, curly_braces_in_flow_control_structures

class Asset {
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
  int? amount;
  Supplier? supplier;
  Unit? unit;

  AssetType? assetType;
  List<Floor>? floors;
  List<Building>? buildings;
  List<Apartment>? apartments;

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    code = json['code'];
    displayName = json['display_name'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    name = json['name'];
    supplierId = json['supplierId'];
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
        apartments!.add(Apartment.fromJson(e));
      });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['display_name'] = displayName;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['supplierId'] = supplierId;
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

class Apartment {
  String? id;
  String? displayName;
  Apartment.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'] ?? null;
      displayName = json['display_name'] ?? null;
    }
  }
}
