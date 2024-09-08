import 'package:flutter/cupertino.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_products/show_all_products.dart';
import '../../../../../core/utils/widgets/custom_header_view_all.dart';
import '../../../data/models/hiraj_model.dart';
import 'grid_hiraj_products.dart';

class HirajProducts extends StatelessWidget {
  const HirajProducts({
    super.key,
    required this.productData,
  });

  final List<ProductData> productData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomHeaderViewAll(
              title: 'احدث المنتجات',
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return ShowAllProducts(
                        productData: productData,
                      );
                    },
                  ),
                );
              },
            ),
            GridHirajProducts(productData: productData),
          ],
        ),
      ),
    );
  }
}
