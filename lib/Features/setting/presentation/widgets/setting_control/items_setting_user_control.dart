import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../data/models/items_setting_control_model.dart';
import '../../../data/models/user_date.dart';

class ItemsSettingUserControl extends StatelessWidget {
  const ItemsSettingUserControl({
    super.key,
    required this.itemsSettingControl, this.dataUser,
  });

  final ItemsSettingControlModel itemsSettingControl;
 final UserDataSetting? dataUser;
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
          onTap: itemsSettingControl.onTap,
          title: Text(
            itemsSettingControl.title,
            textDirection: TextDirection.rtl,
            textAlign:itemsSettingControl.titleAlign? TextAlign.start:TextAlign.center,
            style: AppStyles.styleBold16.copyWith(
                color: itemsSettingControl.color??ColorManager.primary
            ),
          ),
          subtitle: Text(
            itemsSettingControl.subtitle,
            textDirection: TextDirection.rtl,
            style: AppStyles.styleSemiBold12.copyWith(
                color: Colors.black54
            ),
          ),
          leading: Image.asset(
            itemsSettingControl.assetsImage,
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}