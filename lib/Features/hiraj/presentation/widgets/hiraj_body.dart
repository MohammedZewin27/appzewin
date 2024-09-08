import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/products_by_rating.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_hiraj_category/hiraj_category.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_hiraj_seller/section_hiraj_seller.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_products/hiraj_products.dart';

import '../../../../core/utils/function/functions.dart';
import '../../../home/presentation/widgets/custom_search.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';
import '../../data/models/hiraj_model.dart';
import '../cubit/hiraj_cubit.dart';

class HirajBody extends StatelessWidget {
  const HirajBody({
    super.key,
    required this.hirajData,
    required this.sellerData, required this.productData, required this.productsRating,
  });

  final List<HirajData> hirajData;
  final List<HirajSellerData> sellerData;
  final  List<ProductData> productData;
  final ProductsRating productsRating;



  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        SettingCubit.get(context).fetchUserData();
        return HirajCubit.get(context).fetchHiraj(idParent:    ParentCubit.get(context).parentId);

        ///   idParent
      },
      child: CustomScrollView(
        slivers: [
          buildAppBarSliver(context),
          const CustomSearch(),
          HirajCategoryView(hirajData: hirajData),
          SectionHirajSeller(sellerData: sellerData),
          HirajProducts(productData: productData,),
          ProductsByRating(productsRating:productsRating ,),


        ],
      ),
    );
  }
}



