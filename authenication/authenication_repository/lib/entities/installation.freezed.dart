// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'installation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Installation _$InstallationFromJson(Map<String, dynamic> json) {
  return _Installation.fromJson(json);
}

/// @nodoc
class _$InstallationTearOff {
  const _$InstallationTearOff();

  _Installation call(
      {String? id,
      String? deviceId,
      String? userId,
      String? token,
      String? brand,
      String? deviceName,
      String? macAddress,
      String? os}) {
    return _Installation(
      id: id,
      deviceId: deviceId,
      userId: userId,
      token: token,
      brand: brand,
      deviceName: deviceName,
      macAddress: macAddress,
      os: os,
    );
  }

  Installation fromJson(Map<String, Object> json) {
    return Installation.fromJson(json);
  }
}

/// @nodoc
const $Installation = _$InstallationTearOff();

/// @nodoc
mixin _$Installation {
  String? get id => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  String? get macAddress => throw _privateConstructorUsedError;
  String? get os => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstallationCopyWith<Installation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstallationCopyWith<$Res> {
  factory $InstallationCopyWith(
          Installation value, $Res Function(Installation) then) =
      _$InstallationCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? deviceId,
      String? userId,
      String? token,
      String? brand,
      String? deviceName,
      String? macAddress,
      String? os});
}

/// @nodoc
class _$InstallationCopyWithImpl<$Res> implements $InstallationCopyWith<$Res> {
  _$InstallationCopyWithImpl(this._value, this._then);

  final Installation _value;
  // ignore: unused_field
  final $Res Function(Installation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? deviceId = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? brand = freezed,
    Object? deviceName = freezed,
    Object? macAddress = freezed,
    Object? os = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      macAddress: macAddress == freezed
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$InstallationCopyWith<$Res>
    implements $InstallationCopyWith<$Res> {
  factory _$InstallationCopyWith(
          _Installation value, $Res Function(_Installation) then) =
      __$InstallationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? deviceId,
      String? userId,
      String? token,
      String? brand,
      String? deviceName,
      String? macAddress,
      String? os});
}

/// @nodoc
class __$InstallationCopyWithImpl<$Res> extends _$InstallationCopyWithImpl<$Res>
    implements _$InstallationCopyWith<$Res> {
  __$InstallationCopyWithImpl(
      _Installation _value, $Res Function(_Installation) _then)
      : super(_value, (v) => _then(v as _Installation));

  @override
  _Installation get _value => super._value as _Installation;

  @override
  $Res call({
    Object? id = freezed,
    Object? deviceId = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? brand = freezed,
    Object? deviceName = freezed,
    Object? macAddress = freezed,
    Object? os = freezed,
  }) {
    return _then(_Installation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      macAddress: macAddress == freezed
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Installation with DiagnosticableTreeMixin implements _Installation {
  _$_Installation(
      {this.id,
      this.deviceId,
      this.userId,
      this.token,
      this.brand,
      this.deviceName,
      this.macAddress,
      this.os});

  factory _$_Installation.fromJson(Map<String, dynamic> json) =>
      _$_$_InstallationFromJson(json);

  @override
  final String? id;
  @override
  final String? deviceId;
  @override
  final String? userId;
  @override
  final String? token;
  @override
  final String? brand;
  @override
  final String? deviceName;
  @override
  final String? macAddress;
  @override
  final String? os;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Installation(id: $id, deviceId: $deviceId, userId: $userId, token: $token, brand: $brand, deviceName: $deviceName, macAddress: $macAddress, os: $os)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Installation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('deviceId', deviceId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('brand', brand))
      ..add(DiagnosticsProperty('deviceName', deviceName))
      ..add(DiagnosticsProperty('macAddress', macAddress))
      ..add(DiagnosticsProperty('os', os));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Installation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.brand, brand) ||
                const DeepCollectionEquality().equals(other.brand, brand)) &&
            (identical(other.deviceName, deviceName) ||
                const DeepCollectionEquality()
                    .equals(other.deviceName, deviceName)) &&
            (identical(other.macAddress, macAddress) ||
                const DeepCollectionEquality()
                    .equals(other.macAddress, macAddress)) &&
            (identical(other.os, os) ||
                const DeepCollectionEquality().equals(other.os, os)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(brand) ^
      const DeepCollectionEquality().hash(deviceName) ^
      const DeepCollectionEquality().hash(macAddress) ^
      const DeepCollectionEquality().hash(os);

  @JsonKey(ignore: true)
  @override
  _$InstallationCopyWith<_Installation> get copyWith =>
      __$InstallationCopyWithImpl<_Installation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InstallationToJson(this);
  }
}

abstract class _Installation implements Installation {
  factory _Installation(
      {String? id,
      String? deviceId,
      String? userId,
      String? token,
      String? brand,
      String? deviceName,
      String? macAddress,
      String? os}) = _$_Installation;

  factory _Installation.fromJson(Map<String, dynamic> json) =
      _$_Installation.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get deviceId => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  String? get brand => throw _privateConstructorUsedError;
  @override
  String? get deviceName => throw _privateConstructorUsedError;
  @override
  String? get macAddress => throw _privateConstructorUsedError;
  @override
  String? get os => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InstallationCopyWith<_Installation> get copyWith =>
      throw _privateConstructorUsedError;
}
