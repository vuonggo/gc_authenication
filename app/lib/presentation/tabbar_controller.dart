import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../generated_images.dart';
import 'components/custom_tabbar.dart';
import 'package:core/core.dart';
import 'package:core/l10n/generated/l10n.dart';

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
            navBarHeight: 64,
            selectedIndex: controller.index,
            items: items,
            onItemSelected: (index) {
              controller.jumpToTab(index);
            }),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [const Home(), Container(), Container(), Container()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    const textStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Ic.home,
          color: AppColors.primary,
        ),
        title: S.of(context).home,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.inactiveColor,
        textStyle: textStyle,
        inactiveIcon: SvgPicture.asset(
          Ic.home,
          color: AppColors.inactiveColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Ic.document,
          color: AppColors.primary,
        ),
        title: S.of(context).document,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.inactiveColor,
        textStyle: textStyle,
        inactiveIcon: SvgPicture.asset(
          Ic.document,
          color: AppColors.inactiveColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Ic.notification,
          color: AppColors.primary,
        ),
        title: S.of(context).notification,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.inactiveColor,
        textStyle: textStyle,
        inactiveIcon: SvgPicture.asset(
          Ic.notification,
          color: AppColors.inactiveColor,
        ),
      ),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Ic.user, color: AppColors.primary),
          title: S.of(context).profile,
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.inactiveColor,
          textStyle: textStyle,
          inactiveIcon:
              SvgPicture.asset(Ic.user, color: AppColors.inactiveColor)),
    ];
  }

  void showMenuBottomSheet(BuildContext context) async {
    var qrcode = await getIt
        .get<NavigationService>()
        .goTo(deeplink: DeeplinkConstant.qrCameraScreen);
    if (qrcode is String) {
      var data = qrcode.split('|');
      if (data.isNotEmpty && data[0] == 'people' || data[0] == 'patient') {
        await getIt
            .get<NavigationService>()
            .goTo(deeplink: DeeplinkConstant.addPatients, arguments: data);
      } else {
        Popup.showError(context, message: 'Mã QRCode không đúng định dạng.');
      }
    }
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonContainer(
          text: Text(S.of(context).submit_btn),
          press: () {
            var language = context.read<LocalizationBloc>().state.langauge;
            context.read<LocalizationBloc>().add(SwitchLanguageEvent(
                language: language == Language.vi ? Language.en : Language.vi));
          },
        )
      ],
    );
  }
}
