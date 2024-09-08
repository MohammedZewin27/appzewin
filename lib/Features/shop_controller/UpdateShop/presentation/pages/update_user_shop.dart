import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/const/const_shop.dart';
import 'package:sahel_net/Features/shop_controller/UpdateShop/data/repositories/update_shop_repo_impl.dart';
import 'package:sahel_net/Features/shop_controller/layout_shop/presentation/cubit/layout_shop_cubit.dart';

import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../choose_user/presentation/cubit/shop_active_cubit.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../core_shop/widget/custom_text_form_field_fill_gray.dart';
import '../../../information_shop_user/data/models/information_model.dart';
import '../../../information_shop_user/presentation/cubit/information_shop_cubit.dart';
import '../cubit/up_date_shop_cubit.dart';
import '../widgets/add_more_image_shop.dart';
import '../widgets/add_more_services_shop.dart';
import '../widgets/image_shop_user_edit.dart';

class UpdateUserShop extends StatelessWidget {
  const UpdateUserShop({
    super.key,
    this.shopData,
  });

  final ShopData? shopData;

  // final List<ImagesData> imagesShopUser;

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController =
        TextEditingController(text: shopData?.shopPhone);
    TextEditingController informationController =
        TextEditingController(text: shopData?.shopInformation);
    TextEditingController addressController =
        TextEditingController(text: shopData?.shopAddress);
    return BlocProvider(
      create: (context) => UpDateShopCubit(UpdateShopRepoImpl(ApiShop(Dio()))),
      child: BlocConsumer<UpDateShopCubit, UpDateShopState>(
        listener: (context, state) {
          if (state is UpdateShopLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                backgroundColor: ColorManager.primary7,
                title: Text(
                  'جاري حفظ التعديلات ',
                  style: AppStyles.styleBold14.copyWith(color: Colors.white),
                ),
                icon: const Center(child: CustomProgressIndicator()),
              ),
            );
          }
          if (state is UpdateShopSuccess) {
            Navigator.pop(context);
            InformationShopCubit.get(context).getImagesShop();
            ShopActiveCubit.get(context).getDateShop();
            LayoutShopCubit.get(context).changeIndex(2);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    ImageShopUserEdit(
                      shopData: shopData,
                    ),
                    const SizedBox(height: 20),
                    AddMoreImageShop(
                      imagesShopUser: addMoreImages,
                    ),
                    const SizedBox(height: 20),
                    AddMoreServicesShop(),
                    const SizedBox(height: 20),
                    CustomTextFormFieldFillGray(
                      title: 'الاسم',
                      enabled: false,
                      controller: TextEditingController(
                        text: shopData?.shopName ?? "",
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormFieldFillGray(
                      maxLines: 2,
                      minLines: 1,
                      title: 'العنوان',
                      controller: addressController,
                      validator: (value) {
                        if (value?.trim() == '' || value!.isEmpty) {
                          return 'الاسم المتجر';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormFieldFillGray(
                      title: 'الجوال',
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
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
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormFieldFillGray(
                      maxLines: 10,
                      minLines: 1,
                      title: 'التفاصيل',
                      controller: informationController,
                      validator: (value) {
                        if (value?.trim() == '' || value!.isEmpty) {
                          return 'التفاصيل';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                addImageInDatabase(
                                        context: context,
                                        addMoreImages:
                                            UpDateShopCubit.get(context)
                                                .addMoreImages)
                                    .whenComplete(
                                  () {
                                    if (!context.mounted) return;
                                    addServicesInDatabase(
                                            context: context,
                                            addMoreServices:
                                                UpDateShopCubit.get(context)
                                                    .addServices)
                                        .whenComplete(
                                      () {
                                        if (!context.mounted) return;
                                        UpDateShopCubit.get(context)
                                            .updateShopUser(
                                          shopPhone: phoneController.text,
                                          shopAddress: addressController.text,
                                          shopInformation:
                                              informationController.text,
                                          oldShopImage:
                                              shopData?.shopImage ?? '',
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.primary7,
                                  elevation: 6),
                              child: Text(
                                'حفظ التعديل ',
                                style: AppStyles.styleBold14
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
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
      ),
    );
  }
}

Future<void> addImageInDatabase({
  required BuildContext context,
  required List<File> addMoreImages,
}) async {
  var cubit = UpDateShopCubit.get(context);

  for (int i = 0; i < addMoreImages.length; i++) {
    // print( cubit.addMoreImages[i]);
    await cubit.addImageShop(shopImage: addMoreImages[i]);
  }
}

Future<void> addServicesInDatabase({
  required BuildContext context,
  required List<String> addMoreServices,
}) async {
  var cubit = UpDateShopCubit.get(context);

  for (int i = 0; i < addMoreServices.length; i++) {
    // print( cubit.addMoreServices[i]);
    await cubit.addServicesShop(shopServices: addMoreServices[i]);
  }
}
