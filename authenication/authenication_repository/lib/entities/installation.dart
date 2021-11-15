import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'installation.freezed.dart';
part 'installation.g.dart';

@freezed
class Installation with _$Installation {
  factory Installation({
    String? id,
    String? deviceId,
    String? userId,
    String? token,
    String? brand,
    String? deviceName,
    String? macAddress,
    String? os,
  }) = _Installation;
  factory Installation.fromJson(Map<String, dynamic> json) =>
      _$InstallationFromJson(json);
}
