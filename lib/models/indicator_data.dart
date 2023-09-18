// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:qlda_demego/models/indicator.dart';

class IndicatorData {
  String? domain;
  String? regCode;
  List<ElectricIndicator>? electric;
  List<WaterIndicator>? water;
  IndicatorData({
    this.domain,
    this.electric,
    this.water,
    this.regCode,
  });

  IndicatorData copyWith({
    String? domain,
    List<ElectricIndicator>? electric,
    List<WaterIndicator>? water,
    String? regCode,
  }) {
    return IndicatorData(
      domain: domain ?? this.domain,
      electric: electric ?? this.electric,
      water: water ?? this.water,
      regCode: regCode ?? this.regCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'domain': domain,
      'regCode': regCode,
      'electric': electric?.map((x) => x.toMap()).toList(),
      'water': water?.map((x) => x.toMap()).toList(),
    };
  }

  factory IndicatorData.fromMap(Map<String, dynamic> map) {
    return IndicatorData(
      domain: map['domain'] != null ? map['domain'] as String : null,
      regCode: map['regCode'] != null ? map['regCode'] as String : null,
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
      'IndicatorData(domain: $domain,regCode: $regCode,  electric: $electric, water: $water)';

  @override
  bool operator ==(covariant IndicatorData other) {
    if (identical(this, other)) return true;

    return other.domain == domain &&
        listEquals(other.electric, electric) &&
        listEquals(other.water, water);
  }

  @override
  int get hashCode => domain.hashCode ^ electric.hashCode ^ water.hashCode;
}
