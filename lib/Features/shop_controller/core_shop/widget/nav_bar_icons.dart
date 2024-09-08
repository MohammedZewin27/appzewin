import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../seller/core/const.dart';
import '../const/const_shop.dart';


class NavigationBarIconsShop extends StatelessWidget {
  const NavigationBarIconsShop({
    super.key,
    required this.index,
    required this.isActive,
  });

  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isActive ? iconActiveListShop[index] : iconListShop[index],
          size: 24,
          color: isActive ? ColorManager.primary : ColorManager.grey,
        ),
        Text(
          titleListIconShop[index],
          style: isActive
              ? const TextStyle(fontSize: 10, color: ColorManager.primary)
              : const TextStyle(fontSize: 10, color: ColorManager.black),
        ),
      ],
    );
  }
}