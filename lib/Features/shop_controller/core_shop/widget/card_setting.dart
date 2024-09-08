import 'package:flutter/material.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';

class ItemsSettingUserShopControl extends StatelessWidget {
  const ItemsSettingUserShopControl({
    super.key, this.onTap, required this.title, required this.subtitle, required this.image, this.onLongPress,

  });
  final void Function()? onTap;
  final void Function()? onLongPress;
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 4),
      child: Card(
        elevation: 10,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hoverColor: ColorManager.primary5,
          splashColor: ColorManager.primary.withOpacity(.47),
          onTap:onTap,
          onLongPress:onLongPress ,
          title: Text(
            title,
            textDirection: TextDirection.rtl,

            style: AppStyles.styleBold16.copyWith(
                color: ColorManager.primary
            ),
          ),
          subtitle: Text(
            subtitle,
            textDirection: TextDirection.rtl,
            style: AppStyles.styleSemiBold12.copyWith(
                color: Colors.black54
            ),
          ),
          leading: Image.asset(
            image,
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}