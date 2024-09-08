import 'package:flutter/cupertino.dart';
import 'package:sahel_net/Features/hiraj/data/models/hiraj_model.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/deatils_product/details_product_seller.dart';
import 'package:sahel_net/Features/home/presentation/widgets/product_item.dart';
import 'package:sahel_net/core/utils/const/constant_manager.dart';

import '../../data/models/home_model.dart';

class CustomGridNewProducts extends StatelessWidget {
  const CustomGridNewProducts({
    super.key,
    required this.lastProducts,
  });

  final List<LastProductsData> lastProducts;

  @override
  Widget build(BuildContext context) {
    return lastProducts.isNotEmpty
        ? SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 9 / 16),
            itemCount: lastProducts.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      isFavoriteProduct[lastProducts[index].idProduct] =
                          lastProducts[index].productFavorite;
                      print(isFavoriteProduct);
                      return DetailsProductSeller(
                        showFavorite: true,
                          productsSeller: ProductData(
                            parentId: lastProducts[index]
                                .hirajname!
                                .hirajData?[0]
                                .idHiraj,
                            qualityProduct: lastProducts[index].qualityProduct,
                            idProduct: lastProducts[index].idProduct,
                            titleProduct: lastProducts[index].titleProduct,
                            newPriceProduct:
                                lastProducts[index].newPriceProduct,
                            oldPriceProduct:
                                lastProducts[index].oldPriceProduct,
                            deliveryService:
                                lastProducts[index].deliveryService,
                            detailsProduct: lastProducts[index].detailsProduct,
                            imageProduct: lastProducts[index].imageProduct,
                            ratingProduct: lastProducts[index].ratingProduct,
                            productImages: lastProducts[index].productImages,
                            productFavorite:
                                lastProducts[index].productFavorite,
                          ),
                          hirajSellerData:
                              lastProducts[index].seller!.hirajSellerData?[0]);
                    },
                  ));
                },
                child: ProductItem(
                  productItemData: lastProducts[index],
                )),
          )
        : const SliverToBoxAdapter(child: SizedBox());
  }
}
