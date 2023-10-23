// ignore_for_file: non_constant_identifier_names

import 'package:qlda_demego/models/indicator.dart';

class Apartment {
  String? id;
  String? createdTime;
  String? updatedTime;
  bool? isLocked;
  bool? isDraft;
  String? code;
  String? name;
  double? area;
  String? buildingId;
  String? floorId;
  String? apartment_type;
  String? apartment_status;
  String? apartmentTypeId;
  String? status;
  String? electrical_code;
  String? water_code;
  Building? b;
  Floor? f;
  WaterIndicator? w;
  WaterIndicator? lw;
  ElectricIndicator? e;
  ElectricIndicator? le;
  Apartment({
    this.electrical_code,
    this.water_code,
    this.code,
    this.f,
    this.b,
    this.w,
    this.lw,
    this.le,
    this.e,
    this.createdTime,
    this.id,
    this.isDraft,
    this.isLocked,
    this.name,
    this.updatedTime,
    this.apartmentTypeId,
    this.apartment_status,
    this.apartment_type,
    this.area,
    this.buildingId,
    this.floorId,
    this.status,
  });

  Apartment.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    isLocked = json['isLocked'];
    isDraft = json['isDraft'];
    code = json['code'];
    name = json['name'];
    area = json['area'] != null
        ? double.tryParse(json['area'].toString()) != null
            ? double.parse(json['area'].toString())
            : 0
        : 0;
    buildingId = json['buildingId'];
    floorId = json['floorId'];
    apartment_type = json['apartment_type'];
    apartment_status = json['apartment_status'];
    apartmentTypeId = json['apartmentTypeId'];
    status = json['status'];
    electrical_code = json['electrical_code'];
    water_code = json['water_code'];
    b = json['b'] != null ? Building.fromJson(json['b']) : null;

    w = json['w'] != null ? WaterIndicator.fromMap(json['w']) : null;
    e = json['e'] != null ? ElectricIndicator.fromMap(json['e']) : null;
    lw = json['lw'] != null ? WaterIndicator.fromMap(json['lw']) : null;
    le = json['le'] != null ? ElectricIndicator.fromMap(json['le']) : null;
    f = json['f'] != null ? Floor.fromJson(json['f']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['isLocked'] = isLocked;
    data['isDraft'] = isDraft;
    data['code'] = code;
    data['name'] = name;
    data['area'] = area;
    data['buildingId'] = buildingId;
    data['floorId'] = floorId;
    data['apartment_type'] = apartment_type;
    data['apartment_status'] = apartment_status;
    data['apartmentTypeId'] = apartmentTypeId;
    data['apartmentTypeId'] = apartmentTypeId;
    data['status'] = status;
    return data;
  }
}

class Floor {
  String? id;
  String? createdTime;
  String? updatedTime;
  bool? isLocked;
  bool? isDraft;
  String? code;
  String? name;
  String? buildingId;
  double? area;
  Building? b;

  Floor({
    this.area,
    this.buildingId,
    this.code,
    this.createdTime,
    this.id,
    this.isDraft,
    this.isLocked,
    this.name,
    this.updatedTime,
    this.b,
  });
  Floor.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    isLocked = json['isLocked'];
    isDraft = json['isDraft'];
    code = json['code'];
    name = json['name'];
    area = json['area'] != null
        ? double.tryParse(json['area'].toString()) != null
            ? double.parse(json['area'].toString())
            : 0
        : 0;
    buildingId = json['buildingId'];
    b = json['b'] != null ? Building.fromJson(json['b']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['isLocked'] = isLocked;
    data['isDraft'] = isDraft;
    data['code'] = code;
    data['name'] = name;
    data['area'] = area;
    data['buildingId'] = buildingId;
    return data;
  }
}

class Building {
  String? id;
  String? createdTime;
  String? updatedTime;
  bool? isLocked;
  bool? isDraft;
  String? code;
  String? name;
  Building({
    this.code,
    this.createdTime,
    this.id,
    this.isDraft,
    this.isLocked,
    this.name,
    this.updatedTime,
  });
  Building.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    isLocked = json['isLocked'];
    isDraft = json['isDraft'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['isLocked'] = isLocked;
    data['isDraft'] = isDraft;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
