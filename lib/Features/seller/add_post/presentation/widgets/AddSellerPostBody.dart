import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/custom_switch.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../core/const.dart';
import '../../../seller_post/presentation/cubit/post_seller_cubit.dart';
import '../cubit/add_post_seller_cubit.dart';
import 'add_more_image_product.dart';
import 'add_post_image.dart';
import 'custom_row_text_form_and_title.dart';

class AddSellerPostBody extends StatefulWidget {
  const AddSellerPostBody({
    super.key,
  });

  @override
  State<AddSellerPostBody> createState() => _AddSellerPostBodyState();
}

class _AddSellerPostBodyState extends State<AddSellerPostBody> {
  bool statusProduct = false;
  bool deliveryService = false;
  bool visible = false;
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    var cubit = AddPostSellerCubit.get(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                child: Form(
                  key: cubit.formKey,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const AddPostImage(),
                          Visibility(
                              visible: visible,
                              child: const Text('اضف صورة المنتج',
                                  style: TextStyle(color: ColorManager.red))),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomRowTextFormAndTitle(
                            maxLength: 60,
                              minLines: 1,
                              maxLines: 2,

                              validator: (value) {
                                if (value!.isEmpty || value == '') {
                                  return 'اسم المنتج مطلوب';
                                }
                                return null;
                              },
                              controller: cubit.nameController,
                              title: 'اسم المنتج'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomRowTextFormAndTitle(
                            maxLength: 350,
                            maxLines: 10,
                              minLines: 1,
                              validator: (value) {
                                if (value!.isEmpty || value == '') {
                                  return 'تفاصيل المنتج ';
                                }
                                return null;
                              },
                              controller: cubit.detailsProductController,
                              title: 'تفاصيل المنتج '),
                          const SizedBox(
                            height: 10,
                          ),
                          const AddMoreImageProduct(),
                          const Divider(
                            color: ColorManager.grey,
                          ),
                          AutoSizeText(
                            'يمكنك اضافة المنتج بدون سعر او اضافة سعر جديد فقط ',
                            style: AppStyles.styleRegular12
                                .copyWith(color: Colors.black87),
                          ),
                          const Divider(
                            color: ColorManager.grey,


                          ),
                          SizedBox(
                            // height:150,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 3,
                                        child: CustomRowTextFormAndTitle(
                                            flexTextForm: 2,
                                            flexText: 1,
                                            controller:
                                                cubit.oldPriceProductController,
                                            title: 'السعر القديم')),
                                  ],
                                ),
                                const SizedBox(height: 8,),

                                Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 3,
                                        child: CustomRowTextFormAndTitle(
                                            flexTextForm: 2,
                                            flexText: 1,
                                            controller:
                                            cubit.newPriceProductController,
                                            title: 'السعر الجديد')),
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: Transform.scale(scale: .9,
                                    child: Radio(
                                      activeColor: ColorManager.primary7,
                                      groupValue: selectedOption,
                                      value: 0,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text('المنتج مستعمل',
                                  // textDirection: TextDirection.rtl,
                                  style: AppStyles.styleSemiBold12
                                      .copyWith(color: Colors.black87)),
                              Expanded(
                                child: ListTile(
                                  leading: Transform.scale(scale: .9,
                                    child: Radio(
                                      activeColor: ColorManager.primary7,


                                      value: 1,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text('المنتج  جديد',
                                  // textDirection: TextDirection.rtl,
                                  style: AppStyles.styleSemiBold12
                                      .copyWith(color: Colors.black87)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSwitch(
                                value: deliveryService,
                                onChanged: (value) {
                                  setState(() {
                                    deliveryService = value;
                                    cubit.checkDeliveryService(deliveryService);
                                  });
                                },
                              ),
                              Text('متاح خدمة توصيل المنتج',
                                  // textDirection: TextDirection.rtl,
                                  style: AppStyles.styleRegular14
                                      .copyWith(color: Colors.black87))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSwitch(
                                  onChanged: (value) {
                                    setState(() {
                                      statusProduct = value;
                                      cubit.checkStatusProduct(statusProduct);
                                    });
                                  },
                                  value: statusProduct),
                              Text('موافقة على نشر المنتج حاليا',
                                  // textDirection: TextDirection.rtl,
                                  style: AppStyles.styleRegular14
                                      .copyWith(color: Colors.black87))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary7),
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate() &&
                        cubit.imagePoster != null) {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => const AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: Center(
                                    child: CustomProgressIndicator(
                                  color: ColorManager.primary7,
                                )),
                              ));
                      cubit
                          .addProduct(
                              idParent:
                                  dataSellerInScreenAddPost?.parentId ?? 14,
                              sellerId:
                                  dataSellerInScreenAddPost?.idHirajSeller)
                          .then(
                        (value) {
                          PostSellerCubit.get(context).fetchPostOfSeller(
                              sellerId:
                                  CacheData.getData(key: StringCache.idSeller));
                        },
                      );
                    }
                    if (cubit.imagePoster == null) {
                      setState(() {
                        visible = true;
                      });
                    }
                  },
                  child: Text('نشر المنتج',
                      style: AppStyles.styleBold14
                          .copyWith(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.red),
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  child: Text('الغاء',
                      style: AppStyles.styleBold14
                          .copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


