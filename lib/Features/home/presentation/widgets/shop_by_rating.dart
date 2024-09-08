import 'package:flutter/material.dart';

import '../../../../core/utils/const/constant_manager.dart';
import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/widgets/custom_rating.dart';
import '../../../../generated/assets.dart';
import '../../data/models/home_model.dart';
import 'shop_body_view.dart';

class ShopByRating extends StatelessWidget {
  const ShopByRating({super.key, required this.shopsRating});

  final ShopsRating shopsRating;

  @override
  Widget build(BuildContext context) {
    List<ShopsData>? list10Shops=[];
    if(shopsRating.shopsData!.length>10){
      list10Shops=shopsRating.shopsData?.sublist(0,10);
    }else{
      list10Shops=shopsRating.shopsData;
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list10Shops?.length,
            reverse: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              // isSelected= list10Shops![index].shopFavorite!;

              isFavoriteShop[list10Shops?[index].shopId]=list10Shops?[index].shopFavorite;

              double rating;
              if (list10Shops?[index].ratingShop != '') {
                rating = double.parse(list10Shops![index].ratingShop!);
              } else {
                rating = 1.0;
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      // sellerFavoriteIsSelected= list10Shops![index].shopFavorite!;
                      return ShopBodyView(
                          shopsData: list10Shops![index]);
                    },
                  ));
                },
                child: Card(
                  elevation: 6,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child:    CustomRating(
                                rating: rating ,
                                ignoreGestures: true,
                                itemSize: getResponsiveSize(context, size: 20),
                              ),
                            ),
                            Text(
                              list10Shops?[index].ratingShop
                                  ?.substring(0, 3) ??
                                  '',
                              style: AppStyles.styleBold16,
                            ),
                            const Spacer(),
                            const Text('حاصل على تقييم',style: AppStyles.styleSemiBold10,),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          AspectRatio(
                            aspectRatio: 1.5,
                            child: CachedImage(
                                url: list10Shops?[index].shopImage ??
                                    ''),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Image.asset(
                              Assets.imagesWinner,width: 35,height: 35,
                            ),),
                        ],
                      ),
                      Text(list10Shops?[index].shopName ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textDirection: TextDirection.rtl,
                        style: AppStyles.styleSemiBold16,
                      ),
                      Text(
                        list10Shops?[index].shopInformation ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textDirection: TextDirection.rtl,

                        style: AppStyles.styleRegular12,
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}