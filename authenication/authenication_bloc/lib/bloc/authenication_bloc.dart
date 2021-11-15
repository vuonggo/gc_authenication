import 'dart:async';
import 'package:authenication_repository/entities/otp/session_otp_entity.dart';
import 'package:authenication_repository/entities/country_code/country_code_entity.dart';
import 'package:authenication_repository/repositories/authenication_repository.dart';
import 'package:authenication_repository/entities/request_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cpnetworking_service/flutter_cpnetworking_service.dart';
import 'package:phone_number/phone_number.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authenication_state.dart';
part 'authenication_event.dart';

class AuthenicationBloc extends Bloc<AuthenicationEvent, AuthenicationState> {
  final AuthenicationRepository repository;
  final StorageTokenProcessor storageTokenProcessor;
  final NetworkConfigurable domain;
  AuthenicationBloc(
      {required this.repository,
      required this.storageTokenProcessor,
      required this.domain})
      : super(const AuthenicationState());

  @override
  Stream<AuthenicationState> mapEventToState(AuthenicationEvent event) async* {
    if (event is RequestOTPAction) {
      yield state.copyWith(isLoading: true);
      yield* _requestOTP(event);
    } else if (event is CheckOTPAction) {
      if (state.isLoading == false) {
        yield state.copyWith(isLoading: true);
        yield* _checkOTP(event);
      }
    } else if (event is RequestNuclentAction) {
      yield state.copyWith(isLoading: true);
      yield* _requestNuclentLogin(event);
    } else if (event is RegisterAction) {
      yield state.copyWith(isLoading: true);
      yield* _register(event);
    } else if (event is GetCountryCode) {
      var phoneNumber =
          storageTokenProcessor.getCurrentSessionInfo()?.phoneNumber;
      var items = await repository.getCountryCode();
      var vn = items.firstWhere((element) => element.code == 'VN');
      items.removeWhere((element) => element.code == 'VN');
      items.insert(0, vn);
      try {
        var parsedPhone = await PhoneNumberUtil()
            .parse(phoneNumber != null ? '+$phoneNumber' : '');

        yield state.copyWith(
            countryCode: items,
            phone: '0${parsedPhone.nationalNumber}',
            selectedCountryCode: Nullable(vn));
        // ignore: empty_catches
      } catch (e) {
        yield state.copyWith(
            countryCode: items, selectedCountryCode: Nullable(vn));
      }
    } else if (event is SelectCountryCode) {
      yield state.copyWith(selectedCountryCode: Nullable(event.item));
    }
  }

  Stream<AuthenicationState> _requestOTP(RequestOTPAction params) async* {
    try {
      var session = await repository.requestOTP(phoneNumber: params.phone);
      debugPrint('SessionId: ' + session.sessionId);
      var expired = DateTime.parse(session.otpExpired!).toUtc().toLocal();
      var current = DateTime.now();
      yield state.copyWith(
          session: Nullable(session),
          phone: params.phone,
          isLoading: false,
          otpExpired: expired.difference(current).inSeconds);
      if (params.callback != null) params.callback!(null);
    } on AppError catch (e) {
      yield state.copyWith(error: e.message, isLoading: false);
      if (params.callback != null) params.callback!(e.message);
    }
  }

  Stream<AuthenicationState> _checkOTP(CheckOTPAction params) async* {
    try {
      await repository.checkOTP(
          session: state.session!.copyWith(otp: params.otp));
      yield state.copyWith(
        isLoading: false,
      );
      if (params.callback != null) params.callback!(null);
    } on AppError catch (e) {
      yield state.copyWith(error: e.message, isLoading: false);
      if (params.callback != null) params.callback!(e.message);
    }
  }

  Stream<AuthenicationState> _register(RegisterAction params) async* {
    try {
      await repository.register(
          data: RequestRegister(
              username: state.phoneNumber,
              password: params.password,
              sessionId: state.session?.sessionId ?? ''));
      yield state.copyWith(isLoading: false);
      if (params.callback != null) params.callback!(null);
    } on AppError catch (e) {
      yield state.copyWith(error: e.message, isLoading: false);
      if (params.callback != null) params.callback!(e.message);
    }
  }

  Stream<AuthenicationState> _requestNuclentLogin(
      RequestNuclentAction params) async* {
    try {
      var result = await repository.requestNuclentLogin(
          username: params.username, password: params.password);
      // save to stroage
      var session = AuthSessionInfo(
          accessToken: result.accessToken,
          phoneNumber: params.username,
          others: {
            'expiresIn': DateTime.now()
                .add(Duration(seconds: result.expiresIn))
                .millisecondsSinceEpoch
          });
      domain.headers = {
        ...domain.headers,
        'Authorization': 'Bearer ${result.accessToken}'
      };
      await storageTokenProcessor.save(sessionInfo: session);
      var userId = await repository.getUserId();
      session.others['userId'] = userId;
      await storageTokenProcessor.save(sessionInfo: session);
      var parsedPhone = await PhoneNumberUtil().parse('+${params.username}');
      yield state.copyWith(
          isLoading: false,
          userId: userId,
          phone: '0${parsedPhone.nationalNumber}');
      if (params.callback != null) params.callback!(null);
    } on AppError catch (e) {
      yield state.copyWith(error: e.message, isLoading: false);
      if (params.callback != null) params.callback!(e.message);
    }
  }
}
