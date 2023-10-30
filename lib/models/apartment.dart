// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

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

  Apartment.fromSQLjson(Map<String, dynamic> json) {
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

  Apartment copyWith({
    String? id,
    String? createdTime,
    String? updatedTime,
    bool? isLocked,
    bool? isDraft,
    String? code,
    String? name,
    double? area,
    String? buildingId,
    String? floorId,
    String? apartment_type,
    String? apartment_status,
    String? apartmentTypeId,
    String? status,
    String? electrical_code,
    String? water_code,
    Building? b,
    Floor? f,
    WaterIndicator? w,
    WaterIndicator? lw,
    ElectricIndicator? e,
    ElectricIndicator? le,
  }) {
    return Apartment(
      id: id ?? this.id,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      isLocked: isLocked ?? this.isLocked,
      isDraft: isDraft ?? this.isDraft,
      code: code ?? this.code,
      name: name ?? this.name,
      area: area ?? this.area,
      buildingId: buildingId ?? this.buildingId,
      floorId: floorId ?? this.floorId,
      apartment_type: apartment_type ?? this.apartment_type,
      apartment_status: apartment_status ?? this.apartment_status,
      apartmentTypeId: apartmentTypeId ?? this.apartmentTypeId,
      status: status ?? this.status,
      electrical_code: electrical_code ?? this.electrical_code,
      water_code: water_code ?? this.water_code,
      b: b ?? this.b,
      f: f ?? this.f,
      w: w ?? this.w,
      lw: lw ?? this.lw,
      e: e ?? this.e,
      le: le ?? this.le,
    );
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

class ApartmentFromSQL {
  String? id;
  String? code;
  String? electrical_code;
  String? water_code;
  String? regCode;
  int? month;
  int? year;
  String? offline_images_e;
  String? offline_images_w;
  int? electric_last;
  int? electric_head;
  int? water_head;
  int? water_last;
  ApartmentFromSQL({
    this.id,
    this.code,
    this.electrical_code,
    this.water_code,
    this.regCode,
    this.month,
    this.year,
    this.offline_images_e,
    this.offline_images_w,
    this.electric_last,
    this.electric_head,
    this.water_head,
    this.water_last,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'code': code,
      'electrical_code': electrical_code,
      'water_code': water_code,
      'regCode': regCode,
      'month': month,
      'year': year,
      'offline_images_e': offline_images_e,
      'offline_images_w': offline_images_w,
      'electric_last': electric_last,
      'electric_head': electric_head,
      'water_head': water_head,
      'water_last': water_last,
    };
  }

  factory ApartmentFromSQL.fromMap(Map<String, dynamic> map) {
    return ApartmentFromSQL(
      id: map['_id'] != null ? map['_id'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      electrical_code: map['electrical_code'] != null
          ? map['electrical_code'] as String
          : null,
      water_code:
          map['water_code'] != null ? map['water_code'] as String : null,
      regCode: map['regCode'] != null ? map['regCode'] as String : null,
      month: map['month'] != null ? map['month'] as int : null,
      year: map['year'] != null ? map['year'] as int : null,
      offline_images_e: map['offline_images_e'] != null
          ? map['offline_images_e'] as String
          : null,
      offline_images_w: map['offline_images_w'] != null
          ? map['offline_images_w'] as String
          : null,
      electric_last:
          map['electric_last'] != null ? map['electric_last'] as int : null,
      electric_head:
          map['electric_head'] != null ? map['electric_head'] as int : null,
      water_head: map['water_head'] != null ? map['water_head'] as int : null,
      water_last: map['water_last'] != null ? map['water_last'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApartmentFromSQL.fromJson(String source) =>
      ApartmentFromSQL.fromMap(json.decode(source) as Map<String, dynamic>);
}
