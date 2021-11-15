import 'package:bloc/bloc.dart';
import 'package:gc_core/gc_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cpnetworking_service/flutter_cpnetworking_service.dart';
import 'app.dart';
import 'di/build_di_application.dart';
import 'package:authenication_bloc/authenication_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  // init all configs for application
  WidgetsFlutterBinding.ensureInitialized();
  await initDIApplication();

  Bloc.observer = SimpleBlocDelegate();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenicationBloc>(
        create: (context) => getIt.get<AuthenicationBloc>()),
  ], child: const App()));
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
