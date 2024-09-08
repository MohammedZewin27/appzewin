import 'package:flutter/material.dart';

import '../../../../../core/utils/const/constant_manager.dart';
import '../../../../../core/utils/widgets/custom_communication/Communication_model.dart';
import '../../../../../core/utils/widgets/custom_communication/custom_shop_communication.dart';
import '../../../data/models/home_model.dart';

class CustomCommunicationShop extends StatelessWidget {
  const CustomCommunicationShop({
    super.key,
    required this.shopsData,
  });

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomShopCommunication(
        isFavorite:isFavoriteShop[shopsData.shopId]==1 ,
        id: shopsData.shopId??1,///-----------------------------,
        communicationModel: CommunicationModel(
          details:shopsData.shopInformation??'' ,
            phone: shopsData.shopPhone ?? '',
            location: shopsData.locationShop ?? '',
            urlImage: shopsData.shopImage ?? '',
            title: shopsData.shopName ?? ''),
      ),
    );
  }
}
