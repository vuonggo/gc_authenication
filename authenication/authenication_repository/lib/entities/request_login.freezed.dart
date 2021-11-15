// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestLogin _$RequestLoginFromJson(Map<String, dynamic> json) {
  return _RequestLogin.fromJson(json);
}

/// @nodoc
class _$RequestLoginTearOff {
  const _$RequestLoginTearOff();

  _RequestLogin call(
      {@JsonKey(name: 'username') required String phoneNumber,
      required String otp,
      Installation? device}) {
    return _RequestLogin(
      phoneNumber: phoneNumber,
      otp: otp,
      device: device,
    );
  }

  RequestLogin fromJson(Map<String, Object> json) {
    return RequestLogin.fromJson(json);
  }
}

/// @nodoc
const $RequestLogin = _$RequestLoginTearOff();

/// @nodoc
mixin _$RequestLogin {
  @JsonKey(name: 'username')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  Installation? get device => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestLoginCopyWith<RequestLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestLoginCopyWith<$Res> {
  factory $RequestLoginCopyWith(
          RequestLogin value, $Res Function(RequestLogin) then) =
      _$RequestLoginCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'username') String phoneNumber,
      String otp,
      Installation? device});

  $InstallationCopyWith<$Res>? get device;
}

/// @nodoc
class _$RequestLoginCopyWithImpl<$Res> implements $RequestLoginCopyWith<$Res> {
  _$RequestLoginCopyWithImpl(this._value, this._then);

  final RequestLogin _value;
  // ignore: unused_field
  final $Res Function(RequestLogin) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? otp = freezed,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Installation?,
    ));
  }

  @override
  $InstallationCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $InstallationCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc
abstract class _$RequestLoginCopyWith<$Res>
    implements $RequestLoginCopyWith<$Res> {
  factory _$RequestLoginCopyWith(
          _RequestLogin value, $Res Function(_RequestLogin) then) =
      __$RequestLoginCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'username') String phoneNumber,
      String otp,
      Installation? device});

  @override
  $InstallationCopyWith<$Res>? get device;
}

/// @nodoc
class __$RequestLoginCopyWithImpl<$Res> extends _$RequestLoginCopyWithImpl<$Res>
    implements _$RequestLoginCopyWith<$Res> {
  __$RequestLoginCopyWithImpl(
      _RequestLogin _value, $Res Function(_RequestLogin) _then)
      : super(_value, (v) => _then(v as _RequestLogin));

  @override
  _RequestLogin get _value => super._value as _RequestLogin;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? otp = freezed,
    Object? device = freezed,
  }) {
    return _then(_RequestLogin(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Installation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestLogin with DiagnosticableTreeMixin implements _RequestLogin {
  _$_RequestLogin(
      {@JsonKey(name: 'username') required this.phoneNumber,
      required this.otp,
      this.device});

  factory _$_RequestLogin.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestLoginFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String phoneNumber;
  @override
  final String otp;
  @override
  final Installation? device;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestLogin(phoneNumber: $phoneNumber, otp: $otp, device: $device)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestLogin'))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('device', device));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestLogin &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.device, device) ||
                const DeepCollectionEquality().equals(other.device, device)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(device);

  @JsonKey(ignore: true)
  @override
  _$RequestLoginCopyWith<_RequestLogin> get copyWith =>
      __$RequestLoginCopyWithImpl<_RequestLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestLoginToJson(this);
  }
}

abstract class _RequestLogin implements RequestLogin {
  factory _RequestLogin(
      {@JsonKey(name: 'username') required String phoneNumber,
      required String otp,
      Installation? device}) = _$_RequestLogin;

  factory _RequestLogin.fromJson(Map<String, dynamic> json) =
      _$_RequestLogin.fromJson;

  @override
  @JsonKey(name: 'username')
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get otp => throw _privateConstructorUsedError;
  @override
  Installation? get device => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestLoginCopyWith<_RequestLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
