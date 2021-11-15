// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestRegister _$RequestRegisterFromJson(Map<String, dynamic> json) {
  return _RequestRegister.fromJson(json);
}

/// @nodoc
class _$RequestRegisterTearOff {
  const _$RequestRegisterTearOff();

  _RequestRegister call(
      {required String username,
      required String password,
      required String sessionId}) {
    return _RequestRegister(
      username: username,
      password: password,
      sessionId: sessionId,
    );
  }

  RequestRegister fromJson(Map<String, Object> json) {
    return RequestRegister.fromJson(json);
  }
}

/// @nodoc
const $RequestRegister = _$RequestRegisterTearOff();

/// @nodoc
mixin _$RequestRegister {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestRegisterCopyWith<RequestRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestRegisterCopyWith<$Res> {
  factory $RequestRegisterCopyWith(
          RequestRegister value, $Res Function(RequestRegister) then) =
      _$RequestRegisterCopyWithImpl<$Res>;
  $Res call({String username, String password, String sessionId});
}

/// @nodoc
class _$RequestRegisterCopyWithImpl<$Res>
    implements $RequestRegisterCopyWith<$Res> {
  _$RequestRegisterCopyWithImpl(this._value, this._then);

  final RequestRegister _value;
  // ignore: unused_field
  final $Res Function(RequestRegister) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RequestRegisterCopyWith<$Res>
    implements $RequestRegisterCopyWith<$Res> {
  factory _$RequestRegisterCopyWith(
          _RequestRegister value, $Res Function(_RequestRegister) then) =
      __$RequestRegisterCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password, String sessionId});
}

/// @nodoc
class __$RequestRegisterCopyWithImpl<$Res>
    extends _$RequestRegisterCopyWithImpl<$Res>
    implements _$RequestRegisterCopyWith<$Res> {
  __$RequestRegisterCopyWithImpl(
      _RequestRegister _value, $Res Function(_RequestRegister) _then)
      : super(_value, (v) => _then(v as _RequestRegister));

  @override
  _RequestRegister get _value => super._value as _RequestRegister;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_RequestRegister(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestRegister
    with DiagnosticableTreeMixin
    implements _RequestRegister {
  _$_RequestRegister(
      {required this.username,
      required this.password,
      required this.sessionId});

  factory _$_RequestRegister.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestRegisterFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String sessionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestRegister(username: $username, password: $password, sessionId: $sessionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestRegister'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('sessionId', sessionId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestRegister &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.sessionId, sessionId) ||
                const DeepCollectionEquality()
                    .equals(other.sessionId, sessionId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(sessionId);

  @JsonKey(ignore: true)
  @override
  _$RequestRegisterCopyWith<_RequestRegister> get copyWith =>
      __$RequestRegisterCopyWithImpl<_RequestRegister>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestRegisterToJson(this);
  }
}

abstract class _RequestRegister implements RequestRegister {
  factory _RequestRegister(
      {required String username,
      required String password,
      required String sessionId}) = _$_RequestRegister;

  factory _RequestRegister.fromJson(Map<String, dynamic> json) =
      _$_RequestRegister.fromJson;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get sessionId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestRegisterCopyWith<_RequestRegister> get copyWith =>
      throw _privateConstructorUsedError;
}
