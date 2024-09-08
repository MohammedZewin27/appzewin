import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:sahel_net/core/utils/api/api_service.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/function/custom_location.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../auth/presentation/views/widget/auth_text_form.dart';
import '../../../../auth/presentation/views/widget/text_form_password.dart';
import '../../../check_seller_active/presentation/pages/check_seller.dart';
import '../../data/repositories/seller_repo_impl.dart';
import '../cubit/cubit_category/category_cubit.dart';
import '../cubit/seller_cubit.dart';
import '../widgets/drop_down_choose_category.dart';
import '../widgets/drop_down_choose_parent.dart';
import '../widgets/test_add_new_seller.dart';

class SellerPageRegister extends StatefulWidget {
  const SellerPageRegister({super.key});

  @override
  State<SellerPageRegister> createState() => _SellerPageRegisterState();
}

class _SellerPageRegisterState extends State<SellerPageRegister> {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SellerCubit(SellerRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(SellerRepoImpl(ApiService(Dio()))),
        ),
      ],
      child: BlocListener<SellerCubit, SellerState>(
        listener: (context, state) {
          if (state is AddSellerSuccess) {
            if (state.sellerData.status == AppString.success) {
              print(state.sellerData.sellerData?.idHirajSeller);
              StringCache.activeSeller = true;
              CacheData.setData(key: StringCache.sellerActive, value: true);
              CacheData.setData(
                  key: StringCache.idSeller,
                  value: state.sellerData.sellerData?.idHirajSeller);
              CacheData.setData(
                  key: StringCache.sellerStatus,
                  value: state.sellerData.sellerData?.sellerStatus);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckSeller(),
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
          } else if (state is AddSellerLoading) {
            const Center(child: CustomProgressIndicator());
          } else if (state is AddSellerFailure) {
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
            title: const Text('تسجيل بائع جديد'),
            actions: [Image.asset(Assets.imagesLogo)],
          ),
          bottomSheet: BottomSheet(
            enableDrag: false,
            onClosing: () {},
            builder: (context) {
              var cubit = SellerCubit.get(context);
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 8),
                                      const TestAddNewSeller(),
                                      const SizedBox(height: 12),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'اسم المتجر',
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
                                            colorIcon: ColorManager.darkOrange,
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value?.trim() == '' ||
                                                  value!.isEmpty) {
                                                return 'الاسم المتجر';
                                              }
                                              return null;
                                            },
                                            controller:
                                                cubit.nameSellerController,
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
                                                return ' رقم الجوال يبدأ بـ 966';
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
                                                cubit.phoneSellerController,
                                            hintText: '',
                                            prefixIcon: Icons.phone),
                                      ),
                                      const SizedBox(height: 12),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'عنوان المتجر',
                                          style: AppStyles.styleBold14
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: CustomTextForm(
                                            colorIcon: ColorManager.lightGreen,
                                            validator: (value) {
                                              if (value?.trim() == '' ||
                                                  value!.isEmpty ||
                                                  value.length < 8) {
                                                return 'عنوان المتجر';
                                              }
                                              return null;
                                            },
                                            controller:
                                                cubit.addressSellerController,
                                            hintText: '',
                                            prefixIcon:FontAwesomeIcons.solidAddressBook,),
                                      ),
                                      const SizedBox(height: 12),
                                       GetLocationFromUser(controller: cubit.locationSellerController,),
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
                                            cubit.passwordSellerController,
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
                                        child: DropDownChooseParentToSeller(),
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
                                        child: DropDownChooseCategory(),
                                      ),
                                      const SizedBox(height: 12),
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
                                                      1);
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
                                                    ColorManager.lightOrange),
                                            onPressed: () {
                                              if (formKeyAddNewSeller
                                                  .currentState!
                                                  .validate()) {
                                                if(cubit.policyChecked){
                                                  SellerCubit.get(context)
                                                      .calculateNewDate();

                                                  /// add 1 year
                                                  if (SellerCubit.get(context)
                                                      .logeImageFile !=
                                                      null) {
                                                    SellerCubit.get(context)
                                                        .addNewSeller();
                                                  }
                                                }else{
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
                                                          color: Colors.white),
                                                ),
                                              ],
                                            )),
                                      ),
                                      const SizedBox(height: 12),
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

        ),
      ),
    );
  }
}

class GetLocationFromUser extends StatelessWidget {
  const GetLocationFromUser({
    super.key, required this.controller,
  });
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        try {
          Position position = await getCurrentLocation();
          String mapLink = generateGoogleMapsLink(position);
          print("Your location: $mapLink");
          controller.text = mapLink.toString();
        } catch (e) {
          print("Error: $e");
        }
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الموقع',
              style: AppStyles.styleBold14.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomTextForm(
                enabled: false,
                colorIcon: ColorManager.lightGreen,
                validator: (value) {
                  if (value?.trim() == '' ||
                      value!.isEmpty ||
                      value.length < 8) {
                    return 'الموقع';
                  }
                  return null;
                },
                controller: controller,
                hintText: 'اضغط هنا للحصول على الموقع',
                prefixIcon: Icons.location_on),
          ),
        ],
      ),
    );


  }
}
