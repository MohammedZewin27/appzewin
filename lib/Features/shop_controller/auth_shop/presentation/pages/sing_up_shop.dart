import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/seller/sing_up_seller/presentation/pages/seller_page_register.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/data/repositories/auth_shop_repo_impl.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/widgets/add_image_shop.dart';
import 'package:sahel_net/Features/shop_controller/checkShop/presentation/pages/check_shop.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';

import 'package:sahel_net/core/utils/api/api_service.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../auth/presentation/views/widget/auth_text_form.dart';
import '../../../../auth/presentation/views/widget/text_form_password.dart';
import '../../../../seller/check_seller_active/presentation/pages/check_seller.dart';
import '../../../../seller/sing_up_seller/data/repositories/seller_repo_impl.dart';
import '../../../../seller/sing_up_seller/presentation/widgets/drop_down_choose_category.dart';
import '../../../../seller/sing_up_seller/presentation/widgets/drop_down_choose_parent.dart';
import '../cubit/categoryShopCubit/category_shop_cubit.dart';
import '../cubit/sub_category_shop_cubit/sub_category_shop_cubit.dart';
import '../widgets/drop_category_shop.dart';
import '../widgets/drop_parent_shop.dart';
import '../widgets/drop_sub_category_shop.dart';

class ShopSingUp extends StatefulWidget {
  const ShopSingUp({super.key});

  @override
  State<ShopSingUp> createState() => _ShopSingUpState();
}

class _ShopSingUpState extends State<ShopSingUp> {
  late GlobalKey<FormState> formKeyAddNewSeller;
  double _opacity = 1.0;
  @override
  void initState() {
    formKeyAddNewSeller = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeyAddNewSeller.currentState?.dispose();
    super.dispose();
  }
  void _onChanged(bool? newValue) {
    setState(() {
      newValue = newValue!;
      _opacity = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var cubit = AuthShopCubit.get(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoryShopCubit(AuthShopRepoImpl(ApiShop(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                SubCategoryShopCubit(AuthShopRepoImpl(ApiShop(Dio()))),
          ),
        ],
        child: BlocListener<AuthShopCubit, AuthShopState>(
          listener: (context, state) {
            if (state is AddShopSuccess) {
              if (state.shopDataModel.status == AppString.success) {
                StringCache.activeShop = true;
                CacheData.setData(key: StringCache.shopActive, value: true);
                CacheData.setData(
                    key: StringCache.idShop,
                    value: state.shopDataModel.shopData?.shopId);
                CacheData.setData(
                    key: StringCache.shopStatus,
                    value: state.shopDataModel.shopData?.shopStatus);
                print(state.shopDataModel.shopData?.shopStatus);
                print(state.shopDataModel.shopData?.shopId);
                cubit.clearController();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckShop(),

                    ///-----------
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(' يوجد خطاء '),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('خروج'))
                      ],
                    );
                  },
                );
              }
            } else if (state is AddShopLoading) {
              const Center(child: CustomProgressIndicator());
            } else if (state is AddShopFailure) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: const Icon(
                    Icons.error_outlined,
                    color: ColorManager.red,
                    size: 35,
                  ),
                  content: Text(
                    state.errorMessage,
                    style: AppStyles.styleRegular16,
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.primary),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('حدث خطاء',
                                style: AppStyles.styleBoldWhite16)),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('تسجيل محل جديد'),
              actions: [Image.asset(Assets.imagesLogo)],
            ),
            bottomSheet: BottomSheet(
              enableDrag: false,
              onClosing: () {},
              builder: (context) {
                var cubit = AuthShopCubit.get(context);
                return Container(
                  padding: const EdgeInsets.only(top: 20, left: 5, right: 16),
                  alignment: Alignment.topLeft,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          ColorManager.primary7,
                          ColorManager.primaryLight.withOpacity(.5)
                        ]),
                  ),
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Container(
                                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                                  alignment: Alignment.center,
                                  child: Form(
                                    key: formKeyAddNewSeller,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 8),
                                        const AddImageNewShop(),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'اسم المحل',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: CustomTextForm(
                                              onChanged: (value) {
                                                setState(() {
                                                  print(value);
                                                });
                                              },
                                              maxLength: 50,
                                              colorIcon:
                                                  ColorManager.darkOrange,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value?.trim() == '' ||
                                                    value!.isEmpty) {
                                                  return 'الاسم المحل';
                                                }
                                                return null;
                                              },
                                              controller:
                                                  cubit.nameShopController,
                                              hintText: '',
                                              prefixIcon: Icons.shopping_cart),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'رقم الجوال ',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: CustomTextForm(
                                              maxLength: 13,
                                              colorIcon: Colors.blue,
                                              keyboardType: TextInputType.phone,
                                              validator: (value) {
                                                if (!value!.contains('966')) {
                                                  return 'لا يبدأ بصفر, رقم الجوال يبدأ بـ 966';
                                                }

                                                if (value.trim() == '' ||
                                                    value.isEmpty ||
                                                    value.length < 12 ||
                                                    value.length > 13) {
                                                  return ' رقم الجوال 966555555555';
                                                }
                                                return null;
                                              },
                                              controller:
                                                  cubit.phoneShopController,
                                              hintText: '',
                                              prefixIcon: Icons.phone),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'عنوان المحل',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: CustomTextForm(
                                              colorIcon:
                                                  ColorManager.lightGreen,
                                              validator: (value) {
                                                if (value?.trim() == '' ||
                                                    value!.isEmpty ||
                                                    value.length < 8) {
                                                  return 'عنوان المحل';
                                                }
                                                return null;
                                              },
                                              controller:
                                                  cubit.addressShopController,
                                              hintText: '',
                                              prefixIcon: FontAwesomeIcons.addressBook),
                                        ),
                                        const SizedBox(height: 12),
                                         GetLocationFromUser(controller: cubit.locationAddShopController,),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'كلمة المرور',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        TextFormPassword(
                                          controller:
                                              cubit.passwordAddShopController,
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'المنطقة',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: DropDownChooseParentToShop(),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'القسم',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: DropDownChooseShopCategory(),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'القسم الفرعي',
                                            style: AppStyles.styleBold14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child:
                                              DropDownChooseShopSubCategory(),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    padding: const EdgeInsets.all(0)
                                                ),
                                                child: Text(
                                                  'الموافقة على سياسة النشر ',

                                                  style: AppStyles
                                                      .styleSemiBold10
                                                      .copyWith(
                                                          color: AuthShopCubit
                                                                      .get(
                                                                          context)
                                                                  .policyShopChecked
                                                              ? ColorManager
                                                                  .blue2
                                                              : ColorManager
                                                                  .red),
                                                ),
                                                onPressed: () => privacyPolicy(
                                                    titleShowBottom:
                                                        'سياسة النشر',
                                                    context,
                                                    changeBetweenShopAndSeller:
                                                        0),
                                              ),
                                            ),
                                            AnimatedOpacity(
                                              opacity: _opacity,
                                              duration: Duration(milliseconds: 300),
                                              child: Checkbox(
                                                side: BorderSide(
                                                    color: Colors.red,width: 2
                                                ),
                                                shape: const CircleBorder(),
                                                activeColor: Colors.green,
                                                checkColor: Colors.white,
                                                value: AuthShopCubit.get(context)
                                                    .policyShopChecked
                                                // AuthCubit.get(context)
                                                //     .policyChecked
                                                ,
                                                onChanged: (value) {
                                                  setState(() {
                                                    AuthShopCubit.get(context)
                                                            .policyShopChecked =
                                                        value!;
                                                    privacyPolicy(context,
                                                        titleShowBottom: 'سياسة النشر',
                                                        changeBetweenShopAndSeller:
                                                            0);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      .2),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                  AuthShopCubit.get(context)
                                                      .policyShopChecked?ColorManager.lightOrange:ColorManager.grey),
                                              onPressed: () {
                                                if (formKeyAddNewSeller
                                                    .currentState!
                                                    .validate()) {
                                                  if (AuthShopCubit.get(context)
                                                          .policyShopChecked ==
                                                      true) {
                                                    AuthShopCubit.get(context)
                                                        .calculateNewDate();

                                                    /// add 1 year
                                                    if (AuthShopCubit.get(
                                                                context)
                                                            .logeImageFile !=
                                                        null) {
                                                      AuthShopCubit.get(context)
                                                          .addShopInDatabase();
                                                    }
                                                  }else{
                                                    print('object');
                                                    _onChanged(false);
                                                    _onChanged(false);
                                                    _onChanged(false);
                                                  }
                                                }
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'ارسال الطلب',
                                                    style: AppStyles
                                                        .styleBoldPrimary16
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // body: const SafeArea(
            //   child: Align(
            //     alignment: Alignment.topCenter,
            //     child: Column(
            //       children: [
            //         LogNameAndLogo(),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text(
            //             'يرجى ادخال البيانات بشكل صحيح , في حالة ادخال البيانات بشكل خاطى سوف يتم رفض الطلب ',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w800),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ));
  }
}
