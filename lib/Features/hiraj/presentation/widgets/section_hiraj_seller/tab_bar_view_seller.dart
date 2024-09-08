import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_hiraj_seller/tab_body_products_items.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/const/constant_manager.dart';
import '../../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../data/models/hiraj_model.dart';
import '../deatils_product/details_product_seller.dart';

class TabBarViewSeller extends StatelessWidget {
  const TabBarViewSeller({
    super.key,
    required this.tabs,
    required this.sellerData,
  });

  final List<Tab> tabs;
  final List<HirajSellerData> sellerData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TabBarView(
          children: tabs.map((e) {
            int indexTab = tabs.indexOf(e);
            List<ProductData> product =
                sellerData[indexTab].products?.productData ?? [];

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 16 / 14,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 200,
              ),
              itemCount: product.length,
              itemBuilder: (context, index) {
                final reversedIndex = product.length - 1 - index;
                /// favorite seller
                // sellerFavoriteIsSelected= sellerData[reversedIndex].sellerFavorite??0;
                isFavoriteSeller[sellerData[reversedIndex].idHirajSeller]=sellerData[reversedIndex].sellerFavorite;

                return GestureDetector(
                  onTap: () {
                    AppAnalysisCubit.get(context).entryProduct(

                        idSeller: product[reversedIndex].idSellerProduct ?? 0,
                        idProduct: product[reversedIndex].idProduct ?? 0);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return DetailsProductSeller(
                            showFavorite: true,
                              productsSeller: product[reversedIndex],
                              hirajSellerData: sellerData[indexTab]);
                        },
                      ),
                    );
                  },
                  child: TabBodyProductsItems(
                    productData: product[reversedIndex],
                    sellerData: sellerData[indexTab],
                  ),
                );
              },
            );
          }).toList()),
    );
  }
}