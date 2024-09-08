import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/products_items_rating.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../../../core/utils/const/constant_manager.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../data/models/hiraj_model.dart';
import 'deatils_product/details_product_seller.dart';

class GridHirajProductsRating extends StatelessWidget {
  const GridHirajProductsRating({
    super.key,
    required this.productData,
  });

  final List<ProductData> productData;

  @override
  Widget build(BuildContext context) {
    List<ProductData> products = [];
    if (products.length < 16) {
      products = productData;
    } else {
      products = [];
    }

    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        color: ColorManager.ofWhite.withOpacity(.05),
        child: productData.isNotEmpty
            ? AnimationLimiter(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    // int indexReversed=products.length-1-index;
                    //  sellerFavoriteIsSelected=products[indexReversed].productFavorite??0;
                    isFavoriteProduct[products[index].idProduct] =
                        products[index].productFavorite;
                    print(isFavoriteProduct);
                    // return ProductItem(productItemData: productData[index]);
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 120,
                        child: FadeInAnimation(
                          child: GestureDetector(
                              onTap: () {
                                AppAnalysisCubit.get(context).entryProduct(
                                  idSeller:
                                      productData[index].idSellerProduct ?? 0,
                                  idProduct: productData[index].idProduct ?? 0,
                                );
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return DetailsProductSeller(
                                          showFavorite: true,
                                          productsSeller: products[index],
                                          hirajSellerData: products[index]
                                              .seller!
                                              .hirajSellerData![0]);
                                    },
                                  ),
                                );
                              },
                              child: ProductsItemsRating(
                                  productData: products[index])),
                        ),
                      ),
                    );
                  },
                ),
              )
            : null,
      ),
    );
  }
}
