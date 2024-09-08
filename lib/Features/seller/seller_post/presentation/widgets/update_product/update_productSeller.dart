import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahel_net/Features/seller/core/api/api_service_seller.dart';
import 'package:sahel_net/Features/seller/core/const.dart';
import 'package:sahel_net/Features/seller/seller_post/data/repositories/post_seller_repo_impl.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/cubit/post_seller_cubit.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/widgets/update_product/switch_status_and_delivery.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../../core/utils/widgets/add_image.dart';
import '../../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../data/models/post_seller_model.dart';

import 'view_more_image_product.dart';

class UpdateProductSeller extends StatefulWidget {
  const UpdateProductSeller({super.key, required this.dataPost});

  final ProductsSeller dataPost;

  @override
  State<UpdateProductSeller> createState() =>
      _UpdateProductSellerState();
}

class _UpdateProductSellerState
    extends State<UpdateProductSeller> {
  @override
  Widget build(BuildContext context) {
    var cubit = PostSellerCubit.get(context);
    TextEditingController titleController =
        TextEditingController(text: widget.dataPost.titleProduct);
    TextEditingController detailsController =
        TextEditingController(text: widget.dataPost.detailsProduct);
    return BlocConsumer<PostSellerCubit, PostSellerState>(
      listener: (context, state) {
        // if (state is AddImagesToProductLoading) {
        //   showDialog(
        //     context: context,
        //     builder: (context) =>
        //         const Center(child: CustomProgressIndicator()),
        //   );
        // }
        // if (state is AddImagesToProductSuccess) {
        //   cubit.moreImages = [];
        //   Navigator.pop(context);
        //   Navigator.pop(context);
        // }
        // if (state is AddImagesToProductFailure) {}
      },
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult:
         (didPop,c) {
            cubit.moreImages = [];
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                widget.dataPost.titleProduct ?? '',
                textDirection: TextDirection.rtl,
              ),
              actions: [
                Container(
                    margin: const EdgeInsets.all(5),
                    width: 38,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: widget.dataPost.statusProduct == 1
                            ? Colors.green
                            : Colors.black54),
                    child:
                        CachedImage(url: widget.dataPost.imageProduct ?? '')),
                // const SizedBox(
                //   height: 3,
                // ),
              ],
            ),
            body: Form(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () async {
                        await AddImage.showCupertinoModalPopupAddImage(context,
                            gallery: () async {
                          cubit.xFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (cubit.xFile != null) {
                            File originalImageFile = File(cubit.xFile!.path);
                            File resizedImageFile =
                                await resizeAndCompressImage(

                                    /// تصغير حجم الصورة
                                    imageFile: originalImageFile,
                                    width: 800,
                                    quality: 95);
                            setState(() {
                              cubit.newImageProduct = resizedImageFile;
                            });
                          }
                        }, camera: () async {
                          cubit.xFile = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (cubit.xFile != null) {
                            File originalImageFile = File(cubit.xFile!.path);
                            File resizedImageFile =
                                await resizeAndCompressImage(
                                    imageFile: originalImageFile,
                                    width: 800,
                                    quality: 95);
                            setState(() {
                              cubit.newImageProduct = resizedImageFile;
                            });
                          }
                        });
                      },
                      child: Stack(
                        textDirection: TextDirection.rtl,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: cubit.xFile == null
                                ? CachedImage(
                                    url: widget.dataPost.imageProduct ?? '')
                                : Image.file(
                                    File(cubit.xFile!.path),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: widget.dataPost.statusProduct == 1
                                        ? Colors.green
                                        : Colors.black54),
                                child: Center(
                                  child: Text(
                                    widget.dataPost.statusProduct == 1
                                        ? 'فعال'
                                        : 'غير\n فعال',
                                    textAlign: TextAlign.center,
                                    style: AppStyles.styleSemiBold12
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 12,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  right: 8, left: 5, bottom: 2, top: 2),
                              // width: 43,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.white70,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.dataPost.ratingProduct
                                        .toString()
                                        .substring(0, 3),
                                    style: AppStyles.styleBold14.copyWith(
                                        fontSize: 12, color: Colors.white70),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            ' العنوان',
                            style: AppStyles.styleBoldPrimary16
                                .copyWith(color: ColorManager.backBlack),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            textDirection: TextDirection.rtl,
                            controller: titleController,
                            style: AppStyles.styleSemiBold16,
                            maxLines: 5,
                            minLines: 1,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              filled: true,
                              fillColor: ColorManager.backTextFrom,
                              border:
                                  // InputBorder.none
                                  OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ViewMoreImageProduct(
                            productImages: widget.dataPost.productImages!,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            ' التفاصيل',
                            style: AppStyles.styleBoldPrimary16
                                .copyWith(color: ColorManager.backBlack),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            maxLines: 10,
                            minLines: 1,
                            maxLength: 300,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 16),
                            textDirection: TextDirection.rtl,
                            controller: detailsController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              filled: true,
                              fillColor: ColorManager.backTextFrom,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SwitchStatusAndDelivery(
                      dataPost: widget.dataPost,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Expanded(
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    showDialog(

                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: ColorManager.primary7,
                                        title: Text(
                                          'جاري حفظ التعديلات ',
                                          style: AppStyles.styleBold14
                                              .copyWith(color: Colors.white),
                                        ),
                                        icon: const Center(
                                            child: CustomProgressIndicator()),
                                      ),
                                    );
                                    await PostSellerCubit.get(context)
                                        .updatePostOfSeller(
                                      oldImage:
                                          widget.dataPost.imageProduct ?? '',
                                      idProduct: widget.dataPost.idProduct!,
                                      titleProduct: titleController.text,
                                      detailsProduct: detailsController.text,
                                      newPriceProduct:
                                          widget.dataPost.newPriceProduct ?? '',
                                      oldPriceProduct: widget
                                          .dataPost.oldPriceProduct
                                          .toString(),
                                      qualityProduct: widget
                                          .dataPost.qualityProduct
                                          .toString(),
                                    );
                                    if (!context.mounted) return;
                                    await addImageInDatabase(
                                            context: context,
                                            moreImages: cubit.moreImages,
                                            productId:
                                                widget.dataPost.idProduct!)
                                        .then((value) {
                                      PostSellerCubit.get(context)
                                          .fetchPostOfSeller(sellerId: widget.dataPost.idSellerProduct ?? 0);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    });
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorManager.red,
                                      elevation: 6),
                                  onPressed: () async {
                                    List<ProductImagesData> images =
                                        widget.dataPost.productImages!.productImagesData ?? [];

                                    if (images.isEmpty) {
                                      cubit.deleteProductSeller(
                                        images: [],///-------------------------
                                          productId: widget.dataPost.idProduct!,
                                          imageName: widget.dataPost.imageProduct ?? '');
                                    } else if (images.isNotEmpty) {
                                      for (int i = 0; i < images.length; i++) {
                                        cubit
                                            .deleteImage(
                                            imageId: images[i].productImageId!,
                                            imageName: images[i].productImage ?? '')
                                            .then((value) => cubit.deleteProductSeller(
                                          images:[] ,///-------------------
                                            productId: widget.dataPost.idProduct!,
                                            imageName: widget.dataPost.imageProduct ?? ''));
                                      }
                                    }
                                  },
                                  child: Text('حذف ',
                                      style: AppStyles.styleBold14
                                          .copyWith(color: Colors.white))),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
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

Future<void> addImageInDatabase(
    {required BuildContext context,
    required List<File> moreImages,
    required int productId}) async {
  var cubit = PostSellerCubit.get(context);
  // Future.wait(moreImages.map((image){
  //   return cubit.addImagesToProduct(
  //       productId: productId, newImageProduct: moreImages[i]);
  // }) );
  for (int i = 0; i < moreImages.length; i++) {
    await cubit.addImagesToProduct(
        productId: productId, newImageProduct: moreImages[i]);
  }
}
