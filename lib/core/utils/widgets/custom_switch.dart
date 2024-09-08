import 'package:flutter/material.dart';

import '../theme/color_manager.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.onChanged, required this.value});
  final void Function(bool) onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return   Theme(
      data: ThemeData(
        useMaterial3: true,
      ).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(outline: ColorManager.primary7),
      ),
      child: Transform.scale(scale: .6,
        child: Switch(
          activeTrackColor: ColorManager.primary7,
          inactiveTrackColor:ColorManager.primary7.withOpacity(.2),
          activeColor:  ColorManager.primary7.withOpacity(.2),
          value:value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}