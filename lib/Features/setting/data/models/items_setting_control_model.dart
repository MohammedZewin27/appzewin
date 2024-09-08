import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/choose_user/presentation/widgets/button_cache_seller.dart';
import 'package:sahel_net/Features/choose_user/presentation/widgets/button_cacke_shop.dart';
import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';
import 'package:sahel_net/Features/splash/splash_view.dart';
import 'package:sahel_net/core/utils/function/call_me.dart';
import 'package:sahel_net/core/utils/function/functions.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/widgets/point_painter.dart';
import '../../../../generated/assets.dart';
import '../../presentation/widgets/custom_alert_dialog_log_out.dart';
import '../../presentation/widgets/setting_control/complaint_user.dart';
import '../../presentation/widgets/setting_control/delete_user_active_from_setting.dart';
import '../../presentation/widgets/setting_control/service_request.dart';
import '../../presentation/widgets/setting_control/user_update_data.dart';

class ItemsSettingControlModel {
  final String title, subtitle, assetsImage;
  final Color? color;
  final bool titleAlign;

  final void Function()? onTap;

  ItemsSettingControlModel(
      {required this.title,
      required this.subtitle,
      required this.assetsImage,
      this.color,
      this.titleAlign = true,
      this.onTap});

  static List<ItemsSettingControlModel> getItemsSettingControl(
      BuildContext context) {
    return [
      ItemsSettingControlModel(
          onTap: () {
            if (CacheData.getData(key: StringCache.userId) != 0) {
              if (SettingCubit.get(context).isActive) {
                SettingCubit.get(context)
                    .scaffoldKeySetting
                    .currentState
                    ?.showBottomSheet(
                        elevation: 10,
                        backgroundColor: ColorManager.primary5.withOpacity(.47),
                        (context) => const UserUpdateData())
                    .closed
                    .then((value) {
                  SettingCubit.get(context).isActive = true;
                });
                SettingCubit.get(context).isActive = false;
              } else {
                Navigator.pop(context);
                SettingCubit.get(context).isActive = true;
              }
            } else {
              registerNow(context);
            }
          },
          title: 'تعديل البيانات',
          subtitle: 'يمكنك تعديل بيانات اسم المستخدم ورقم الجوال ',
          assetsImage: Assets.imagesEditeUser),
      ItemsSettingControlModel(
          onTap: () {
            if (CacheData.getData(key: StringCache.userId) != 0) {
              if (SettingCubit.get(context).isActive) {
                SettingCubit.get(context)
                    .scaffoldKeySetting
                    .currentState
                    ?.showBottomSheet(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        (context) => const ServiceRequest())
                    .closed
                    .then((value) {
                  SettingCubit.get(context).isActive = true;
                });
                SettingCubit.get(context).isActive = false;
              } else {
                Navigator.pop(context);
                SettingCubit.get(context).isActive = true;
              }
            } else {
              registerNow(context);
            }
          },
          title: 'طلب الخدمة',
          subtitle: 'يمكنك طلب التواصل معنا لتقديم الخدمة',
          assetsImage: Assets.imagesServiceRequest),
      ItemsSettingControlModel(
          onTap: () {
            if (CacheData.getData(key: StringCache.userId) != 0) {
              if (SettingCubit.get(context).isActive) {
                SettingCubit.get(context)
                    .scaffoldKeySetting
                    .currentState
                    ?.showBottomSheet(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        (context) => const ComplaintUser())
                    .closed
                    .then((value) {
                  SettingCubit.get(context).isActive = true;
                });
                SettingCubit.get(context).isActive = false;
              } else {
                Navigator.pop(context);
                SettingCubit.get(context).isActive = true;
              }
            } else {
              registerNow(context);
            }
          },
          title: 'شكاوى',
          subtitle: 'يمكنك شكوى خاصة بالبرنامج او المتاجر ',
          assetsImage: Assets.imagesComplaints),
      ItemsSettingControlModel(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => const CustomAlertDialogLogOut());
          },
          color: ColorManager.red,
          titleAlign: false,
          title: 'تسجيل خروج',
          subtitle: 'يمكنك تسجيل الخروج ويمكن الدخول مرة اخرى ',
          assetsImage: Assets.imagesLogout),
      ItemsSettingControlModel(
          onTap: () {
            myDialog(
              context,
              image: Assets.imagesUserdelete,
              content:
                  'حذف الحساب نهائيا يعني حذف بيانات الحساب من قاعدة البيانات مع حذف '
                  'جمبيع البيانات وبيانات المفضلة ولا يمكن الرجوع اليها مرة اخرى ',
              title: 'حذف الحساب',
              titleColor: ColorManager.red,
              titleButton: 'تأكيد',
              onPressedOk: () {
                showDialog(
                  context: context,
                  builder: (context) => const DeleteUserActiveFromSetting(),
                );
              },
              onPressedCancel: () {},
            );
          },
          title: 'حذف الحساب',
          titleAlign: false,
          color: ColorManager.red,
          subtitle:
              'حذف الحساب نهائيا من قاعدة البيانات مع حذف جمبيع البيانات وبيانات المفضلة ولا يمكن الرجوع اليها مرة اخرى ',
          assetsImage: Assets.imagesUserdelete),
    ];
  }
}

class CustomAlertDialogGoSeller extends StatelessWidget {
  const CustomAlertDialogGoSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 0,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'حساب بائع',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleSemiBold18
                        .copyWith(color: ColorManager.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextPoint(
                    text:
                        'حساب البائع يمنحك القدرة على نشر منتجاتك بسهولة وإدارتها بمرونة.',
                  ),
                  const TextPoint(
                    text:
                        'الوصول إلى إحصائيات  تساعدك على فهم السوق وتحسين أداء مبيعاتك.',
                  ),
                  const TextPoint(
                      text: 'بفضل هذه الأدوات، يمكنك زيادة مبيعاتك بشكل فعال.'),
                  const TextPoint(
                      text:
                          'يمكن للعملاء التواصل معك مباشرة، مما يعزز التفاعل ويوفر تجربة تسوق أفضل .'),
                  const TextPoint(
                      color: ColorManager.ofWhite2,
                      size: 14,
                      text:
                          'يعمل فريق ${AppString.appName} على التطوير وتحديث الدائم للبرنامج وتحسين ادوات التحليل للبائع .'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(child: ButtonCacheSeller())],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -70,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        Assets.imagesSellers,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class CustomAlertDialogGoShop extends StatelessWidget {
  const CustomAlertDialogGoShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 0,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'اضافة محل',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleSemiBold18
                        .copyWith(color: ColorManager.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextPoint(
                    text: 'إضافة خدماتك أو محلك مع تفاصيل الخدمة وموقعك.',
                  ),
                  const TextPoint(
                    text:
                        'إضافة وتعديل الصور بسهولة، مع إمكانية إضافة شعار خاص بك.',
                  ),
                  const TextPoint(
                    text:
                        'تفعيل أدوات التواصل لتسهيل تواصل العملاء معك مباشرة.',
                  ),
                  const TextPoint(
                    text:
                        'إمكانية مشاركة محلك بين المستخدمين، مما يعزز انتشار خدمتك بشكل أكبر.',
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(child: ButtonCacheShop())],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -70,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        Assets.imagesShops,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class TextPoint extends StatelessWidget {
  const TextPoint({
    super.key,
    required this.text,
    this.size,
    this.color,
  });

  final String text;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          Expanded(
            child: Text(text,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: color ?? Colors.black,
                    fontSize: size ?? 12,
                    fontWeight: FontWeight.w600)

                // AppStyles.styleSemiBold12.copyWith(),
                ),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomPaint(
            size: Size(10, 10), // حجم اللوحة
            painter: PointPainter(), // فئة الرسام المخصصة
          ),
        ],
      ),
    );
  }
}


