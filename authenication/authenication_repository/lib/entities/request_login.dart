import 'installation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'request_login.freezed.dart';
part 'request_login.g.dart';

@freezed
class RequestLogin with _$RequestLogin {
  factory RequestLogin({
    @JsonKey(name: 'username') required String phoneNumber,
    required String otp,
    Installation? device,
  }) = _RequestLogin;
  factory RequestLogin.fromJson(Map<String, dynamic> json) =>
      _$RequestLoginFromJson(json);
}
