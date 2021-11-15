library gc_authenication;

export 'src/login_screen.dart';
export 'src/otp_screen.dart';
export 'src/signup_account_screen.dart';
export 'src/intro_screen.dart';

import 'package:flutter/material.dart';
import 'package:authenication_bloc/authenication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gc_core/gc_core.dart';

void signIn(BuildContext context,
    {required String username,
    required String password,
    VoidCallback? callback}) {
  // call authen API
  context.read<AuthenicationBloc>().add(RequestNuclentAction(
      username: username,
      password: password,
      callback: (error) {
        // Handle Result/Navigation
        if (error != null) {
          Popup.showError(context, message: error);
        } else {
          callback?.call();
          // Navigate
          getIt.get<NavigationService>().popToRootBeforeLogin();
        }
      }));
}
