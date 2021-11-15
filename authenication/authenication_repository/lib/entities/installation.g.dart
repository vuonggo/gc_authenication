// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Installation _$_$_InstallationFromJson(Map<String, dynamic> json) {
  return _$_Installation(
    id: json['id'] as String?,
    deviceId: json['deviceId'] as String?,
    userId: json['userId'] as String?,
    token: json['token'] as String?,
    brand: json['brand'] as String?,
    deviceName: json['deviceName'] as String?,
    macAddress: json['macAddress'] as String?,
    os: json['os'] as String?,
  );
}

Map<String, dynamic> _$_$_InstallationToJson(_$_Installation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'userId': instance.userId,
      'token': instance.token,
      'brand': instance.brand,
      'deviceName': instance.deviceName,
      'macAddress': instance.macAddress,
      'os': instance.os,
    };
