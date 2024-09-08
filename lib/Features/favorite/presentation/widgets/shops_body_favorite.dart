
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../home/presentation/widgets/shops/information_shop.dart';
import '../../data/models/favorite_model.dart';

class ShopsBodyFavorite extends StatelessWidget {
  const ShopsBodyFavorite({super.key, required this.shops});

  final Shops shops;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: MediaQuery.sizeOf(context).height * .33,
                forceElevated: innerBoxIsScrolled,
                centerTitle: true,
                pinned: true,
                titleSpacing: 0,
                backgroundColor: ColorManager.grey,
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    // width: MediaQuery.sizeOf(context).width/2,
                    decoration: BoxDecoration(
                      color: ColorManager.grey.withOpacity(.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    height: 60,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                shops.shopName.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: AppStyles.styleSemiBold20.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // const CustomIconFavorite(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: CachedImage(url: shops.shopImage ?? ''),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // CustomCommunication2(
                  //   communicationModel: CommunicationModel(
                  //       phone: shops.shopPhone ?? '',
                  //       location: shops.locationShop ?? '',
                  //       urlImage: shops.shopImage ?? '',
                  //       details: shops.shopInformation ?? '',
                  //       title: shops.shopName ?? ''),
                  // ),
                  CustomInformation(
                    shops: shops,
                  )
                ],
              ),
            ),
          )),
    );
  }
}


