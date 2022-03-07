import 'package:get_it/get_it.dart';
import 'package:localization_bloc/bloc/localization_bloc.dart';

void buildDI() async {
  GetIt.instance.registerFactoryAsync<LocalizationBloc>(() async {
    var language = await LocalizationBloc.getLanguage();
    return LocalizationBloc(language: language);
  });
}
