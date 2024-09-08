import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../generated/assets.dart';
import '../theme/strings_manager.dart';
import '../theme/styles_manager.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({
    super.key,
    this.size, this.isColorsWhite=true,
  });

  final double? size;
  final bool? isColorsWhite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: size ?? 35,
            width: size ?? 35,
          ),
          Row(
            children: [
              Text(
                AppString.appNamePremiere,
                style: AppStyles.styleSemiBoldQahiri6.copyWith(
                  color: isColorsWhite==true?Colors.white:ColorManager.primary7,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                AppString.appNameMaster,
                style: AppStyles.styleSemiBoldQahiri3
                    .copyWith(color: isColorsWhite==true?Colors.white:ColorManager.primary7,),
              ),
            ],
          )
        ],
      ),
    );
  }
}