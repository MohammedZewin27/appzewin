import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sahel_net/Features/seller/check_seller_active/presentation/cubit/check_seller_cubit.dart';
import 'package:sahel_net/Features/seller/sing_up_seller/data/repositories/seller_repo_impl.dart';
import 'package:sahel_net/core/utils/api/api_service.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../generated/assets.dart';
import '../../../../setting/data/models/items_setting_control_model.dart';
import '../../../seller_setting/data/function.dart';

class CheckSeller extends StatelessWidget {
  const CheckSeller({super.key});

  @override
  Widget build(BuildContext context) {
    // CheckSeller.get(context).getSellerData();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorManager.backFish,
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
        body: BlocProvider(
          create: (context) =>
              CheckSellerCubit(SellerRepoImpl(ApiService(Dio())))
                ..getSellerData(),
          child: BlocBuilder<CheckSellerCubit, CheckSellerState>(
            builder: (context, state) {
              if (state is SellerHomeSuccess) {
                var data = state.sellerData.sellerData;
                return Container(
                  padding: const EdgeInsets.only(top: 20, left: 5, right: 16),
                  alignment: Alignment.topLeft,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
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
                            child:
                                CachedImage(url: data?.imageHirajSeller ?? '')),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data?.nameHirajSelle ?? '',
                          style: AppStyles.styleSemiBold24
                              .copyWith(color: ColorManager.blue),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: data?.codeHirajSelle ?? ''));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 0,
                                content: Container(
                                  padding:const EdgeInsets.symmetric(vertical:10) ,
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
                                      data?.codeHirajSelle ?? '',
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
                              gradient: const LinearGradient(colors: [
                                ColorManager.lightOrange,
                                ColorManager.white,
                              ]),
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
                          child: const Text(
                            'مميزات التسجيل',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextPoint(
                                color: ColorManager.ofWhite2,
                                size: 14,
                                text:
                                    'حساب البائع يمنحك القدرة على نشر منتجاتك بسهولة وإدارتها بمرونة.',
                              ),
                              TextPoint(
                                color: ColorManager.ofWhite2,
                                size: 14,
                                text:
                                    'الوصول إلى إحصائيات  تساعدك على فهم السوق وتحسين أداء مبيعاتك.',
                              ),
                              TextPoint(
                                  color: ColorManager.ofWhite2,
                                  size: 14,
                                  text:
                                      'بفضل هذه الأدوات، يمكنك زيادة مبيعاتك بشكل فعال.'),
                              TextPoint(
                                  color: ColorManager.ofWhite2,
                                  size: 14,
                                  text:
                                      'يمكن للعملاء التواصل معك مباشرة، مما يعزز التفاعل ويوفر تجربة تسوق أفضل .'),
                              TextPoint(
                                  color: ColorManager.ofWhite2,
                                  size: 14,
                                  text:
                                      'يعمل فريق ${AppString.appName} على التطوير وتحديث الدائم للبرنامج وتحسين ادوات التحليل .'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.red.withAlpha(230)),
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
                                StringCache.activeSeller = false;
                                CacheData.setData(
                                    key: StringCache.sellerActive,
                                    value: false);
                                CacheData.clearSellerItems();
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
              } else if (state is SellerHomeLoading) {
                return const Center(child: CustomProgressIndicator());
              } else if (state is SellerHomeFailure) {
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
