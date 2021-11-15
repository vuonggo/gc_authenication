import 'package:flutter/material.dart';
import 'package:gc_core/gc_core.dart';
import 'views/signup_account_form.dart';

class SignUpAccountScreen extends StatelessWidget {
  const SignUpAccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: pop,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              extendBodyBehindAppBar: false,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: true,
                iconTheme: Theme.of(context)
                    .appBarTheme
                    .iconTheme
                    ?.copyWith(color: Colors.black),
              ),
              body: const SignUpAccountForm()),
        ));
  }

  Future<bool> pop() async {
    getIt.get<NavigationService>().navigatorKey.currentState?.popUntil(
        (route) =>
            route.settings.name == DeeplinkConstant.loginPage ||
            route.settings.name == DeeplinkConstant.signUpScreen);
    return false;
  }
}
