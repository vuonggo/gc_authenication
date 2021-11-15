import 'dart:convert';

import 'package:authenication_repository/entities/country_code/country_code_entity.dart';
import 'package:authenication_repository/entities/otp/session_otp_entity.dart';
import 'package:authenication_repository/entities/request_login.dart';
import 'package:authenication_repository/entities/request_register.dart';
import 'package:authenication_repository/entities/response_login.dart';
import 'package:flutter/services.dart';

import 'authenication_repository.dart';
import 'package:flutter_cpnetworking_service/flutter_cpnetworking_service.dart';
import 'package:dio/dio.dart';

enum _P { requestOTP, requestLogin, register, sessions, checkOTP }

class _Url {
  static String value(_P value) {
    switch (value) {
      case _P.requestOTP:
        return '/v1/public/flow-runner/action/sendOtpForRegister';
      case _P.requestLogin:
        return '/api/accounts/login';
      case _P.register:
        return '/v1/public/flow-runner/action/registerNewUser';
      case _P.sessions:
        return '/v1/me';
      case _P.checkOTP:
        return '/v1/public/flow-runner/action/checkOtp';
      default:
        return '';
    }
  }
}

class AuthenicationClient extends APIProvider
    implements AuthenicationRepository {
  AuthenicationClient(
      {required StorageTokenProcessor storageTokenProcessor,
      required NetworkConfigurable networkConfigurable,
      Interceptor? interceptor})
      : super(
            storageTokenProcessor: storageTokenProcessor,
            networkConfiguration: networkConfigurable,
            interceptor: interceptor);

  @override
  Future<SessionOTP> requestOTP({required String phoneNumber}) async {
    var input = DefaultInputService(
        queryParameters: {'phoneNumber': phoneNumber},
        path: _Url.value(_P.requestOTP),
        requestType: RequestType.post);
    final response = await super.request(input: input);
    var result = checkError2(response);
    if (result != null) {
      return Future.error(AppError(message: result));
    } else {
      return SessionOTP.fromJson(response.data['data']);
    }
  }

  @override
  Future<LoginResponse> requestLogin({required RequestLogin data}) async {
    var input = DefaultInputService(
        queryParameters: data.toJson(),
        path: _Url.value(_P.requestLogin),
        requestType: RequestType.post);
    final response = await super.request(input: input);
    var result = response.data['result'];
    if (result is bool && result == false) {
      return Future.error(AppError(message: 'Nhập OTP không chính xác.'));
    } else {
      return LoginResponse.fromJson(response.data);
    }
  }

  @override
  Future<LoginResponse> requestNuclentLogin(
      {required String username, required String password}) async {
    var input = DefaultInputService(
        queryParameters: {'username': username, 'password': password},
        path: '/v1/auth/login',
        requestType: RequestType.post);
    final response = await super.request(input: input);
    String? message = response.data['message'];
    var error = response.data['error'];
    if (error != null && message != null) {
      return Future.error(AppError(message: message));
    } else {
      var data = response.data;
      data['expiresIn'] = 86400;
      return LoginResponse.fromJson(response.data);
    }
  }

  @override
  Future<String> getUserId() async {
    var input = DefaultInputService(
        path: _Url.value(_P.sessions), requestType: RequestType.get);
    final response = await super.request(input: input);
    var error = checkError(response);
    if (error != null) {
      return Future.error(AppError(message: error));
    } else {
      return response.data['id'] ?? '';
    }
  }

  String? checkError(Response<dynamic> response) {
    var message = response.data['message'];
    var error = response.data['error'];
    return (message != null && error != null) ? message : null;
  }

  String? checkError2(Response<dynamic> response) {
    String message = response.data['resultMessage'];
    dynamic error = response.data['resultCode'];
    if (error is String) {
      return message;
    }
    return (error != 200) ? message : null;
  }

  @override
  Future<bool> checkOTP({required SessionOTP session}) async {
    var input = DefaultInputService(
        queryParameters: session.toJson(),
        path: _Url.value(_P.checkOTP),
        requestType: RequestType.post);
    final response = await super.request(input: input);
    var result = checkError2(response);
    if (result != null) {
      return Future.error(AppError(message: result));
    } else {
      return response.data['isOtpMatch'];
    }
  }

  @override
  Future<String> register({required RequestRegister data}) async {
    var input = DefaultInputService(
        queryParameters: data.toJson(),
        path: _Url.value(_P.register),
        requestType: RequestType.post);
    final response = await super.request(input: input);
    var result = checkError2(response);
    if (result != null) {
      return Future.error(AppError(message: result));
    } else {
      Map<String, dynamic> data = response.data['data'];
      return data['userId'];
    }
  }

  @override
  Future<List<CountryCodeEntity>> getCountryCode() async {
    var data = await rootBundle
        .loadString('packages/authenication_repository/assets/flags.json');
    var decoded = jsonDecode(data);
    return (decoded['items'] as List)
        .map((e) => CountryCodeEntity.fromJson(e))
        .toList();
  }
}
