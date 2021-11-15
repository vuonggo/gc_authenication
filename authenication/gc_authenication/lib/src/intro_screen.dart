import 'package:flutter/material.dart';
import 'package:gc_authenication/generated_images.dart';
import 'package:gc_authenication/l10n/generated/l10n.dart';
import 'package:gc_core/gc_core.dart';
import 'policy_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(Img.bg, fit: BoxFit.cover)),
        Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
              iconTheme: Theme.of(context)
                  .appBarTheme
                  .iconTheme
                  ?.copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned.fill(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(Img.appIcon),
                    ),
                    Text(
                      S.current.intro1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                        padding: AppConsts.mHorizontal,
                        child: Text(
                          S.current.intro2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        )),
                    const SizedBox(height: 24),
                    Padding(
                      padding: AppConsts.mHorizontal,
                      child: ButtonContainer(
                          icon: Container(),
                          text: Text(
                            S.current.login,
                            style: const TextStyle(color: Colors.white),
                          ),
                          press: pressLogin),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: AppConsts.mHorizontal,
                      child: ButtonContainer(
                          color: AppColors.cardBorderColor,
                          icon: Container(),
                          text: Text(
                            S.current.sign_up,
                            style: const TextStyle(color: AppColors.primary),
                          ),
                          press: pressSigunp),
                    ),
                  ],
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: AppConsts.kDefaultPadding),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: _policy(context),
                      ),
                    )))
              ],
            ))
      ],
    );
  }

  Widget _policy(BuildContext context) {
    final textSpans = <InlineSpan>[];
    final text = S.of(context).policy('#a', '#b');
    final regex = RegExp(r'\#(\w+)|@(\w+)');
    final Iterable<Match> matches = regex.allMatches(text);
    const style = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400);
    var start = 0;
    for (final match in matches) {
      textSpans.add(
          TextSpan(text: text.substring(start, match.start), style: style));
      if (match.group(1) == 'a') {
        textSpans.add(WidgetSpan(
            child: GestureDetector(
                onTap: () => {PolicyScreen.show(context)},
                child: Text(S.of(context).rules,
                    style: style.copyWith(color: AppColors.primary)))));
      } else if (match.group(1) == 'b') {
        textSpans.add(TextSpan(text: S.of(context).galaxyCare, style: style));
      }

      start = match.end;
    }
    textSpans.add(TextSpan(text: text.substring(start, text.length)));
    return Text.rich(
      TextSpan(children: textSpans),
      style: style,
      textAlign: TextAlign.center,
    );
  }

  void pressLogin() {
    getIt.get<NavigationService>().goTo(deeplink: DeeplinkConstant.loginPage);
  }

  void pressSigunp() {
    getIt
        .get<NavigationService>()
        .goTo(deeplink: DeeplinkConstant.signUpScreen);
  }
}
