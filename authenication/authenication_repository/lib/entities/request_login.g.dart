// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestLogin _$_$_RequestLoginFromJson(Map<String, dynamic> json) {
  return _$_RequestLogin(
    phoneNumber: json['username'] as String,
    otp: json['otp'] as String,
    device: json['device'] == null
        ? null
        : Installation.fromJson(json['device'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RequestLoginToJson(_$_RequestLogin instance) =>
    <String, dynamic>{
      'username': instance.phoneNumber,
      'otp': instance.otp,
      'device': instance.device,
    };
