import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../drawer/data/models/drawer_item_model.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.itemModel,
  });

  final DrawerItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveSize(context, size: 45),
      child: ListTile(
        leading: SizedBox(
          height: 20,
          width: 20,
            child:Icon(itemModel.notActiveIcon,)
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(itemModel.title,

              style: AppStyles.styleSemiBold16
                  .copyWith(fontSize: getResponsiveSize(context, size: 14)),
              textAlign: TextAlign.end),
        ),

      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.itemModel,
  });

  final DrawerItemModel itemModel;

  @override
  Widget build(BuildContext context) {

    return Card(
      color: ColorManager.primary,
      child: ListTile(
        leading: SizedBox(
          height: 20,
          width: 20,
          child:Icon(itemModel.isActiveIcon,color: ColorManager.white,)
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(itemModel.title,
              style: AppStyles.styleSemiBold12
                  .copyWith(
                 color:  Colors.white ),
              textAlign: TextAlign.end),
        ),

      ),
    );
  }
}
