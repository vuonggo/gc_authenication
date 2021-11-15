import 'package:flutter/material.dart';
import 'package:gc_core/di/di_components.dart';
import 'package:gc_core/gc_core.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '/helper/debug.dart';
import 'deeplink_constant.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState != null) {
      debug('Navigating to $routeName');
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

  void replaceHomeScreen() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!
        .pushReplacementNamed(DeeplinkConstant.homeScreen);
    var controller = getIt.get<PersistentTabController>();
    controller.jumpToTab(0);
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
}
