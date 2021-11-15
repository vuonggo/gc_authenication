// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestRegister _$_$_RequestRegisterFromJson(Map<String, dynamic> json) {
  return _$_RequestRegister(
    username: json['username'] as String,
    password: json['password'] as String,
    sessionId: json['sessionId'] as String,
  );
}

Map<String, dynamic> _$_$_RequestRegisterToJson(_$_RequestRegister instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'sessionId': instance.sessionId,
    };
