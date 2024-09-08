import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/valus_manager.dart';
import 'navigation_bar_icons.dart';

class BottomNavBarSeller extends StatelessWidget {
  const BottomNavBarSeller(
      {super.key,
        required this.indexPage,
        required this.onTap,
        required this.itemCount});

  final int indexPage;
  final int itemCount;

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      borderColor: ColorManager.white,
      splashColor: ColorManager.yellow,
      elevation: AppSize.s60,
      activeIndex: indexPage,
      gapLocation: GapLocation.center,
      notchSmoothness:  NotchSmoothness.defaultEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: onTap,
      backgroundColor: Colors.white,
      itemCount: itemCount,
      tabBuilder: (int index, bool isActive) {
        return NavigationBarIcons(
          index: index,
          isActive: isActive,
        );
      },
      //other params
    );
  }
}
