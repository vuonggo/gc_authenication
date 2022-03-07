part of 'localization_bloc.dart';

enum Language { en, vi }

class LocalizationState {
  final List<Locale> locales;
  final Language langauge;
  Locale get currentLocale {
    switch (langauge) {
      case Language.vi:
        return locales.firstWhere((element) => element.languageCode == 'vi');
      default:
        return locales.firstWhere((element) => element.languageCode == 'en');
    }
  }

  LocalizationState(
      {this.locales = const [Locale('en', 'US'), Locale('vi', 'VN')],
      this.langauge = Language.en});
}
