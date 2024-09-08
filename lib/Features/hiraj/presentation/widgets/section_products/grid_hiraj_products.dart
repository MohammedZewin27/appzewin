import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/core/utils/function/functions.dart';
import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/const/constant_manager.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../data/models/hiraj_model.dart';
import '../deatils_product/details_product_seller.dart';
import 'grid_hiraj_products_items.dart';

class GridHirajProducts extends StatelessWidget {
  const GridHirajProducts({
    super.key,
    required this.productData,
  });

  final List<ProductData> productData;

  @override
  Widget build(BuildContext context) {
    List<ProductData> products = productData
        .sublist(productData.length - lastItems(data: productData, number: 20));
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        color: ColorManager.ofWhite.withOpacity(.05),
        child: productData.isNotEmpty
            ? AnimationLimiter(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, crossAxisSpacing: 5, mainAxisSpacing: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    int indexReversed=products.length-1-index;
                  //  sellerFavoriteIsSelected=products[indexReversed].productFavorite??0;
                    isFavoriteProduct[products[indexReversed].idProduct] =
                        products[indexReversed].productFavorite;
                    print(isFavoriteProduct);
                    // return ProductItem(productItemData: productData[index]);
                    return AnimationConfiguration.staggeredList(
                      position: index,///<----------------
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 120,
                        child: FadeInAnimation(
                          child: GestureDetector(
                              onTap: () {
                                AppAnalysisCubit.get(context).entryProduct(

                                    idSeller: productData[indexReversed].idSellerProduct ?? 0,
                                    idProduct: productData[indexReversed].idProduct ?? 0);
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(

                                    builder: (context) {
                                      return DetailsProductSeller(
                                        showFavorite: true,
                                          productsSeller: productData[indexReversed],
                                          hirajSellerData: productData[indexReversed]
                                              .seller!
                                              .hirajSellerData![0]);
                                    },
                                  ),
                                );
                              },
                              child:
                                  ProductsItems(productData: products[indexReversed])),
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
