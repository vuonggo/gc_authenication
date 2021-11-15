// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_otp_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionOTP _$_$_SessionOTPFromJson(Map<String, dynamic> json) {
  return _$_SessionOTP(
    sessionId: json['sessionId'] as String,
    otp: json['otp'] as String?,
    otpExpired: json['otpExpired'] as String?,
  );
}

Map<String, dynamic> _$_$_SessionOTPToJson(_$_SessionOTP instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'otp': instance.otp,
      'otpExpired': instance.otpExpired,
    };
