import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/data/repositories/information_shop_repo_impl.dart';
import 'package:sahel_net/Features/shop_controller/setting_user_shop/data/repositories/setting_shop_repo_impl.dart';

import '../../../../../core/utils/theme/styles_manager.dart';

import '../../../../../core/utils/widgets/custom_progress_indicator.dart';

import '../../../../choose_user/presentation/cubit/shop_active_cubit.dart';

import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../auth_shop/data/repositories/auth_shop_repo_impl.dart';
import '../../../core_shop/api/api_shop.dart';
import '../../../core_shop/const/const_shop.dart';
import '../../../information_shop_user/presentation/cubit/information_shop_cubit.dart';
import '../../../information_shop_user/presentation/cubit/services_shop_cubit.dart';
import '../../../information_shop_user/presentation/pages/information_shop_user.dart';
import '../../../setting_user_shop/presentation/cubit/setting_shop_user_cubit.dart';
import '../cubit/layout_shop_cubit.dart';
import '../widgets/home_screen_body.dart';

class HomeShop extends StatelessWidget {
  const HomeShop({super.key});

  @override
  Widget build(BuildContext context) {
    // ShopActiveCubit.get(context).getDateShop();
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
        ShopActiveCubit(AuthShopRepoImpl(ApiShop(Dio())))
          ..getDateShop(),
      ),
      BlocProvider(
        create: (context) =>
        InformationShopCubit(InformationShopRepoImpl(ApiShop(Dio())))
          ..getImagesShop(),
      ),
      BlocProvider(
        create: (context) =>
        ServicesShopCubit(InformationShopRepoImpl(ApiShop(Dio())))
          ..getServicesShop(),
      ),
      BlocProvider(
        create: (context) =>
            LayoutShopCubit(),
      ),
    BlocProvider(
    create: (context) => SettingShopUserCubit(SettingShopRepoImpl(ApiShop(Dio()))),),
    ], child: const HomeBody());
  }
}






class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopActiveCubit, ShopActiveState>(
      builder: (context, state) {
        if (state is ShopActiveSuccess) {
          ShopData? shopData = state.shopDataModel.shopData;

          // SellerData? dataSeller = state.sellerData.sellerData;
          // dataShopInScreenAddPost = shopData;
          shopDataUser = shopData;
          getShopPages(shopData: shopData);
          return const LayoutBody();
        }
        if(state is ShopActiveFailure ){
          return Column(
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(state.errorMessage,style: AppStyles.styleSemiBold18,))
            ],
          );
        }


        else {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: CustomProgressIndicator()),
          );
        }
      },
    );
  }
}


// class ScreensShop extends StatelessWidget {
//   const ScreensShop({super.key, required this.index});
//
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ShopActiveCubit, ShopActiveState>(
//       builder: (context, state) {
//         if (state is ShopActiveSuccess) {
//           ShopData? shopData=state.shopDataModel.shopData;
//           // SellerData? dataSeller = state.sellerData.sellerData;
//           dataShopInScreenAddPost = shopData;
//           List<Widget> pages = getShopPages(shopData: shopData);
//           return pages[index];
//         } else {
//           return const Center(child: CustomProgressIndicator());
//         }
//       },
//     );
//
//   }
// }

