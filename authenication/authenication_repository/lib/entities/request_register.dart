import 'installation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'request_register.freezed.dart';
part 'request_register.g.dart';

@freezed
class RequestRegister with _$RequestRegister {
  factory RequestRegister({
    required String username,
    required String password,
    required String sessionId,
  }) = _RequestRegister;
  factory RequestRegister.fromJson(Map<String, dynamic> json) =>
      _$RequestRegisterFromJson(json);
}
