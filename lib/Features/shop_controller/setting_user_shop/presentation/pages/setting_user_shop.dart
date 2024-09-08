import 'package:auto_size_text/auto_size_text.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/choose_user/presentation/cubit/shop_active_cubit.dart';
import 'package:sahel_net/Features/home/presentation/widgets/custom_header.dart';
import 'package:sahel_net/Features/seller/seller_setting/data/function.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/presentation/cubit/information_shop_cubit.dart';
import 'package:sahel_net/Features/shop_controller/UpdateShop/presentation/pages/update_user_shop.dart';
import 'package:sahel_net/Features/shop_controller/layout_shop/presentation/cubit/layout_shop_cubit.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../setting/presentation/widgets/setting_control/circle_image_stack.dart';
import '../../../../setting/presentation/widgets/text_form_update_information.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../core_shop/widget/card_setting.dart';
import '../../../core_shop/widget/custom_text_form_field_fill_gray.dart';
import '../../../information_shop_user/data/models/information_model.dart';
import '../../../UpdateShop/presentation/widgets/image_shop_user_edit.dart';
import '../cubit/setting_shop_user_cubit.dart';
import '../widgets/change_password.dart';
import '../widgets/delete_account.dart';

class SettingUserShop extends StatelessWidget {
  const SettingUserShop({
    super.key,
    required this.shopData,
  });

  final ShopData? shopData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: SettingShopUserCubit
          .get(context)
          .scaffoldKeySettingShop,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorManager.primary7,

                    ColorManager.primary,

                  ]),
                  borderRadius: BorderRadius.circular(5),
                  color: ColorManager.primary7),
              child: Text(
                shopData?.shopName ?? '',
                style: AppStyles.styleSemiBold24
                    .copyWith(color: Colors.white),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MyBoxContainer(
              height: MediaQuery
                  .sizeOf(context)
                  .width / 2.5,
              width: MediaQuery
                  .sizeOf(context)
                  .width / 2.5,
              radius: 12,
              margin: 10,
              child: CachedImage(url: shopData?.shopImage ?? ''),
            ),

            ///change password

            ItemsSettingUserShopControl(
              title: 'سياسة النشر',
              subtitle: 'السياسات الخاصة بالنشر ',
              image: Assets.imagesPrivacypolicy,
              onTap: () {
                privacyPolicy(context, changeBetweenShopAndSeller: 0);
              },
            ),
            ItemsSettingUserShopControl(
              title: 'تسجيل خروج',
              subtitle: 'لتسجيل خروج اضغط ضغطه مطوله على خروج',
              image: Assets.imagesLogout,

              onTap: () {
                customShowModalBottomSheet(context, title: 'تسجيل خروج',
                    buttonRed: 'تسجيل خروج',
                    buttonGreen: 'الغاء',
                    subTitle: 'لتسجيل خروج اضغط ضغطة مطوله على تسجيل خروج',

                onPressed: () {

                  StringCache.activeShop = true;
                  CacheData.setData(key: StringCache.shopActive, value: true);
                  CacheData.clearShopItems();
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
                SettingShopUserCubit
                    .get(context)
                    .scaffoldKeySettingShop
                    .currentState
                    ?.showBottomSheet(backgroundColor: Colors.transparent,
                        (context) {
                      return const DeleteAccountShopUser();
                    });
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
    );
  }
}
