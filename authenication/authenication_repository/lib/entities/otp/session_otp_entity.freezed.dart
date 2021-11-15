// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'session_otp_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionOTP _$SessionOTPFromJson(Map<String, dynamic> json) {
  return _SessionOTP.fromJson(json);
}

/// @nodoc
class _$SessionOTPTearOff {
  const _$SessionOTPTearOff();

  _SessionOTP call(
      {required String sessionId, String? otp, String? otpExpired}) {
    return _SessionOTP(
      sessionId: sessionId,
      otp: otp,
      otpExpired: otpExpired,
    );
  }

  SessionOTP fromJson(Map<String, Object> json) {
    return SessionOTP.fromJson(json);
  }
}

/// @nodoc
const $SessionOTP = _$SessionOTPTearOff();

/// @nodoc
mixin _$SessionOTP {
  String get sessionId => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  String? get otpExpired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionOTPCopyWith<SessionOTP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionOTPCopyWith<$Res> {
  factory $SessionOTPCopyWith(
          SessionOTP value, $Res Function(SessionOTP) then) =
      _$SessionOTPCopyWithImpl<$Res>;
  $Res call({String sessionId, String? otp, String? otpExpired});
}

/// @nodoc
class _$SessionOTPCopyWithImpl<$Res> implements $SessionOTPCopyWith<$Res> {
  _$SessionOTPCopyWithImpl(this._value, this._then);

  final SessionOTP _value;
  // ignore: unused_field
  final $Res Function(SessionOTP) _then;

  @override
  $Res call({
    Object? sessionId = freezed,
    Object? otp = freezed,
    Object? otpExpired = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      otpExpired: otpExpired == freezed
          ? _value.otpExpired
          : otpExpired // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SessionOTPCopyWith<$Res> implements $SessionOTPCopyWith<$Res> {
  factory _$SessionOTPCopyWith(
          _SessionOTP value, $Res Function(_SessionOTP) then) =
      __$SessionOTPCopyWithImpl<$Res>;
  @override
  $Res call({String sessionId, String? otp, String? otpExpired});
}

/// @nodoc
class __$SessionOTPCopyWithImpl<$Res> extends _$SessionOTPCopyWithImpl<$Res>
    implements _$SessionOTPCopyWith<$Res> {
  __$SessionOTPCopyWithImpl(
      _SessionOTP _value, $Res Function(_SessionOTP) _then)
      : super(_value, (v) => _then(v as _SessionOTP));

  @override
  _SessionOTP get _value => super._value as _SessionOTP;

  @override
  $Res call({
    Object? sessionId = freezed,
    Object? otp = freezed,
    Object? otpExpired = freezed,
  }) {
    return _then(_SessionOTP(
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      otpExpired: otpExpired == freezed
          ? _value.otpExpired
          : otpExpired // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionOTP with DiagnosticableTreeMixin implements _SessionOTP {
  _$_SessionOTP({required this.sessionId, this.otp, this.otpExpired});

  factory _$_SessionOTP.fromJson(Map<String, dynamic> json) =>
      _$_$_SessionOTPFromJson(json);

  @override
  final String sessionId;
  @override
  final String? otp;
  @override
  final String? otpExpired;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionOTP(sessionId: $sessionId, otp: $otp, otpExpired: $otpExpired)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionOTP'))
      ..add(DiagnosticsProperty('sessionId', sessionId))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('otpExpired', otpExpired));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SessionOTP &&
            (identical(other.sessionId, sessionId) ||
                const DeepCollectionEquality()
                    .equals(other.sessionId, sessionId)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.otpExpired, otpExpired) ||
                const DeepCollectionEquality()
                    .equals(other.otpExpired, otpExpired)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sessionId) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(otpExpired);

  @JsonKey(ignore: true)
  @override
  _$SessionOTPCopyWith<_SessionOTP> get copyWith =>
      __$SessionOTPCopyWithImpl<_SessionOTP>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SessionOTPToJson(this);
  }
}

abstract class _SessionOTP implements SessionOTP {
  factory _SessionOTP(
      {required String sessionId,
      String? otp,
      String? otpExpired}) = _$_SessionOTP;

  factory _SessionOTP.fromJson(Map<String, dynamic> json) =
      _$_SessionOTP.fromJson;

  @override
  String get sessionId => throw _privateConstructorUsedError;
  @override
  String? get otp => throw _privateConstructorUsedError;
  @override
  String? get otpExpired => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SessionOTPCopyWith<_SessionOTP> get copyWith =>
      throw _privateConstructorUsedError;
}
