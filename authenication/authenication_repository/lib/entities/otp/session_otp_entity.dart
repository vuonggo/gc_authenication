import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'session_otp_entity.freezed.dart';
part 'session_otp_entity.g.dart';

@freezed
class SessionOTP with _$SessionOTP {
  factory SessionOTP({
    required String sessionId,
    String? otp,
    String? otpExpired,
  }) = _SessionOTP;
  factory SessionOTP.fromJson(Map<String, dynamic> json) =>
      _$SessionOTPFromJson(json);
}
