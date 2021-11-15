import 'package:flutter/material.dart';
import 'package:gc_core/gc_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authenication_bloc/authenication_bloc.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: should call this action at first launch
    context.read<AuthenicationBloc>().add(GetCountryCode());
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            child: Text('Sigin In - Click me'),
            onPressed: () {
              getIt
                  .get<NavigationService>()
                  .goTo(deeplink: DeeplinkConstant.loginPage);
            },
          ),
        ),
      ),
    );
  }
}
