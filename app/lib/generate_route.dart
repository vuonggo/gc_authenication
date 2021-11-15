import 'package:gc_authenication/gc_authenication.dart';
import 'package:gc_core/gc_core.dart';
import 'package:flutter/material.dart';
import 'presentation/tabbar_controller.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // To navigate to specify screen, inject other module here with deeplink
    case (DeeplinkConstant.loginPage):
      var isModal = routeSettings.arguments;
      if (isModal is bool && isModal) {
        return TransparentRoute(
            builder: (context) => const LoginScreen(
                  isModal: true,
                ),
            settings: routeSettings);
      } else {
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: routeSettings);
      }
    case (DeeplinkConstant.signUpScreen):
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(
                isSignup: true,
              ),
          settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (context) => const TabbarController(),
          settings: routeSettings);
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;
}
