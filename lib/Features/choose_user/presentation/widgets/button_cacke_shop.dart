import 'package:auto_size_text/auto_size_text.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../shop_controller/auth_shop/data/repositories/auth_shop_repo_impl.dart';
import '../../../shop_controller/auth_shop/presentation/pages/sign_in_shop.dart';

import '../../../shop_controller/checkShop/presentation/pages/check_shop.dart';
import '../../../shop_controller/core_shop/api/api_shop.dart';
import '../../../shop_controller/layout_shop/presentation/pages/layout_shop.dart';
import '../cubit/shop_active_cubit.dart';

/// shop
class ButtonCacheShop extends StatelessWidget {
  const ButtonCacheShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // CheckShopCubit.get(context).getShopData();
    return BlocProvider(
      create: (context) =>
          ShopActiveCubit(AuthShopRepoImpl(ApiShop(Dio())))..getDateShop(),
      child: BlocConsumer<ShopActiveCubit, ShopActiveState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ShopActiveSuccess) {
            var dataShop = state.shopDataModel.shopData;
            if (StringCache.activeShop && dataShop?.shopStatus == 1) {
              ///1
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: ColorManager.lightOrange),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const HomeShop();

                          ///
                        },
                      ),
                    );
                  },
                  child: AutoSizeText(dataShop?.shopName??'',
                      textAlign: TextAlign.center,
                      style: AppStyles.styleBoldPrimary16
                          .copyWith(color: ColorManager.white)));
            }
            if (StringCache.activeShop && dataShop?.shopStatus == 0) {
              ///0
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: ColorManager.lightOrange),
                  onPressed: () {
                    Navigator.pop(context);
                    if (dataShop?.specialOffer == AppString.deleteShopUser) {
                      CherryToast.error(
                        title: const Text('يوجد خطاء في الكود او الرقم السري'),
                      ).show(context);
                    } else {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            //  return const SellerPageRegister();/// تعديل
                            // return const SellerLayout();/// تعديل
                            return const CheckShop();
                          },
                        ),
                      );
                    }
                  },
                  child: AutoSizeText(dataShop?.shopName??'',
                      style: AppStyles.styleBoldPrimary16
                          .copyWith(color: ColorManager.white)));
            } else {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: ColorManager.lightOrange),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const SignInShop();

                          ///
                          // SellerPageRegister();/// ----
                          // return ChooseShopOrSeller();
                        },
                      ),
                    );
                  },
                  child: AutoSizeText('ادخال بيانات محل جديد',
                      style: AppStyles.styleBoldPrimary16
                          .copyWith(color: ColorManager.white)));
            }
          }
          if (state is ShopActiveFailure) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: ColorManager.lightOrange),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return const SignInShop();

                        ///
                        // SellerPageRegister();/// ----
                        // return ChooseShopOrSeller();
                      },
                    ),
                  );
                },
                child: AutoSizeText(' محل جديد',
                    style: AppStyles.styleBoldPrimary16
                        .copyWith(color: ColorManager.white)));
          }
          return TextButton(
              // style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8)),
              //     backgroundColor: ColorManager.lightOrange),
              onPressed: () {

              },
              child: const CustomProgressIndicator(
                // size: 25,
                color:ColorManager.lightOrange,
              ));
        },
      ),
    );
  }
}
