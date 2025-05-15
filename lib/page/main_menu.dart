import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:physiomobile/page/counter/counter_page.dart';
import 'package:physiomobile/page/submit/submit_page.dart';
import 'package:physiomobile/page/posts/posts_page.dart';
import 'package:physiomobile/themes/themes.dart';

class MainMenu extends ConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PersistentTabView(
      context,
      backgroundColor: appColors.backgroundPrimary,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      onWillPop: (context) async => false,
      stateManagement: true,
      navBarStyle: NavBarStyle.style10,
      animationSettings: const NavBarAnimationSettings(
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      screens: const [
        PostsPage(),
        SubmitPage(),
        CounterPage(),
      ],
      items: [
        _ItemNavigationBottom(
          icon: const Icon(
            Icons.apps_rounded,
            size: 22,
          ),
          title: 'List data',
        ),
        _ItemNavigationBottom(
          icon: const Icon(
            Icons.edit_document,
            size: 22,
          ),
          title: 'Input Data',
        ),
        _ItemNavigationBottom(
          icon: const Icon(
            Icons.plus_one_rounded,
            size: 22,
          ),
          title: 'Counter',
        ),
      ],
      onItemSelected: (index) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

class _ItemNavigationBottom extends PersistentBottomNavBarItem {
  _ItemNavigationBottom({
    required icon,
    required title,
    activeColorPrimary = const Color(0xffcba258),
    inactiveColorPrimary = const Color(0xFF474F50),
    activeColorSecondary = Colors.white,
  }) : super(
          icon: icon,
          title: title,
          activeColorPrimary: activeColorPrimary,
          inactiveColorPrimary: inactiveColorPrimary,
          activeColorSecondary: activeColorSecondary,
          textStyle: AppTextStyle.navBottom,
        );
}
