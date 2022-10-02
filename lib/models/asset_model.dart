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
}
