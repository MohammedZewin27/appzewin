
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';



import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/function/call_me.dart';
import '../../../../core/utils/theme/color_manager.dart';


import '../../../../generated/assets.dart';


import '../../../favorite/presentation/pages/favorite_view.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../presentation/widgets/about_us.dart';
import '../../presentation/widgets/custom_alert_dialog_log_out.dart';
import '../../presentation/widgets/custom_wight_change_parent.dart';
import '../../presentation/widgets/send_user_massage.dart';
import '../../presentation/widgets/setting_control/user_setting_control.dart';
import 'items_setting_control_model.dart';

class ItemsSettingModel {
  String title;
  String image;
  Color color;
  void Function()? function;

  ItemsSettingModel(
      {required this.title,
      required this.image,
      required this.color,
      required this.function});

  static List<ItemsSettingModel> getItems(BuildContext context) {
    return [
      ItemsSettingModel(
          function: () {
            HomeCubit.get(context).isSettingDataUserActive &&
                    CacheData.getData(key: StringCache.userId) != 0
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteView(),
                    ),
                  )
                : registerNow(context);
          },
          title: 'المفضلة',
          image: Assets.assetsFavorite,
          color: ColorManager.lightGreen2),

      ///   مفضلة  //////////////
      ItemsSettingModel(
          function: () {
            showModalBottomSheet(
              backgroundColor: ColorManager.pistachio,
              context: context,
              builder: (context) {
                return const CustomWightChangeParent();
              },
            );
            // : null;
          },
          title: 'تغير المنطقة',
          image: Assets.imagesSwith,
          color: ColorManager.primary),

      ///   تبديل المتاجر  //////////////
      ItemsSettingModel(
          function: () {
            HomeCubit.get(context).isSettingDataUserActive
                ? Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const UserSettingControl(),
                    ),
                  )
                : null;
          },
          title: 'اعدادات الحساب',
          image: Assets.imagesSetting,
          color: ColorManager.primary4),

      ///   اعدادات الحساب  //////////////
      ItemsSettingModel(
          function: () {
            callMe(context);
          },
          title: 'تواصل معنا',
          image: Assets.assetsCallus,
          color: ColorManager.lightOrange),

      ///   تواصل معنا  //////////////
      ItemsSettingModel(
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ));
          },
          title: 'معلومات عنا',
          image: Assets.assetsAboutus,
          color: ColorManager.lightPetrol.withOpacity(1)),

      ///   معلومات عنا  //////////////
      ItemsSettingModel(
          function: () {
            privacyPolicy(context);
            // CherryToast.info(
            //   title: const Text('مشاركة التطبيق'),
            //   action: const Text('سيكون متاح قريبا'),
            // ).show(context);
          },
          title: 'سياسة الخصوصية',
          image: Assets.imagesPrivacypolicy,
          color: ColorManager.blue2),

      ///   مشاركة التطبيق  //////////////
      ItemsSettingModel(
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendUserMassage(
                    type: '1',
                  ),
                ));
          },
          title: 'اقترحات',
          image: Assets.imagesSuggestions,
          color: ColorManager.primary5),

      ///   اقترحات  //////////////
      ItemsSettingModel(
          function: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendUserMassage(
                    type: '0',
                  ),
                ));
          },
          title: 'شكاوي',
          image: Assets.imagesComplaints,
          color: ColorManager.blue),

      ///   شكاوي  //////////////
      SettingCubit.get(context).userActiveSignIn
          ? ItemsSettingModel(
              function: () {

                showDialog(
                    context: context,
                    builder: (context) => const CustomAlertDialogLogOut());
              },
              title: 'تسجيل خروج',
              image: Assets.imagesLogout,
              color: ColorManager.primary3.withOpacity(.8))
          : ItemsSettingModel(
              function: () {
                registerNow(context,isPop: true);

              },
              title: 'تسجيل حساب',
              image: Assets.imagesLogin8028316,
              color: ColorManager.primary3.withOpacity(.8)),

      ///   تسجيل خروج  //////////////
      ItemsSettingModel(
          function: () {
            showDialog(
              context: context,
              builder: (context) => const CustomAlertDialogGoSeller(),
            );
          },
          title: 'حساب بائع',
          image: Assets.imagesSellers,
          color: ColorManager.blue),
      ItemsSettingModel(
          function: () {
            showDialog(
              context: context,
              builder: (context) => const CustomAlertDialogGoShop(),
            );
          },
          title: 'اضافة محل',
          image: Assets.imagesShops,
          color: ColorManager.blue),
    ];
  }
}
