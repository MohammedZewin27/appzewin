import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';

import '../../../../../core/utils/widgets/cashed_image.dart';

import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../data/models/home_model.dart';

class TapBarBody extends StatelessWidget {
  const TapBarBody({
    super.key,
    required this.shop,
  });

  final ShopsData shop;

  @override
  Widget build(BuildContext context) {
    return MyBoxContainer(
      radius: 8,
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedImage(
                    url: shop.shopImage ?? '',
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomShopCommunication(
                    //   communicationModel: CommunicationModel(
                    //     details: shop.shopInformation ?? '',
                    //     phone: shop.shopPhone ?? '',
                    //     location: shop.locationShop ?? '',
                    //     urlImage: shop.shopImage ?? '',
                    //     title: shop.shopName ?? '',
                    //   ),
                    //   size: 15,
                    //   showFavorite: false,
                    //   id: shop.shopId ?? 1,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomRating(
                        rating: double.parse(shop.ratingShop ?? '1'),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              shop.shopName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                              style: AppStyles.styleBold16
                                  .copyWith(color: Colors.black),
                            ),
                            Center(
                              child: Text(
                                shop.shopInformation ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                                style: AppStyles.styleRegular14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
