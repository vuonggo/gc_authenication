import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'response_login.freezed.dart';
part 'response_login.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required String accessToken,
    required int expiresIn,
  }) = _LoginResponse;
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
