import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({
    super.key,
    required this.tabs,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(0))
      ),
     
      child: TabBar(
          tabAlignment: TabAlignment.center,
          indicatorSize: TabBarIndicatorSize.tab,

          unselectedLabelColor: ColorManager.primary,
          unselectedLabelStyle: AppStyles.styleSemiBold10,
          labelStyle: AppStyles.styleBold16.copyWith(
            color: ColorManager.primary7
          ),
          isScrollable: true,
          splashBorderRadius: BorderRadius.circular(20),
          physics: const BouncingScrollPhysics(),
          tabs: tabs),
    );
  }
}

class CustomTapBar2 extends StatelessWidget {
  const CustomTapBar2({
    super.key,
    required this.tabs,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        splashBorderRadius: BorderRadius.circular(20),
        unselectedLabelColor: Colors.blue,
        unselectedLabelStyle: AppStyles.styleSemiBold10,
        labelStyle: AppStyles.styleBold16.copyWith(
          fontSize: getResponsiveSize3(context, size: 10),
            color: ColorManager.lightOrange
        ),
        tabs: tabs);
  }
}
class CustomTapBar3 extends StatelessWidget {
  const CustomTapBar3({
    super.key,
    required this.tabs,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      color: ColorManager.primary7,
      child: TabBar(

          indicatorSize: TabBarIndicatorSize.tab,
          splashBorderRadius: BorderRadius.circular(20),
          unselectedLabelColor: Colors.blue,
          unselectedLabelStyle: AppStyles.styleSemiBold10.copyWith(
            color: Colors.black
          ),
          labelStyle: AppStyles.styleBold16.copyWith(
            fontSize: getResponsiveSize3(context, size: 15),
              color: ColorManager.white
          ),
          tabs: tabs),
    );
  }
}
