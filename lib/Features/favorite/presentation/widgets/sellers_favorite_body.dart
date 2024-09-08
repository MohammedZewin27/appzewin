import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/seller_body_in_favorite.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/sellers_favorite_item.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../data/models/favorite_model.dart';

class SellersFavoriteBody extends StatelessWidget {
  const SellersFavoriteBody({
    super.key, required this.sellers,

  });

  final List<Sellers> sellers;

  @override
  Widget build(BuildContext context) {
    return sellers.isNotEmpty?AnimationLimiter(
      child: ListView.builder(
        itemCount: sellers.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                  verticalOffset: -120,
                  child: FadeInAnimation(
                      child:
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context) {
                                  return SellerBodyInFavorite(seller: sellers[index],);
                                },));
                              },
                              child: SellersFavoriteItem(dataSellers: sellers[index])))));
        },
      ),
    ):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search_off_outlined,size: MediaQuery.sizeOf(context).width/3,color:Colors.black38,),
         Center(child: Text('!! لا يوجد بائعين بالمفضلة ',style: AppStyles.styleBoldPrimary16.copyWith(
          color: Colors.black38
        ),)),
      ],
    );
  }
}



