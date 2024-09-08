import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../data/models/hiraj_model.dart';
import '../deatils_product/details_product_seller.dart';
import 'grid_hiraj_products_items.dart';

class ShowAllProducts extends StatelessWidget {
  const ShowAllProducts({super.key, required this.productData});
  final List<ProductData> productData;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('كافة المنتجات',style: AppStyles.styleSemiBold16,),
        ),
        body:productData.isNotEmpty
            ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing:0),
          // scrollDirection: Axis.horizontal,
          itemCount: productData.length,
          // reverse: true,
          itemBuilder: (context, index) {
            final reversedIndex = productData.length - 1 - index;


            return GestureDetector(
                onTap: () {
                  AppAnalysisCubit.get(context).entryProduct(

                      idSeller: productData[reversedIndex].idSellerProduct ?? 0,
                      idProduct: productData[reversedIndex].idProduct ?? 0);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return DetailsProductSeller(
                          showFavorite: true,
                            productsSeller: productData[reversedIndex],
                            hirajSellerData: productData[reversedIndex]
                                .seller!
                                .hirajSellerData![0]);
                      },
                    ),
                  );
                },
                child:
                ProductsItems(productData: productData[reversedIndex]));
          },
        )
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          reverse: true,
          itemBuilder: (context, index) {
            // return ProductItem(productItemData: productData[index]);
            return ProductsItems(
                productData: ProductData(
                    imageProduct: AppString.emptySellerImage,
                    titleProduct: AppString.emptyTitleProduct,
                    detailsProduct: AppString.emptyDetailsProduct));
          },
        )
    );



  }
}