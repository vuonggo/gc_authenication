part of 'authenication_bloc.dart';

class AuthenicationState {
  final String phoneNumber;
  final SessionOTP? session;
  final int otpExpired;
  final String? error;
  final bool? isLoading;
  final String userId;
  final List<CountryCodeEntity> countryCode;
  final CountryCodeEntity? selectedCountryCode;
  const AuthenicationState(
      {this.session,
      this.error,
      this.phoneNumber = '',
      this.isLoading = false,
      this.userId = '',
      this.countryCode = const [],
      this.selectedCountryCode,
      this.otpExpired = 0});

  AuthenicationState copyWith(
      {String? error,
      String? phone,
      bool? isLoading,
      String? userId,
      Nullable<SessionOTP>? session,
      List<CountryCodeEntity>? countryCode,
      Nullable<CountryCodeEntity>? selectedCountryCode,
      int? otpExpired}) {
    return AuthenicationState(
        error: error ?? this.error,
        phoneNumber: phone ?? phoneNumber,
        isLoading: isLoading ?? this.isLoading,
        userId: userId ?? this.userId,
        session: session == null ? this.session : session.value,
        countryCode: countryCode ?? this.countryCode,
        otpExpired: otpExpired ?? this.otpExpired,
        selectedCountryCode: selectedCountryCode == null
            ? this.selectedCountryCode
            : selectedCountryCode.value);
  }
}

class Nullable<T> {
  final T _value;

  Nullable(this._value);

  T get value {
    return _value;
  }
}
