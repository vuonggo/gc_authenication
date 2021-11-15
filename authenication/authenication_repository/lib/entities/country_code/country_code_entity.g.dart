// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryCodeEntity _$_$_CountryCodeEntityFromJson(Map<String, dynamic> json) {
  return _$_CountryCodeEntity(
    name: json['name'] as String,
    flag: json['flag'] as String,
    code: json['code'] as String,
    dialCode: json['dial_code'] as String,
  );
}

Map<String, dynamic> _$_$_CountryCodeEntityToJson(
        _$_CountryCodeEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flag': instance.flag,
      'code': instance.code,
      'dial_code': instance.dialCode,
    };
