// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:qlda_demego/models/indicator.dart';

class IndicatorData {
  String? baseURL;
  String? regCode;
  String? access_token;
  List<ElectricIndicator>? electric;
  List<WaterIndicator>? water;
  IndicatorData({
    this.baseURL,
    this.electric,
    this.water,
    this.regCode,
    this.access_token,
  });

  IndicatorData copyWith({
    String? baseURL,
    List<ElectricIndicator>? electric,
    List<WaterIndicator>? water,
    String? regCode,
    String? access_token,
  }) {
    return IndicatorData(
      baseURL: baseURL ?? this.baseURL,
      electric: electric ?? this.electric,
      water: water ?? this.water,
      regCode: regCode ?? this.regCode,
      access_token: access_token ?? this.access_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseURL': baseURL,
      'regCode': regCode,
      'access_token': access_token,
      'electric': electric?.map((x) => x.toMap()).toList(),
      'water': water?.map((x) => x.toMap()).toList(),
    };
  }

  factory IndicatorData.fromMap(Map<String, dynamic> map) {
    return IndicatorData(
      baseURL: map['domain'] != null ? map['baseURL'] as String : null,
      regCode: map['regCode'] != null ? map['regCode'] as String : null,
      access_token:
          map['access_token'] != null ? map['access_token'] as String : null,
      electric: map['electric'] != null
          ? List<ElectricIndicator>.from(
              (map['electric'] as List<dynamic>).map<ElectricIndicator?>(
                (x) => ElectricIndicator.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      water: map['water'] != null
          ? List<WaterIndicator>.from(
              (map['water'] as List<int>).map<WaterIndicator?>(
                (x) => WaterIndicator.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory IndicatorData.fromJson(String source) =>
      IndicatorData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IndicatorData(baseURL: $baseURL,regCode: $regCode,access_token: $access_token,  electric: $electric, water: $water)';

  @override
  bool operator ==(covariant IndicatorData other) {
    if (identical(this, other)) return true;

    return other.baseURL == baseURL &&
        listEquals(other.electric, electric) &&
        listEquals(other.water, water);
  }

  @override
  int get hashCode => baseURL.hashCode ^ electric.hashCode ^ water.hashCode;
}
