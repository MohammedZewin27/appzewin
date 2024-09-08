import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sahel_net/Features/seller/check_seller_active/presentation/cubit/check_seller_cubit.dart';
import 'package:sahel_net/Features/seller/sing_up_seller/data/repositories/seller_repo_impl.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/data/repositories/auth_shop_repo_impl.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';
import 'package:sahel_net/core/utils/api/api_service.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../generated/assets.dart';
import '../../../../choose_user/presentation/cubit/shop_active_cubit.dart';
import '../../../../seller/seller_setting/data/function.dart';
import '../../../../setting/data/models/items_setting_control_model.dart';
import '../cubit/check_shop_cubit.dart';

class CheckShop extends StatelessWidget {
  const CheckShop({super.key});

  @override
  Widget build(BuildContext context) {
    // CheckShop.get(context).getSellerData();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () async {
            await callMe(context);
          },
          child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.assetsCallus),
              )),
        ),
        appBar: AppBar(
          title: const Text('جاري معالجة الطلب'),
          actions: [Image.asset(Assets.imagesLogo)],
        ),
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
                ShopActiveCubit(AuthShopRepoImpl(ApiShop(Dio())))
                  ..getDateShop(),
            child: BlocBuilder<ShopActiveCubit, ShopActiveState>(
              builder: (context, state) {
                if (state is ShopActiveSuccess) {
                  var data = state.shopDataModel.shopData;
                  return Container(
                    padding: const EdgeInsets.only(top: 20, left: 5, right: 16),
                    alignment: Alignment.topLeft,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            ColorManager.white,
                            ColorManager.primaryLight.withOpacity(.4)
                          ]),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.sizeOf(context).width / 3,
                              width: MediaQuery.sizeOf(context).width / 3,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              child: CachedImage(url: data?.shopImage ?? '')),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            data?.shopName ?? '',
                            style: AppStyles.styleSemiBold24
                                .copyWith(color: ColorManager.blue),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: data?.codeShop ?? ''));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  content: Container(
                                    padding:const EdgeInsets.symmetric(vertical: 10) ,
                                    decoration: BoxDecoration(
                                        color: ColorManager.primary7.withOpacity(.9),
                                        borderRadius: BorderRadius.circular(12)),
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      'تم نسخ الكود!  -  قم بالاحتفاظ به',
                                      textAlign: TextAlign.center,
                                      style: AppStyles.styleSemiBold16
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorManager.primary7.withOpacity(.2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.copy),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' انسخ الكود',
                                        style: AppStyles.styleSemiBold12
                                            .copyWith(color: ColorManager.blue),
                                      ),
                                      Text(
                                        data?.codeShop ?? '',
                                        style: AppStyles.styleSemiBold20
                                            .copyWith(color: ColorManager.blue,fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorManager.lightOrange),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'تحت الاجراء',
                                  style: AppStyles.styleSemiBold16
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  '  :  ',
                                  style: AppStyles.styleBoldPrimary16
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  ' حالة الطلب ',
                                  style: AppStyles.styleBoldPrimary16
                                      .copyWith(color: ColorManager.blue),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorManager.blue),
                            child: Text(
                              'مميزات التسجيل',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextPoint(
                                  color: Colors.blue,
                                  size: 14,
                                  text:
                                      'إضافة خدماتك أو محلك مع تفاصيل الخدمة وموقعك.',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextPoint(
                                  color: Colors.blue,
                                  size: 14,
                                  text:
                                      'إضافة وتعديل الصور بسهولة، مع إمكانية إضافة شعار خاص بك.',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextPoint(
                                  color: Colors.blue,
                                  size: 14,
                                  text:
                                      'تفعيل أدوات التواصل لتسهيل تواصل العملاء معك مباشرة.',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextPoint(
                                  color: Colors.blue,
                                  size: 14,
                                  text:
                                      'إمكانية مشاركة محلك بين المستخدمين، مما يعزز انتشار خدمتك بشكل أكبر.',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height:15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorManager.red.withAlpha(230)),
                            onPressed: () {
                              customShowModalBottomSheet(
                                context,
                                title: 'تسجيل خروج من حسابك',
                                buttonRed: '  تسجيل خروج ',
                                buttonGreen: 'خروج',
                                subTitle:
                                    'لتسجيل الخروج اضغط ضغطه مطوله على تسجيل الخروج',
                                cancelPress: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                onPressed: () {
                                  StringCache.activeShop = true;
                                  CacheData.setData(
                                      key: StringCache.shopActive, value: true);
                                  CacheData.clearShopItems();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'تسجيل خروج',
                                  style: AppStyles.styleBold14
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is ShopActiveLoading) {
                  return const Center(child: CustomProgressIndicator());
                } else if (state is ShopActiveFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return const Center(child: CustomProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ShopDelete extends StatelessWidget {
  const ShopDelete({super.key});

  @override
  Widget build(BuildContext context) {
    // CheckShop.get(context).getSellerData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backFish,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () async {
            await callMe(context);
          },
          child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.assetsCallus),
              )),
        ),
        appBar: AppBar(
          title: const Text('تم حذف الحساب '),
          actions: [Image.asset(Assets.imagesLogo)],
        ),
        body: BlocProvider(
          create: (context) =>
              ShopActiveCubit(AuthShopRepoImpl(ApiShop(Dio())))..getDateShop(),
          child: BlocBuilder<ShopActiveCubit, ShopActiveState>(
            builder: (context, state) {
              if (state is ShopActiveSuccess) {
                var data = state.shopDataModel.shopData;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // Container(
                    //     height: MediaQuery.sizeOf(context).width/3,
                    //     width: MediaQuery.sizeOf(context).width/3,
                    //
                    //     clipBehavior: Clip.antiAlias,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50)
                    //     ),
                    //     child: CachedImage(url: data?.shopImage ?? '')),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      data?.shopName ?? '',
                      style: AppStyles.styleSemiBold24
                          .copyWith(color: ColorManager.primary7),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تم الحذف',
                          style: AppStyles.styleSemiBold16,
                        ),
                        Text(
                          '  :  ',
                          style: AppStyles.styleBoldPrimary16,
                        ),
                        Text(
                          'الحالة ',
                          style: AppStyles.styleBoldPrimary16,
                        ),
                      ],
                    ),

                    const Spacer(),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Lottie.asset(
                        Assets.imagesFish,
                        fit: BoxFit.fill,
                        animate: true,
                      ),
                    ),
                  ],
                );
              } else if (state is ShopActiveLoading) {
                return const Center(child: CustomProgressIndicator());
              } else if (state is ShopActiveFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(child: CustomProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
