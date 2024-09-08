import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:sahel_net/Features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sahel_net/Features/auth/presentation/views/sign_in_view.dart';

import 'package:sahel_net/Features/parent/data/models/parent_model.dart';

import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/launch_url.dart';
import 'package:sahel_net/generated/assets.dart';

import '../theme/strings_manager.dart';

Future<dynamic> callMe(BuildContext context,
    {String? phone, String? titleShowBottom}) {
  return showModalBottomSheet(
    backgroundColor: ColorManager.white,
    elevation: 0,
    context: context,
    clipBehavior: Clip.none,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                titleShowBottom ?? 'تواصل معنا',
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          //finish(context);
                          Navigator.of(context);
                          CustomLaunchUrl.launchUrlCall(
                              numPhone: phone ?? '966559760134');
                        },
                        child: Text(
                          'اتصال',
                          style: AppStyles.styleSemiBold12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          String? name =
                              CacheData.getData(key: StringCache.userName) ??
                                  '';
                          // finish(context);
                          Navigator.of(context);
                          CustomLaunchUrl.launchUrlWhatsapp(
                              numPhone: phone ?? '966559760134',
                              name: name ?? '',
                              urlPreview: '');
                        },
                        child: Text('واتس اب',
                            style: AppStyles.styleSemiBold12
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
              top: -18,
              right: 15,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        AppString.appNameMaster,
                        style: AppStyles.styleSemiBoldQahiri3
                            .copyWith(fontSize: 4),
                      )
                    ],
                  )))
        ],
      );
    },
  );
}

Future<dynamic> privacyPolicy(BuildContext context,
    {String? phone, String? titleShowBottom, int? changeBetweenShopAndSeller}) {
  return showModalBottomSheet(
    backgroundColor: ColorManager.white,
    elevation: 0,
    context: context,
    clipBehavior: Clip.none,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                titleShowBottom ?? 'سياسة الخصوصية',
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // finish(context);
                          Navigator.pop(context);
                        },
                        child: AutoSizeText(
                          'الاطلاع لاحقا',
                          maxLines: 1,
                          style: AppStyles.styleSemiBold12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context);
                        if (changeBetweenShopAndSeller == 0) {
                          CustomLaunchUrl.launchShopPolicy();
                        } else if (changeBetweenShopAndSeller == 1) {
                          CustomLaunchUrl.launchSellerPolicy();
                        } else {
                          CustomLaunchUrl.launchUserPolicy();
                        }
                      },
                      child: AutoSizeText('الاطلاع على سياسة الخصوصية',
                          maxLines: 1,
                          style: AppStyles.styleSemiBold12
                              .copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
            top: -18,
            right: 15,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesLogo,
                    height: 30,
                    width: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.appNamePremiere,
                        style: AppStyles.styleSemiBoldQahiri3
                            .copyWith(fontSize: 4),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        AppString.appNameMaster,
                        style: AppStyles.styleSemiBoldQahiri3
                            .copyWith(fontSize: 4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> registerNow(BuildContext context,
    {String? phone, String? titleShowBottom, bool isPop = true}) {
  return showModalBottomSheet(
    backgroundColor: ColorManager.white,
    elevation: 0,
    context: context,
    clipBehavior: Clip.none,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                titleShowBottom ??
                    'قم بالتسجيل الان للحصول على ميزايا التطبيق كاملة ',
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          ///

                          if (isPop) Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInView(
                                dataParent: DataParent(
                                  appLogo: CacheData.getData(
                                      key: StringCache.appLogo),
                                  appDescription: CacheData.getData(
                                      key: StringCache.appDescription),
                                  backgroundImage: CacheData.getData(
                                      key: StringCache.backgroundImage),
                                  id: CacheData.getData(
                                      key: StringCache.idParent),
                                  name: CacheData.getData(
                                      key: StringCache.parentName),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'تسجيل دخول',
                          style: AppStyles.styleSemiBold12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          ///

                          if (isPop) Navigator.pop(context);
                          AuthCubit.get(context).selected = {'2'};
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInView(
                                dataParent: DataParent(
                                  appLogo: CacheData.getData(
                                      key: StringCache.appLogo),
                                  appDescription: CacheData.getData(
                                      key: StringCache.appDescription),
                                  backgroundImage: CacheData.getData(
                                      key: StringCache.backgroundImage),
                                  id: CacheData.getData(
                                      key: StringCache.idParent),
                                  name: CacheData.getData(
                                      key: StringCache.parentName),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text('تسجيل حساب جديد',
                            style: AppStyles.styleSemiBold12
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
              top: -18,
              right: 15,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 30,
                        width: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.appNamePremiere,
                            style: AppStyles.styleSemiBoldQahiri3
                                .copyWith(fontSize: 4),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            AppString.appNameMaster,
                            style: AppStyles.styleSemiBoldQahiri3
                                .copyWith(fontSize: 4),
                          ),
                        ],
                      )
                    ],
                  )))
        ],
      );
    },
  );
}

Future<dynamic> customShowModalBottomElevatedButton(BuildContext context,
    {String? phone,
    required String titleShowBottom,
    required String titleButtonOne,
    required String titleButtonTwo,
    required void Function() onPressedButtonOne,
    required void Function() onPressedButtonTwo}) {
  return showModalBottomSheet(
    backgroundColor: ColorManager.white,
    elevation: 0,
    context: context,
    clipBehavior: Clip.none,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                titleShowBottom,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed:onPressedButtonOne,
                        child: Text(
                         titleButtonOne,
                          style: AppStyles.styleSemiBold12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: onPressedButtonTwo,
                        child: Text(titleButtonTwo,
                            style: AppStyles.styleSemiBold12
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
              top: -18,
              right: 15,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        AppString.appNameMaster,
                        style: AppStyles.styleSemiBoldQahiri3
                            .copyWith(fontSize: 4),
                      )
                    ],
                  )))
        ],
      );
    },
  );
}
