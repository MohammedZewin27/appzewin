import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/products_favorite_body.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/sellers_favorite_body.dart';
import 'package:sahel_net/Features/favorite/presentation/widgets/shops_favorite_body.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';


import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../core/utils/widgets/logo_app_bar.dart';
import '../../../hiraj/data/models/hiraj_model.dart';
import '../../../home/presentation/widgets/sub_category/custom_tap_bar.dart';
import '../../data/models/favorite_model.dart';
import '../cubit/favorite_view_cubit.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = Fav.getItems(context).map((e) {
      return Tab(
        text: e.title,
        icon: Image.asset(
          e.image,
          width: 18.sp,
          height: 18.sp,
        ),
      );
    }).toList();
    return DefaultTabController(
      length: Fav.getItems(context).length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary7,
          elevation: 0,
          actions: const [ LogoAppBar(size: 20)],
          title:
           Text(AppString.appName, style: AppStyles.styleSemiBold16.copyWith(color: Colors.white)),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(

                color: Colors.white,
                  child: CustomTapBar2(tabs: tabs))),
        ),
        body: TabBarView(
            children: tabs.map((tab) {
          int indexTab = tabs.indexOf(tab);

          return BlocBuilder<FavoriteViewCubit, FavoriteViewState>(
            builder: (context, state) {
              if (state is FavoriteViewSuccess) {
                List<Sellers>? sellers = state.favoriteView.sellers ?? [];
                List<ProductData>? products = state.favoriteView.products ?? [];
                List<Shops>? shops = state.favoriteView.shops ?? [];

                if (indexTab == 0) {
                  return  ProductsFavoriteBody(products: products,);
                } else if (indexTab == 1) {
                  return ShopsFavoriteBody(shops: shops);
                } else if (indexTab == 2) {
                  return SellersFavoriteBody(sellers: sellers);
                }
              }
              return const Center(child: CustomProgressIndicator());
            },
          );
        }).toList()),
      ),
    );
  }
}






