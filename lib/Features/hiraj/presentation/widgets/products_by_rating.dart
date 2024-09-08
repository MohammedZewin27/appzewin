import 'package:flutter/cupertino.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_products/show_all_products.dart';

import '../../../../core/utils/widgets/custom_header_view_all.dart';
import '../../data/models/hiraj_model.dart';
import 'grid_hiraj_products_rating.dart';

class ProductsByRating extends StatelessWidget {
  const ProductsByRating({super.key, required this.productsRating});
  final ProductsRating productsRating;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomHeaderViewAll(
              title: 'اعلي تقييم للمنتجات',
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return ShowAllProducts(productData: productsRating.productData??[],);
                },));
              },
            ),
            GridHirajProductsRating(productData: productsRating.productData??[]),
          ],
        ),
      ),
    );
  }
}



