import 'package:flutter/material.dart';

import '../theme/color_manager.dart';
import '../theme/styles_manager.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({
    super.key,
    required this.title, this.backgroundColor, this.textColor,
  });

  final String title;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: backgroundColor?? ColorManager.primary.withOpacity(.2)),
        onPressed: () {},
        child: Text(
          title,
          style:
          AppStyles.styleRegular16.copyWith(color: textColor??ColorManager.primary7),
        ));
  }
}