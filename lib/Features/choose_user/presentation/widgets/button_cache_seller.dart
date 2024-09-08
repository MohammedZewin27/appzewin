import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/seller/sing_up_seller/data/repositories/seller_repo_impl.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/api/api_service.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../seller/check_seller_active/presentation/pages/check_seller.dart';
import '../../../seller/seller_layout/presentation/pages/seller_layout.dart';
import '../../../seller/sing_in_seller/presentation/pages/sign_in_seller.dart';
import '../cubit/seller_full_active_cubit.dart';

/// seller
class ButtonCacheSeller extends StatelessWidget {
  const ButtonCacheSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SellerFullActiveCubit(SellerRepoImpl(ApiService(Dio())))
            ..getSellerData(),
      child: BlocConsumer<SellerFullActiveCubit, SellerFullActiveState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SellerFullActiveSuccess) {
            var dataSeller = state.sellerData.sellerData;
            print('Status==>${dataSeller?.sellerStatus}');
            print('Status==>${dataSeller?.nameHirajSelle}');
            print(StringCache.activeSeller);
            if (StringCache.activeSeller && dataSeller?.sellerStatus == '1') {
              ///1
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: ColorManager.lightOrange),
                  onPressed: () {
                    Navigator.pop(context);
                    print('zewinnnnnn');
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const SellerLayout();
                        },
                      ),
                    );
                  },
                  child: AutoSizeText(dataSeller?.nameHirajSelle ?? '',
                      textAlign: TextAlign.center,
                      style: AppStyles.styleBoldPrimary16
                          .copyWith(color: ColorManager.backBlack)));
            }
            if (StringCache.activeSeller && dataSeller?.sellerStatus == '0') {
              ///0

              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: ColorManager.lightOrange),
                  onPressed: () {
                    Navigator.pop(context);
                    if (dataSeller?.sellerDelete == AppString.deleteShopUser) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return const SignInSeller();
                          },
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            //  return const SellerPageRegister();/// تعديل
                            // return const SellerLayout();/// تعديل
                            return const CheckSeller();
                          },
                        ),
                      );
                    }
                  },
                  child: AutoSizeText(dataSeller?.nameHirajSelle ?? '',
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
                          return const SignInSeller();

                          ///
                          // SellerPageRegister();/// ----
                          // return ChooseShopOrSeller();
                        },
                      ),
                    );
                  },
                  child: AutoSizeText('بائع جديد',
                      style: AppStyles.styleBoldPrimary16
                          .copyWith(color: ColorManager.white)));
            }
          }

          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: ColorManager.lightOrange),
              onPressed: () {},
              child: const CustomProgressIndicator(
                color: ColorManager.lightOrange,
              ));
        },
      ),
    );
  }
}
