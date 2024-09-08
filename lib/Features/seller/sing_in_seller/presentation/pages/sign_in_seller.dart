import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/seller/sing_in_seller/presentation/cubit/singin_seller_cubit.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/title_auth.dart';
import '../../../../../generated/assets.dart';
import '../../../../auth/presentation/views/widget/auth_text_form.dart';
import '../../../../auth/presentation/views/widget/button_Log_in.dart';
import '../../../../auth/presentation/views/widget/text_form_password.dart';
import '../../../../setting/presentation/widgets/header_setting.dart';
import '../../../check_seller_active/presentation/pages/check_seller.dart';
import '../../../seller_layout/presentation/pages/seller_layout.dart';
import '../../../sing_up_seller/presentation/pages/seller_page_register.dart';

class SignInSeller extends StatefulWidget {
  const SignInSeller({
    super.key,
  });

  @override
  State<SignInSeller> createState() => _SignInSellerState();
}

class _SignInSellerState extends State<SignInSeller> {
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
    var cubit = SingInSellerCubit.get(context);
    return BlocConsumer<SingInSellerCubit, SingInSellerState>(
      listener: (context, state) {
        if (state is SingInSellerSuccess) {
          if (state.sellerModel.status == AppString.success) {
            StringCache.activeSeller = true;
            CacheData.setData(key: StringCache.sellerActive, value: true);
            CacheData.setData(
                key: StringCache.idSeller,
                value: state.sellerModel.sellerData?.idHirajSeller);
            CacheData.setData(
                key: StringCache.sellerStatus,
                value: state.sellerModel.sellerData?.sellerStatus);
            if (state.sellerModel.sellerData?.sellerDelete ==
                AppString.deleteShopUser) {
              CherryToast.error(
                title: Text('يوجد خطاء في الكود او الرقم السري' ?? ''),
              ).show(context);
            } else {
              state.sellerModel.sellerData?.sellerStatus == '1'
                  ? Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const SellerLayout();
                        },
                      ),
                    )
                  : Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const CheckSeller();
                        },
                      ),
                    );
            }
          } else {
            // cherry_toast
            CherryToast.error(
              title: Text(state.sellerModel.message ?? ''),
            ).show(context);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            // padding: const EdgeInsets.only(top: 20, left: 5, right: 16),
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
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
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
                                      Assets.imagesSellers,
                                      width:
                                          MediaQuery.sizeOf(context).width / 6,
                                      height:   MediaQuery.sizeOf(context).width / 6,
                                    ),

                                    TitleAuth(
                                      textColor: Colors.white,
                                      backgroundColor: ColorManager.blue,
                                      title: 'حساب بائع',
                                    ),
                                    const SizedBox(height: 25),
                                    const Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'كود الدخول',
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
                                              return 'كود الدخول';
                                            }
                                            return null;
                                          },
                                          controller: cubit.code,
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
                                      controller: cubit.password,
                                    ),
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
                                                      const SellerPageRegister(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'ليس لدي حساب بائع',
                                              style: AppStyles.styleSemiBold10
                                                  .copyWith(
                                                      color:
                                                          ColorManager.blue2),
                                            ),
                                          ),
                                        ),
                                        Row(

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
                                                    color: cubit
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
                                                  1),
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
                                                value: cubit.policyChecked
                                                // AuthCubit.get(context)
                                                //     .policyChecked
                                                ,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _onChanged(value);
                                                 cubit
                                                        .policyChecked =
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
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: [
                                        //     Align(
                                        //       alignment: Alignment.centerRight,
                                        //       child: Text(
                                        //         'الموافقة على سياسة الخصوصية ',
                                        //         style: AppStyles.styleSemiBold10
                                        //             .copyWith(
                                        //                 // color: AuthCubit.get(context)
                                        //                 //     .policyChecked
                                        //                 //     ? ColorManager.blue2
                                        //                 //     : ColorManager.red
                                        //                 ),
                                        //       ),
                                        //     ),
                                        //     // Checkbox(
                                        //     //   activeColor: Colors.green,
                                        //     //   checkColor: Colors.white,
                                        //     //   value: AuthCubit.get(context)
                                        //     //       .policyChecked,
                                        //     //   onChanged: (value) {
                                        //     //     setState(() {
                                        //     //       AuthCubit.get(context)
                                        //     //           .policyChecked = value!;
                                        //     //       privacyPolicy(context);
                                        //     //     });
                                        //     //   },
                                        //     // ),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                    ButtonLogIn(
                                      color:cubit     .policyChecked
                                          ? ColorManager.lightOrange
                                          : ColorManager.grey,
                                      onPressed: () {
                                        if (formKeyLogIn.currentState!
                                            .validate()) {
                                          if(cubit.policyChecked==true){
                                            cubit.getSellerWithCode();
                                          }else{
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
