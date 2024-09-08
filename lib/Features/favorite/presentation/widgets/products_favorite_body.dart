import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:sahel_net/Features/favorite/presentation/widgets/products_favorite_item.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/deatils_product/details_product_seller.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../hiraj/data/models/hiraj_model.dart';

class ProductsFavoriteBody extends StatelessWidget {
  const ProductsFavoriteBody({
    super.key,
    required this.products,
  });

  final List<ProductData> products;

  @override
  Widget build(BuildContext context) {
    List<ProductData>? productsData = products;
    // .reversed.toList();
    return productsData.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimationLimiter(
              child: ListView.builder(
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 1, mainAxisSpacing: 2, crossAxisSpacing: 2),
                itemCount: productsData.length,

                itemBuilder: (context, index) {
                  ProductData? productData = productsData[index];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1200),
                    child: SlideAnimation(
                      verticalOffset: -120,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            print('//////885588');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsProductSeller(
                                    showFavorite: false,
                                    productsSeller: products[index],
                                    hirajSellerData: HirajSellerData(),
                                  );
                                },
                              ),
                            );
                          },
                          child: ProductsFavoriteItem(
                            product: productData,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off_outlined,
                size: MediaQuery.sizeOf(context).width / 3,
                color: Colors.black38,
              ),
              Center(
                child: Text(
                  '!! لا يوجد منتجات بالمفضلة ',
                  style: AppStyles.styleBoldPrimary16
                      .copyWith(color: Colors.black38),
                ),
              ),
            ],
          );
  }
}
