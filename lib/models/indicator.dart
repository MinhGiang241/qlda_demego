// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'file_upload_model.dart';

class WaterIndicator {
  String? id;
  String? createdTime;
  String? updatedTime;
  String? residentId;
  String? apartmentId;
  String? employeeId;
  String? phone;
  double? water_head;
  double? water_last;
  double? water_consumption;
  int? year;
  int? month;
  bool? latch;
  String? owner_name;
  String? phone_number;
  List<FileUploadModel>? image;
  WaterIndicator({
    this.id,
    this.water_last,
    this.water_consumption,
    this.createdTime,
    this.updatedTime,
    this.residentId,
    this.apartmentId,
    this.employeeId,
    this.phone,
    this.water_head,
    this.year,
    this.month,
    this.latch,
    this.owner_name,
    this.phone_number,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'residentId': residentId,
      'apartmentId': apartmentId,
      'employeeId': employeeId,
      'phone': phone,
      'water_head': water_head,
      'year': year,
      'month': month,
      'latch': latch,
      'owner_name': owner_name,
      'phone_number': phone_number,
      'water_last': water_last,
      'water_consumption': water_consumption,
      'image': image?.map((i) => i.toMap()).toList(),
    };
  }

  factory WaterIndicator.fromMap(Map<String, dynamic> map) {
    return WaterIndicator(
      id: map['_id'] != null ? map['_id'] as String : null,
      createdTime:
          map['createdTime'] != null ? map['createdTime'] as String : null,
      updatedTime:
          map['updatedTime'] != null ? map['updatedTime'] as String : null,
      residentId:
          map['residentId'] != null ? map['residentId'] as String : null,
      apartmentId:
          map['apartmentId'] != null ? map['apartmentId'] as String : null,
      employeeId:
          map['employeeId'] != null ? map['employeeId'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      image: map['image'] != null
          ? List<FileUploadModel>.from(
              (map['image'] as List<dynamic>).map<FileUploadModel?>(
                (x) => FileUploadModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      water_head: double.tryParse(map['water_head'].toString()) != null
          ? double.parse(map['water_head'].toString())
          : null,
      water_consumption:
          double.tryParse(map['water_consumption'].toString()) != null
              ? double.parse(map['water_consumption'].toString())
              : null,
      water_last: double.tryParse(map['water_last'].toString()) != null
          ? double.parse(map['water_last'].toString())
          : null,
      year: int.tryParse(map['year'].toString()) != null
          ? int.parse(map['year'].toString())
          : null,
      month: int.tryParse(map['month'].toString()) != null
          ? int.parse(map['month'].toString())
          : null,
      latch: map['latch'] != null ? map['latch'] as bool : null,
      owner_name:
          map['owner_name'] != null ? map['owner_name'] as String : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WaterIndicator.fromJson(String source) =>
      WaterIndicator.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ElectricIndicator {
  String? id;
  String? createdTime;
  String? updatedTime;
  String? residentId;
  String? apartmentId;
  String? employeeId;
  String? phone;
  double? electricity_head;
  double? electricity_last;
  double? electricity_consumption;
  int? year;
  int? month;
  bool? latch;
  String? owner_name;
  String? phone_number;
  List<FileUploadModel>? image;
  ElectricIndicator({
    this.id,
    this.electricity_last,
    this.electricity_consumption,
    this.createdTime,
    this.updatedTime,
    this.residentId,
    this.apartmentId,
    this.employeeId,
    this.phone,
    this.electricity_head,
    this.year,
    this.month,
    this.latch,
    this.owner_name,
    this.phone_number,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'residentId': residentId,
      'apartmentId': apartmentId,
      'employeeId': employeeId,
      'phone': phone,
      'electricity_head': electricity_head,
      'year': year,
      'month': month,
      'latch': latch,
      'owner_name': owner_name,
      'electricity_consumption': electricity_consumption,
      'phone_number': phone_number,
      'electricity_last': electricity_last,
      'image': image?.map((i) => i.toMap()).toList(),
    };
  }

  factory ElectricIndicator.fromMap(Map<String, dynamic> map) {
    return ElectricIndicator(
      id: map['_id'] != null ? map['_id'] as String : null,
      createdTime:
          map['createdTime'] != null ? map['createdTime'] as String : null,
      updatedTime:
          map['updatedTime'] != null ? map['updatedTime'] as String : null,
      residentId:
          map['residentId'] != null ? map['residentId'] as String : null,
      apartmentId:
          map['apartmentId'] != null ? map['apartmentId'] as String : null,
      employeeId:
          map['employeeId'] != null ? map['employeeId'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      image: map['image'] != null
          ? List<FileUploadModel>.from(
              (map['image'] as List<dynamic>).map<FileUploadModel?>(
                (x) => FileUploadModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      electricity_head:
          double.tryParse(map['electricity_head'].toString()) != null
              ? double.parse(map['electricity_head'].toString())
              : null,
      electricity_consumption:
          double.tryParse(map['electricity_consumption'].toString()) != null
              ? double.parse(map['electricity_consumption'].toString())
              : null,
      electricity_last:
          double.tryParse(map['electricity_last'].toString()) != null
              ? double.parse(map['electricity_last'].toString())
              : null,
      year: int.tryParse(map['year'].toString()) != null
          ? int.parse(map['year'].toString())
          : null,
      month: int.tryParse(map['month'].toString()) != null
          ? int.parse(map['month'].toString())
          : null,
      latch: map['latch'] != null ? map['latch'] as bool : null,
      owner_name:
          map['owner_name'] != null ? map['owner_name'] as String : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectricIndicator.fromJson(String source) =>
      ElectricIndicator.fromMap(json.decode(source) as Map<String, dynamic>);
}
