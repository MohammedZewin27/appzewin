import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../data/models/home_model.dart';
import 'shops/app_bar_shop_body.dart';
import 'shops/shops_body.dart';

class ShopBodyView extends StatelessWidget {
  const ShopBodyView({super.key, required this.shopsData});

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.33,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: ColorManager.primary7.withOpacity(1),
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  // width: MediaQuery.sizeOf(context).width/2,
                  decoration: BoxDecoration(
                     color: ColorManager.primary7.withOpacity(.5),
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
                              shopsData.shopName ?? '',
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
                      AppBarShopBody(
                        shopsData: shopsData,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ShopsBody(shopsData:shopsData ,),
      ),
    );
  }
}




