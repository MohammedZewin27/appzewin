import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/seller/seller_layout/presentation/widgets/bottom_nav_bar.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/presentation/cubit/information_shop_cubit.dart';
import 'package:sahel_net/Features/shop_controller/layout_shop/presentation/cubit/layout_shop_cubit.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../../core/utils/widgets/logo_app_bar.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../auth/presentation/views/widget/auth_text_form.dart';
import '../../../../home/presentation/widgets/sub_category/custom_tap_bar.dart';
import '../../../../seller/add_post/presentation/widgets/add_post_image.dart';
import '../../../../seller/core/const.dart';
import '../../../../seller/seller_layout/presentation/pages/seller_layout.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../core_shop/const/const_shop.dart';
import '../../../core_shop/widget/bottom_nav_bar_shop.dart';
import '../../../information_shop_user/data/models/information_model.dart';
import '../../../information_shop_user/presentation/pages/information_shop_user.dart';
import '../../../setting_user_shop/presentation/pages/setting_user_shop.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({
    super.key,
  });

  //
  // final ShopData? shopData;
  // final List<ImagesData> imagesShopUser;

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutShopCubit.get(context);
    List<Widget> pages = getShopPages();
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        // return LayoutShopCubit.get(context).
      },
      child: BlocBuilder<LayoutShopCubit, LayoutShopState>(
        builder: (context, state) {
          return Scaffold(
              key: cubit.scaffoldKeySettingShop,
              appBar: AppBar(
                title: Text(titleShopList[cubit.newIndex]),
                elevation: 10,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      imagesShopPage[cubit.newIndex],
                    ),
                  )
                ],
              ),
              // drawer: const Drawer(),
              resizeToAvoidBottomInset: false,
              extendBody: true,
              bottomNavigationBar: Container(
                clipBehavior: Clip.antiAlias,
                height: MediaQuery.sizeOf(context).width/9,
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  items: listItemNavShop,
                  backgroundColor: ColorManager.white,
                  elevation: 6,
                  selectedLabelStyle:
                      AppStyles.styleRegular15.copyWith(fontSize:10),
                  selectedItemColor: ColorManager.primary7,
                  unselectedItemColor:ColorManager.primary7.withOpacity(.8) ,
                  iconSize: 16,
                  onTap: (value) {
                    cubit.changeIndex(value);
                    print(cubit.newIndex);
                  },
                  currentIndex: cubit.newIndex,
                ),
              ),
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorManager.primary7,
                    ColorManager.white,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: pages[cubit.newIndex],
              ));
        },
      ),
    );

  }
}
