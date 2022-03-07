import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:localization_bloc/localization_bloc.dart';
import 'presentation/tabbar_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generatedRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case DeeplinkConstant.homeScreen:
      return MaterialPageRoute(
          builder: (context) => const TabbarController(),
          settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (context) => const TabbarController(),
          settings: routeSettings);
  }
}

Widget _localizationWidget(Widget child) {
  return BlocBuilder<LocalizationBloc, LocalizationState>(
      buildWhen: (previous, current) => previous.langauge != current.langauge,
      builder: (context, state) => child);
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
