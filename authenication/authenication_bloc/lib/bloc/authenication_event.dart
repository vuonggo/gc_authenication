part of 'authenication_bloc.dart';

@immutable
abstract class AuthenicationEvent {}

class RequestOTPAction extends AuthenicationEvent {
  final String phone;
  final ValueSetter<String?>? callback;
  RequestOTPAction({required this.phone, this.callback});
}

class SelectCountryCode extends AuthenicationEvent {
  final CountryCodeEntity item;
  SelectCountryCode({required this.item});
}

class CheckOTPAction extends AuthenicationEvent {
  final String otp;
  final ValueSetter<String?>? callback;
  CheckOTPAction({required this.otp, this.callback});
}

class RegisterAction extends AuthenicationEvent {
  final String password;
  final ValueSetter<String?>? callback;
  RegisterAction({required this.password, this.callback});
}

class RequestNuclentAction extends AuthenicationEvent {
  final String username;
  final String password;
  final ValueSetter<String?>? callback;
  RequestNuclentAction(
      {required this.username, required this.password, this.callback});
}

class GetCountryCode extends AuthenicationEvent {
  GetCountryCode();
}
