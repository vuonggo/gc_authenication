import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_state.dart';
part 'localization_event.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc({Language language = Language.en})
      : super(LocalizationState(langauge: language));

  @override
  Stream<LocalizationState> mapEventToState(LocalizationEvent event) async* {
    if (event is SwitchLanguageEvent) {
      yield LocalizationState(langauge: event.language);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('language', event.language.index);
    }
  }

  static Future<Language> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    var index = prefs.getInt('language') ?? 0;
    var language = index == 0 ? Language.en : Language.vi;
    return language;
  }
}
