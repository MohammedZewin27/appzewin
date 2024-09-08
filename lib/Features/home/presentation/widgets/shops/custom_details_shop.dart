import 'package:flutter/material.dart';

import '../../../data/models/home_model.dart';
import 'custom_grid_view_images_shop.dart';
import 'custom_information_shop.dart';
import 'custom_shop_services.dart';

class CustomDetailsShop extends StatelessWidget {
  const CustomDetailsShop({
    super.key,
    required this.shopsData,
  });

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomInformationShop(shopsData: shopsData),
       CustomShopServices(shopsData: shopsData),
        CustomGridViewImagesShop(shopsData: shopsData),
      ],
    );
  }
}






