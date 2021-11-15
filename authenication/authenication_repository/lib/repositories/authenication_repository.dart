import 'dart:async';
import 'dart:core';
import 'package:authenication_repository/entities/country_code/country_code_entity.dart';
import 'package:authenication_repository/entities/otp/session_otp_entity.dart';
import 'package:authenication_repository/entities/request_login.dart';
import 'package:authenication_repository/entities/request_register.dart';
import 'package:authenication_repository/entities/response_login.dart';

abstract class AuthenicationRepository {
  Future<SessionOTP> requestOTP({required String phoneNumber});
  Future<bool> checkOTP({required SessionOTP session});
  Future<String> register({required RequestRegister data});
  Future<LoginResponse> requestLogin({required RequestLogin data});
  Future<LoginResponse> requestNuclentLogin(
      {required String username, required String password});
  Future<String> getUserId();
  Future<List<CountryCodeEntity>> getCountryCode();
}
