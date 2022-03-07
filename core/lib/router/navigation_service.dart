import 'package:flutter/material.dart';
import '/helper/debug.dart';
import 'deeplink_constant.dart';

class NavigationService extends NavigatorObserver {
  Route<dynamic>? previousRoute;
  Route<dynamic>? currentRoute;

  List<Route<dynamic>> routesStack = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      debug('Cannot navigate to $routeName');
    }
  }

  // back to last page.
  void goback({Object? object}) {
    var state = navigatorKey.currentState;
    if (state != null && state.canPop()) {
      return state.pop(object);
    }
  }

  // use this function to move all detail in application
  Future<dynamic> goTo({required String deeplink, Object? arguments}) async {
    var deeplinkWithoutParams = deeplink;
    if (deeplinkWithoutParams.contains('?')) {
      deeplinkWithoutParams = deeplink.substring(0, deeplink.indexOf('?'));
      arguments = deeplink.substring(deeplink.indexOf('?'), deeplink.length);
    }
    return navigateTo(deeplinkWithoutParams, arguments: arguments);
  }

  Future<void> goToLoginScreen({bool isModal = false}) {
    return goTo(deeplink: DeeplinkConstant.loginPage, arguments: isModal);
  }

  void replace({required String deeplink, Object? arguments}) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!
        .pushReplacementNamed(deeplink, arguments: arguments);
  }

  void goToMainVC() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  void popBackSteps(int step) {
    var count = 0;
    navigatorKey.currentState?.popUntil((_) => count++ >= step);
  }

  void popUntil(String deeplink) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(deeplink));
  }

  void popToRootBeforeLogin() {
    navigatorKey.currentState?.popUntil((route) =>
        route.settings.name == DeeplinkConstant.loginPage ||
        route.settings.name == DeeplinkConstant.signUpScreen ||
        route.settings.name == '/');

    goback();
  }

  void popToBefore(String deeplink,
      {Object? object, String defaultRoot = '/'}) {
    navigatorKey.currentState?.popUntil((route) =>
        route.settings.name == deeplink || route.settings.name == defaultRoot);
    goback(object: object);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debug('${route.settings.name} pushed');
    this.previousRoute = previousRoute;
    currentRoute = route;
    routesStack.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debug('${route.settings.name} popped');
    debug('previous ${previousRoute?.settings.name}');
    routesStack.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debug(
        '${oldRoute?.settings.name} is replaced by ${newRoute?.settings.name}');
    routesStack.remove(oldRoute);
    if (newRoute != null) {
      routesStack.add(newRoute);
    }
  }

  @override
  void didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    debug('${route?.settings.name} removed');
    if (route != null) {
      routesStack.remove(route);
    }
  }
}
