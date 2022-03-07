import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/localization_bloc.dart';
import 'app.dart';
import 'di/build_di_application.dart';
import 'firebase/firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initDIApplication();
  final localizationBloc = await getIt.getAsync<LocalizationBloc>();
  Bloc.observer = SimpleBlocDelegate();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => localizationBloc,
        child: Container(),
      )
    ],
    child: const App(),
  ));
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debug(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debug(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debug(error);
  }
}
