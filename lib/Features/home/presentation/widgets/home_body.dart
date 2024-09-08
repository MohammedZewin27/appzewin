import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/widgets/custom_advertisement.dart';
import 'package:sahel_net/Features/home/presentation/widgets/shop_by_rating.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/function/functions.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../data/models/home_model.dart';
import 'custom_header.dart';
import 'custom_search.dart';
import 'grid_new_products.dart';
import 'lastShopsAdded.dart';
import 'categories_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.categories,
    required this.lastShops,
    required this.lastProducts,
    required this.advertisement,
    required this.shopsRating,
  });

  final Categories? categories;
  final List<ShopsData>? lastShops;
  final List<LastProductsData>? lastProducts;
  final Advertisement? advertisement;
  final ShopsRating? shopsRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 0, right: 0),
      child: CustomScrollView(
        slivers: [
          buildAppBarSliver(context),
          const CustomSearch(),
          CustomAdvertisement(
            advertisement: advertisement ?? Advertisement(),
          ),
          CategoriesView(categoriesModel: categories ?? Categories()),

          LastShopsAdded(lastShops: lastShops ?? []),
          shopsRating?.status == AppString.success
              ? const CustomHeader(
                  text: 'اعلى تقييم',
                )
              : const SizedBox(),
          ShopByRating(
            shopsRating: shopsRating ?? ShopsRating(),
          ),

          const CustomHeader(
            text: 'المنتجات الجديدة',
          ),
          CustomGridNewProducts(
            lastProducts: lastProducts ?? [],
          ),
        ],
      ),
    );
  }
}
