
import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/shops_body_favorite.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/shops_favorite_item.dart';


import '../../../../core/utils/const/constant_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../data/models/favorite_model.dart';

class ShopsFavoriteBody extends StatelessWidget {
  const ShopsFavoriteBody({
    super.key, required this.shops,

  });

  final List<Shops> shops;

  @override
  Widget build(BuildContext context) {
    return shops.isNotEmpty?AnimationLimiter(
      child: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (context, index) {
          Shops? dataShop = shops[index];
          isFavoriteShop[shops[index].shopId]=shops[index].shopFavorite;
          /// is favorite
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ShopsBodyFavorite(shops: shops[index],);
                  },
                ),
              );
            },
            child: AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: -120,
                child: FadeInAnimation(
                  child: ShopsFavoriteItem(shopData: dataShop),
                ),
              ),
            ),
          );
        },
      ),
    ):
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search_off_outlined,size: MediaQuery.sizeOf(context).width/3,color:Colors.black38,),
         Center(child: Text('!! لا يوجد محلات بالمفضلة ',style: AppStyles.styleBoldPrimary16.copyWith(
            color: Colors.black38
        ))),
      ],
    );

  }
}
