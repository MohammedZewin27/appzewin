import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/Features/home/data/models/home_model.dart';
import 'package:sahel_net/Features/home/presentation/widgets/shop_body_view.dart';



// import '../../data/models/home_model.dart';
import '../../../../core/utils/const/constant_manager.dart';
import 'custom_header.dart';
import 'last_shop/item_last_shop.dart';

class LastShopsAdded extends StatelessWidget {
  const LastShopsAdded({super.key, required this.lastShops});

  final List<ShopsData> lastShops;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: lastShops.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomHeader2(text: 'مضاف حديثاً'),
                AspectRatio(
                  aspectRatio: 2,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: lastShops.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            horizontalOffset: 120,
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                       // sellerFavoriteIsSelected= lastShops[index].shopFavorite!;

                                        isFavoriteShop[lastShops[index].shopId]=lastShops[index].shopFavorite;

                                        return ShopBodyView(
                                            shopsData: lastShops[index]);

                                        // );
                                      },
                                    ),
                                  );
                                },
                                child: ItemLastShop(lastShop: lastShops[index]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            ),
    );
  }
}
