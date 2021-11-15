import 'package:gc_core/gc_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart' as authenication;
import 'package:gc_core/l10n/generated/l10n.dart' as core;
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'generate_route.dart';
import 'presentation/components/loadmore.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Iterable<LocalizationsDelegate<dynamic>> localizations = [
      authenication.S.delegate,
      core.S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    Iterable<Locale> locales = const [
      Locale('en', 'US'),
      Locale('vi', 'VN'),
    ];
    var locale = const Locale('vi', 'VN');
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return RefreshConfiguration(
        headerBuilder: () => const WaterDropHeader(
              waterDropColor: Colors.black,
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
        // trigger load more by BallisticScrollActivity
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
              navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
              initialRoute: '/',
              onGenerateRoute: generateRoute,
              theme: CoreAppTheme.of(context),
              localizationsDelegates: localizations,
              supportedLocales: locales,
              locale: locale,
              builder: (context, child) => MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child ?? Container(),
                  ));
        }));
  }
}
