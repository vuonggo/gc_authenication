import 'package:core/l10n/generated/l10n.dart' as core_l10;
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'generated_routes.dart';
import 'presentation/components/loadmore.dart';
import 'presentation/initial_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/localization_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Iterable<LocalizationsDelegate<dynamic>> localizations = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      core_l10.S.delegate,
    ];

    return RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(
              complete: Container(),
              waterDropColor: AppColors.primary,
            ),
        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        footerBuilder: () => CustomFooter(builder: (context, status) {
              return LoadMoreFooter(status: status);
            }),
        // Configure default bottom indicator
        headerTriggerDistance: 80.0,
        // header trigger refresh trigger distance
        springDescription:
            const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        // custom spring back animate,the props meaning see the flutter api
        maxOverScrollExtent: 100,
        //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        maxUnderScrollExtent: 0,
        // Maximum dragging range at the bottom
        enableScrollWhenRefreshCompleted: true,
        //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        enableLoadingWhenFailed: true,
        //In the case of load failure, users can still trigger more loads by gesture pull-up.
        hideFooterWhenNotFull: false,
        // Disable pull-up to load more functionality when Viewport is less than one screen
        enableBallisticLoad: true,
        child: Sizer(builder: (context, orientation, deviceType) {
          return BlocBuilder<LocalizationBloc, LocalizationState>(
              buildWhen: (previous, current) =>
                  previous.langauge != current.langauge,
              builder: (context, state) {
                core_l10.S.load(state.currentLocale);
                return MaterialApp(
                  localizationsDelegates: localizations,
                  supportedLocales: state.locales,
                  locale: state.currentLocale,
                  theme: CoreAppTheme.of(context),
                  home: Stack(
                    children: [
                      MaterialApp(
                        navigatorObservers: [
                          GetIt.instance<NavigationService>()
                        ],
                        navigatorKey:
                            GetIt.instance<NavigationService>().navigatorKey,
                        initialRoute: '/',
                        onGenerateRoute: generatedRoutes,
                        theme: CoreAppTheme.of(context),
                        localizationsDelegates: localizations,
                        supportedLocales: state.locales,
                        locale: state.currentLocale,
                        builder: (context, child) => MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(textScaleFactor: 1.0),
                            child: child ?? Container()),
                      ),
                      const Positioned.fill(child: LoaderOverlayScreen()),
                      const Positioned.fill(child: InitialScreen()),
                    ],
                  ),
                  builder: (context, child) => MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child ?? Container(),
                  ),
                );
              });
        }));
  }
}
