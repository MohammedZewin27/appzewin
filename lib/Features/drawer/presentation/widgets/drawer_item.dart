import 'package:flutter/material.dart';


import '../../../home/presentation/widgets/active_inactive_item_drawer.dart';
import '../../data/models/drawer_item_model.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.itemModel, required this.isActive,});

  final DrawerItemModel itemModel;


  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveDrawerItem(itemModel: itemModel)
        : InActiveDrawerItem(itemModel: itemModel);
  }
}
