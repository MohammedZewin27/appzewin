import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/pages/sing_up_shop.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/widgets/title_auth.dart';
import '../../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../../auth/presentation/views/widget/auth_text_form.dart';
import '../../../../auth/presentation/views/widget/button_Log_in.dart';
import '../../../../auth/presentation/views/widget/text_form_password.dart';
import '../../../../seller/sing_up_seller/presentation/pages/seller_page_register.dart';
import '../../../../setting/presentation/widgets/header_setting.dart';
import '../../../checkShop/presentation/pages/check_shop.dart';
import '../../../layout_shop/presentation/pages/layout_shop.dart';

class SignInShop extends StatefulWidget {
  const SignInShop({
    super.key,
  });

  @override
  State<SignInShop> createState() => _SignInShopState();
}

class _SignInShopState extends State<SignInShop> {
  late GlobalKey<FormState> formKeyLogIn;
  double _opacity = 1.0;

  @override
  void initState() {
    formKeyLogIn = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeyLogIn.currentState?.dispose();
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
    return BlocConsumer<AuthShopCubit, AuthShopState>(
      listener: (context, state) {
        if (state is AuthShopSuccess) {
          if (state.shopsModel.status == AppString.success) {
            StringCache.activeShop = true;
            CacheData.setData(key: StringCache.shopActive, value: true);
            CacheData.setData(
                key: StringCache.idShop,
                value: state.shopsModel.shopData?.shopId);
            CacheData.setData(
                key: StringCache.shopStatus,
                value: state.shopsModel.shopData?.shopStatus);
            print('----------->${state.shopsModel.shopData?.shopStatus}');
            print('----------->${state.shopsModel.shopData?.shopId}');
            cubit.clearController();
            state.shopsModel.shopData?.shopStatus == 1
                ? Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return const HomeShop();
                      },
                    ),
                  )
                : Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return state.shopsModel.shopData?.specialOffer ==
                                AppString.deleteShopUser
                            ? const ShopDelete()
                            : const CheckShop();
                      },
                    ),
                  );
          } else {
            // cherry_toast
            CherryToast.error(
              title: Text(state.shopsModel.message ?? ''),
            ).show(context);
          }
        }
        else if (state is AuthShopLoading) {
          const Center(child: CustomProgressIndicator());
        } else if (state is AuthShopFailure) {
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
               'يوجد خطأ بالكود او كلمة المرور',
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
      builder: (context, state) {
        var cubit = AuthShopCubit.get(context);
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      ColorManager.white,
                      ColorManager.primary7.withOpacity(.005),
                    ]),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: HeaderSetting(),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            child: Form(
                              key: formKeyLogIn,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).width / 8,
                                    ),
                                    Image.asset(
                                      Assets.imagesShops,
                                      width:
                                          MediaQuery.sizeOf(context).width / 6,
                                      height:
                                          MediaQuery.sizeOf(context).width / 6,
                                    ),
                                    TitleAuth(
                                      backgroundColor:
                                          AuthShopCubit.get(context)
                                                  .policyShopChecked
                                              ? ColorManager.lightOrange
                                              : ColorManager.grey,
                                      textColor: Colors.white,
                                      title: 'حساب محل',
                                    ),
                                    const SizedBox(height: 25),
                                    const Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'كود المحل',
                                        style: AppStyles.styleSemiBold12,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: CustomTextForm(
                                          colorIcon: Colors.blue,
                                          validator: (value) {
                                            if (value?.trim() == '' ||
                                                value!.isEmpty) {
                                              return 'كود';
                                            }
                                            return null;
                                          },
                                          controller: cubit.codeController,
                                          hintText: '',
                                          prefixIcon: Icons.person),
                                    ),
                                    const SizedBox(height: 16),
                                    const Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'كلمة المرور',
                                        style: AppStyles.styleSemiBold12,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormPassword(
                                      controller: cubit.passwordController,
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const ShopSingUp(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'تسجيل محل جديد',
                                              style: AppStyles.styleSemiBold12
                                                  .copyWith(
                                                      color:
                                                          ColorManager.blue2),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(0)
                                        ),

                                              child: Text(
                                                'الموافقة على سياسة النشر ',

                                                style: AppStyles
                                                    .styleSemiBold10
                                                    .copyWith(
                                                        color: AuthCubit.get(
                                                                    context)
                                                                .policyChecked
                                                            ? ColorManager
                                                                .blue2
                                                            : ColorManager
                                                                .red),
                                              ),
                                              onPressed: () => privacyPolicy(
                                                titleShowBottom: 'سياسة النشر',
                                                  context,
                                                  changeBetweenShopAndSeller:
                                                      0),
                                            ),
                                            AnimatedOpacity(
                                              opacity: _opacity,
                                              duration: Duration(milliseconds: 300),
                                              child: Checkbox(

                                                side: BorderSide(
                                                    color: Colors.red,width: 2
                                                ),
                                                shape: const CircleBorder(
                                                  side: BorderSide()
                                                ),

                                                activeColor: Colors.green,
                                                checkColor: Colors.white,
                                                value: AuthShopCubit.get(context)
                                                    .policyShopChecked
                                                // AuthCubit.get(context)
                                                //     .policyChecked
                                                ,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _onChanged(value);
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
                                        )
                                      ],
                                    ),
                                    ButtonLogIn(
                                      color: AuthShopCubit.get(context)
                                              .policyShopChecked
                                          ? ColorManager.lightOrange
                                          : ColorManager.grey,
                                      onPressed: () {
                                        if (formKeyLogIn.currentState!
                                            .validate()) {
                                          if (AuthShopCubit.get(context)
                                                  .policyShopChecked ==
                                              true) {
                                            cubit.fetchShopUser();
                                            // cubit.loginAndValidate(
                                            //     emailOrPhone:
                                            //     cubit.loginNameController.text,
                                            //     password: cubit
                                            //         .loginPasswordController.text);
                                          }else{
                                            print('object');
                                            _onChanged(false);
                                            _onChanged(false);
                                            _onChanged(false);
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class ShopRegister extends StatelessWidget {
//   const ShopRegister({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('محل جديد'),),
//     );
//   }
// }
