// ignore_for_file: prefer_collection_literals

class Asset {
  String? id;
  String? displayName;
  String? name;
  String? createdTime;
  String? updatedTime;
  String? supplierId;
  String? manage;
  String? describe;
  String? inventory;

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    displayName = json['display_name'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    name = json['name'];
    supplierId = json['supplierId'];
    manage = json['manage'];
    describe = json['describe'];
    inventory = json['inventory'];
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
