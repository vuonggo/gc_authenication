import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'country_code_entity.freezed.dart';
part 'country_code_entity.g.dart';

@freezed
class CountryCodeEntity with _$CountryCodeEntity {
  factory CountryCodeEntity(
          {required String name,
          required String flag,
          required String code,
          @JsonKey(name: 'dial_code') required String dialCode}) =
      _CountryCodeEntity;
  factory CountryCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeEntityFromJson(json);
}
