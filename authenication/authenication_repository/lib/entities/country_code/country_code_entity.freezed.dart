// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryCodeEntity _$CountryCodeEntityFromJson(Map<String, dynamic> json) {
  return _CountryCodeEntity.fromJson(json);
}

/// @nodoc
class _$CountryCodeEntityTearOff {
  const _$CountryCodeEntityTearOff();

  _CountryCodeEntity call(
      {required String name,
      required String flag,
      required String code,
      @JsonKey(name: 'dial_code') required String dialCode}) {
    return _CountryCodeEntity(
      name: name,
      flag: flag,
      code: code,
      dialCode: dialCode,
    );
  }

  CountryCodeEntity fromJson(Map<String, Object> json) {
    return CountryCodeEntity.fromJson(json);
  }
}

/// @nodoc
const $CountryCodeEntity = _$CountryCodeEntityTearOff();

/// @nodoc
mixin _$CountryCodeEntity {
  String get name => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'dial_code')
  String get dialCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCodeEntityCopyWith<CountryCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeEntityCopyWith<$Res> {
  factory $CountryCodeEntityCopyWith(
          CountryCodeEntity value, $Res Function(CountryCodeEntity) then) =
      _$CountryCodeEntityCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String flag,
      String code,
      @JsonKey(name: 'dial_code') String dialCode});
}

/// @nodoc
class _$CountryCodeEntityCopyWithImpl<$Res>
    implements $CountryCodeEntityCopyWith<$Res> {
  _$CountryCodeEntityCopyWithImpl(this._value, this._then);

  final CountryCodeEntity _value;
  // ignore: unused_field
  final $Res Function(CountryCodeEntity) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? flag = freezed,
    Object? code = freezed,
    Object? dialCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CountryCodeEntityCopyWith<$Res>
    implements $CountryCodeEntityCopyWith<$Res> {
  factory _$CountryCodeEntityCopyWith(
          _CountryCodeEntity value, $Res Function(_CountryCodeEntity) then) =
      __$CountryCodeEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String flag,
      String code,
      @JsonKey(name: 'dial_code') String dialCode});
}

/// @nodoc
class __$CountryCodeEntityCopyWithImpl<$Res>
    extends _$CountryCodeEntityCopyWithImpl<$Res>
    implements _$CountryCodeEntityCopyWith<$Res> {
  __$CountryCodeEntityCopyWithImpl(
      _CountryCodeEntity _value, $Res Function(_CountryCodeEntity) _then)
      : super(_value, (v) => _then(v as _CountryCodeEntity));

  @override
  _CountryCodeEntity get _value => super._value as _CountryCodeEntity;

  @override
  $Res call({
    Object? name = freezed,
    Object? flag = freezed,
    Object? code = freezed,
    Object? dialCode = freezed,
  }) {
    return _then(_CountryCodeEntity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: dialCode == freezed
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryCodeEntity
    with DiagnosticableTreeMixin
    implements _CountryCodeEntity {
  _$_CountryCodeEntity(
      {required this.name,
      required this.flag,
      required this.code,
      @JsonKey(name: 'dial_code') required this.dialCode});

  factory _$_CountryCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryCodeEntityFromJson(json);

  @override
  final String name;
  @override
  final String flag;
  @override
  final String code;
  @override
  @JsonKey(name: 'dial_code')
  final String dialCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountryCodeEntity(name: $name, flag: $flag, code: $code, dialCode: $dialCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountryCodeEntity'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('flag', flag))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('dialCode', dialCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryCodeEntity &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.dialCode, dialCode) ||
                const DeepCollectionEquality()
                    .equals(other.dialCode, dialCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(flag) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(dialCode);

  @JsonKey(ignore: true)
  @override
  _$CountryCodeEntityCopyWith<_CountryCodeEntity> get copyWith =>
      __$CountryCodeEntityCopyWithImpl<_CountryCodeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryCodeEntityToJson(this);
  }
}

abstract class _CountryCodeEntity implements CountryCodeEntity {
  factory _CountryCodeEntity(
          {required String name,
          required String flag,
          required String code,
          @JsonKey(name: 'dial_code') required String dialCode}) =
      _$_CountryCodeEntity;

  factory _CountryCodeEntity.fromJson(Map<String, dynamic> json) =
      _$_CountryCodeEntity.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get flag => throw _privateConstructorUsedError;
  @override
  String get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dial_code')
  String get dialCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryCodeEntityCopyWith<_CountryCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
