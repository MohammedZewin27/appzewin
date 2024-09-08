import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/Features/choose_user/presentation/cubit/seller_full_active_cubit.dart';
import 'package:sahel_net/Features/seller/seller_setting/data/function.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../generated/assets.dart';
import '../../../../shop_controller/core_shop/widget/card_setting.dart';
import '../../../../shop_controller/setting_user_shop/presentation/widgets/delete_account.dart';
import '../../../../splash/splash_view.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';
import '../../data/models/MassageModel.dart';
import '../cubit/setting_seller_cubit.dart';
import '../widgets/custom_setting_widget.dart';
import '../widgets/delete_account_seller_user.dart';

class SellerSetting extends StatelessWidget {
  const SellerSetting({super.key, this.sellerData});

  final SellerData? sellerData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return SellerFullActiveCubit.get(context).getSellerData();
      },
      child: BlocConsumer<SettingSellerCubit, SettingSellerState>(
        listener: (context, state) {
          if (state is ChangeStatusSellerLoading) {
            const CustomProgressIndicator();
          }
          if (state is ChangeStatusSellerSuccess) {
            StringCache.activeSeller = false;

            CacheData.setData(key: StringCache.sellerActive, value: false);
            CacheData.clearSellerItems();

            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashView(),
                ));
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedImage(url: sellerData?.imageHirajSeller ?? ''),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomSettingWidget(
                      text: 'اسم المتجر',
                      details: sellerData?.nameHirajSelle.toString() ?? ''),
                  CustomSettingWidget(
                      text: 'تاريخ البدء',
                      details:
                      sellerData?.startSeller.toString().substring(0, 11) ??
                          ''),
                  CustomSettingWidget(
                      text: 'تاريخ الانتهاء',
                      details:
                      sellerData?.endSeller.toString().substring(0, 11) ??
                          ''),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery
                            .sizeOf(context)
                            .width / 11),
                    child: Column(
                      children: [
                        ItemsSettingUserShopControl(
                          title: 'سياسة النشر',
                          subtitle: 'السياسات الخاصة بالنشر ',
                          image: Assets.imagesPrivacypolicy,
                          onTap: () {
                            privacyPolicy(context,
                                changeBetweenShopAndSeller: 1);
                          },
                        ),
                        ItemsSettingUserShopControl(
                          title: 'تسجيل خروج',
                          subtitle: 'يمكنك الدخول مرة اخري ',
                          image: Assets.imagesLogout,
                          onTap: () {

                            customShowModalBottomSheet(context, title: 'تسجيل خروج',
                                buttonRed: 'تسجيل خروج',
                                buttonGreen: 'الغاء',
                                subTitle: 'لتسجيل الخروج اضغط ضغطه مطوله على تسجيل الخروج',

                            onPressed: () {
                              StringCache.activeSeller = false;
                              CacheData.setData(
                                  key: StringCache.sellerActive, value: false);
                              CacheData.clearSellerItems();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            );
                          },
                        ),
                        ItemsSettingUserShopControl(
                          title: 'حذف الحساب',
                          subtitle: 'لحذف الحساب اضغط ضغطه مطوله على حذفً',
                          image: Assets.imagesUserdelete,
                          onTap: () {
                            customShowModalBottomSheet(
                              context,
                              title: 'حذف الحساب',
                              buttonGreen: 'الغاء',
                              buttonRed: 'حذف',
                              subTitle: 'احترس سوف يتم حذف الحساب, لمتابعة الحذف اضغط ضغطه مطوله ',
                              onPressed: () {
                                SettingSellerCubit.get(context)
                                    .changeStatusSeller();
                              },
                            );
                          },
                        ),
                        ItemsSettingUserShopControl(
                          title: 'التواصل معنا',
                          subtitle: 'تقديم شكوى او اقتراح',
                          image: Assets.assetsCallus,
                          onTap: () {
                            callMe(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .sizeOf(context)
                        .width / 8,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
