import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/crop_Image_edite.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../core_shop/const/const_shop.dart';
import '../../../information_shop_user/data/models/information_model.dart';
import '../cubit/up_date_shop_cubit.dart';

class AddMoreImageShop extends StatefulWidget {
  const AddMoreImageShop({
    super.key,
    required this.imagesShopUser,
  });

  final List<ImagesData> imagesShopUser;

  @override
  State<AddMoreImageShop> createState() => _AddMoreImageProductState();
}

class _AddMoreImageProductState extends State<AddMoreImageShop> {
  @override
  Widget build(BuildContext context) {
    var cubit = UpDateShopCubit.get(context);
    List<ImagesData> imagesShop = widget.imagesShopUser;
    List<File> addMoreImages = cubit.addMoreImages;
    return SizedBox(
      height: MediaQuery.sizeOf(context).width / 3,
      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).width / 5,
            width: MediaQuery.sizeOf(context).width / 5,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                dashPattern: const [8, 4],
                strokeWidth: 3,
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Center(
                    child: IconButton(
                      enableFeedback: false,
                      color: ColorManager.backIcon,
                      onPressed: () async {
                        if (imagesShop.length + addMoreImages.length < 8) {
                          await AddImage.showCupertinoModalPopupAddImage(
                              context, gallery: () async {
                            cubit.xFileMoreImages = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (cubit.xFileMoreImages != null) {
                              File originalImageFile =
                                  File(cubit.xFileMoreImages!.path);
                              File? editeImageFiled =
                                  await cropImage(originalImageFile);
                              if (editeImageFiled != null) {
                                File resizedImageFile =
                                    await resizeAndCompressImage(

                                        /// تصغير حجم الصورة
                                        imageFile: editeImageFiled,
                                        width: 800,
                                        quality: 95);
                                setState(() {
                                  cubit.addMoreImages.add(resizedImageFile);
                                });
                              }
                            }
                          }, camera: () async {
                            cubit.xFileMoreImages = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (cubit.xFileMoreImages != null) {
                              File originalImageFile =
                                  File(cubit.xFileMoreImages!.path);
                              File? editeImageFiled =
                                  await cropImage(originalImageFile);
                              if (editeImageFiled != null) {
                                File resizedImageFile =
                                    await resizeAndCompressImage(
                                        imageFile: originalImageFile,
                                        width: 800,
                                        quality: 95);
                                setState(() {
                                  cubit.addMoreImages.add(resizedImageFile);
                                });
                              }
                            }
                          });
                        } else {
                          CherryToast.warning(
                            title: const Text('الحد الاقصي 8 صور فقط'),
                          ).show(context);
                        }
                      },
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.photo_camera_rounded,
                            color: ColorManager.backIcon,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'اضافة صور',
                            style: AppStyles.styleSemiBold10.copyWith(
                              color: ColorManager.backIcon,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          addMoreImages.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).width / 3,
                  child: ListView.builder(
                    itemCount: addMoreImages.length,
                    shrinkWrap: true,
                    reverse: false,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3,
                        child: Stack(
                          children: [
                            Card(
                                elevation: 4,
                                clipBehavior: Clip.antiAlias,
                                child: Image.file(
                                  addMoreImages[index],
                                  fit: BoxFit.fill,
                                  height: MediaQuery.sizeOf(context).width / 3,
                                  width: MediaQuery.sizeOf(context).width / 3,
                                )),
                            SizedBox(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    cubit.addMoreImages.removeAt(index);
                                    print(addMoreImages.length);
                                  });
                                },
                                icon: const Icon(
                                  Icons.highlight_remove,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
          imagesShop.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).width / 3,
                  child: ListView.builder(
                    itemCount: imagesShop.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 4,
                              clipBehavior: Clip.antiAlias,
                              child: CachedImage(
                                url: imagesShop[index].shopImageUrl ?? '',
                                height: MediaQuery.sizeOf(context).width / 3,
                                width: MediaQuery.sizeOf(context).width / 3,
                              ),
                            ),
                            SizedBox(
                                child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cubit.deleteImageShop(
                                      imageId: imagesShop[index].shopImageId!,
                                      imageShop:
                                          imagesShop[index].shopImageUrl ?? '');

                                  imagesShop.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.highlight_remove,
                                color: Colors.red,
                              ),
                            ))
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
