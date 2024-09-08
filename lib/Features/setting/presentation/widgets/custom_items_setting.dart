import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../data/models/items_setting_model.dart';

class CustomItemsSetting extends StatelessWidget {
  const CustomItemsSetting({
    super.key,
    required this.itemsSetting,
  });

  final ItemsSettingModel itemsSetting;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: InkWell(
        onTap: itemsSetting.function,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                itemsSetting.image,
              ),
            ),
            AutoSizeText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines:2,
              itemsSetting.title,
              style: AppStyles.styleSemiBold12
            ),

          ],
        ),
      ),
    );
  }
}
