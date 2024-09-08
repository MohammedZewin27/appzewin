import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../core/const.dart';

class NavigationBarIcons extends StatelessWidget {
  const NavigationBarIcons({
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
          isActive ? iconActiveList[index] : iconList[index],
          size: 24,
          color: isActive ? ColorManager.primary : ColorManager.grey,
        ),
        Text(
          titleList[index],
          style: isActive
              ? const TextStyle(fontSize: 10, color: ColorManager.primary)
              : const TextStyle(fontSize: 10, color: ColorManager.black),
        ),
      ],
    );
  }
}