import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';

import '../../../data/models/home_model.dart';

class ItemLastShop extends StatelessWidget {
  const ItemLastShop({
    super.key,
    required this.lastShop,
  });

  final ShopsData lastShop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          clipBehavior: Clip.antiAlias,

          margin: const EdgeInsets.only(left: 5, right: 8,),
          decoration: BoxDecoration(
            
            borderRadius:  BorderRadius.circular(6
            ),


          ),

          child: Card(
            elevation: 4,
            child: Column(
              children: [
            
                Expanded(
                  child: CachedImage(url: '${lastShop.shopImage}' ?? ''),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(lastShop.shopName ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                  style: AppStyles.styleRegular16
                                      .copyWith(
                                    fontSize: 14,
                                      // color: Colors.black
                                      fontWeight: FontWeight.w900)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(lastShop.shopInformation ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                  style: AppStyles.styleRegular12),
                            ),
                             SizedBox(height: getResponsiveSize(context, size: 20),)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 11,
            top: 4,
            child: Image.asset(Assets.imagesNew2,width: 35,height: 35,)),
        Positioned(
             left:8,
            top: -1,
            child: Image.asset(Assets.imagesNew,width: 35,height: 35,)),
      ],
    );
  }
}
