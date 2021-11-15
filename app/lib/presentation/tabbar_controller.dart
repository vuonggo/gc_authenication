import 'dart:ui';
import 'package:app/presentation/test_screen.dart';
import 'package:gc_core/gc_core.dart';
import 'package:gc_core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../generated_images.dart';
import 'components/custom_tabbar.dart';

class TabbarController extends StatefulWidget {
  const TabbarController({Key? key}) : super(key: key);

  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = _navBarsItems();
    var controller = getIt.get<PersistentTabController>();
    return PersistentTabView.custom(
      context,
      controller: controller,
      itemCount: items
          .length, // This is required in case of custom style! Pass the number of items for the nav bar.
      screens: _buildScreens(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      customWidget: CustomTabbar(
        confineToSafeArea: false,
        navBarDecoration: const NavBarDecoration(
            colorBehindNavBar: Colors.white,
            borderRadius: BorderRadius.horizontal()),
        navBarEssentials: NavBarEssentials(
            backgroundColor: Colors.white,
            selectedScreenBuildContext: context,
            navBarHeight: kBottomNavigationBarHeight,
            selectedIndex: controller.index,
            items: items,
            onItemSelected: (index) {
              controller.jumpToTab(index);
            }),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [TestScreen(), Container(), Container(), Container(), Container()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    const textStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
    return [
      PersistentBottomNavBarItem(
          icon: Image.asset(
            Img.home,
            color: AppColors.primary,
          ),
          title: S.current.home,
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.inactiveColor,
          textStyle: textStyle,
          inactiveIcon: Image.asset(Img.home)),
      PersistentBottomNavBarItem(
          icon: Image.asset(
            Img.vaccine,
            color: AppColors.primary,
          ),
          title: S.current.family,
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.inactiveColor,
          textStyle: textStyle,
          inactiveIcon: Image.asset(
            Img.vaccine,
          )),
      PersistentBottomNavBarItem(
          onPressed: (context) {
            var context =
                getIt.get<NavigationService>().navigatorKey.currentContext!;
            // TODO: do something
            return null;
          },
          icon: Image.asset(
            Img.filter,
          ),
          iconSize: 0),
      PersistentBottomNavBarItem(
          icon: Image.asset(
            Img.chat,
            color: AppColors.primary,
          ),
          title: S.current.support,
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.inactiveColor,
          textStyle: textStyle,
          inactiveIcon: Image.asset(Img.chat)),
      PersistentBottomNavBarItem(
          icon: Image.asset(
            Img.profile,
            color: AppColors.primary,
          ),
          title: S.current.profile,
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.inactiveColor,
          textStyle: textStyle,
          inactiveIcon: Image.asset(Img.profile)),
    ];
  }
}
