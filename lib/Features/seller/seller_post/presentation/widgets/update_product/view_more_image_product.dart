import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';

import '../../../../../../core/utils/theme/color_manager.dart';
import '../../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../../core/utils/widgets/add_image.dart';
import '../../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../data/models/post_seller_model.dart';
import '../../cubit/post_seller_cubit.dart';

class ViewMoreImageProduct extends StatefulWidget {
  const ViewMoreImageProduct({super.key, required this.productImages});

  final ProductImages productImages;

  @override
  State<ViewMoreImageProduct> createState() => _ViewMoreImageProductState();
}

class _ViewMoreImageProductState extends State<ViewMoreImageProduct> {
  @override
  Widget build(BuildContext context) {
    var cubit = PostSellerCubit.get(context);
    List<ProductImagesData> images =
        widget.productImages.productImagesData ?? [];
    List<File> moreImages = cubit.moreImages;
    return SizedBox(
      height:
          // moreImages.isNotEmpty || images.isNotEmpty
          //     ?
          MediaQuery.sizeOf(context).width / 3
      // : 45
      ,
      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            height:
                // moreImages.isNotEmpty || images.isNotEmpty
                //     ?
                MediaQuery.sizeOf(context).width / 5
            // : 45
            ,
            width: MediaQuery.sizeOf(context).width / 5,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              dashPattern: [8, 4],
              strokeWidth: 2,
              padding: EdgeInsets.all(6),
              // color: ColorManager.backTextFrom,
              // height: 45,
              // width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Center(
                  child: IconButton(
                    color: ColorManager.backIcon,
                    onPressed: () async {
                      await AddImage.showCupertinoModalPopupAddImage(context,
                          gallery: () async {
                        cubit.xFileMoreImages = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (cubit.xFileMoreImages != null) {
                          File originalImageFile =
                              File(cubit.xFileMoreImages!.path);
                          File resizedImageFile = await resizeAndCompressImage(

                              /// تصغير حجم الصورة
                              imageFile: originalImageFile,
                              width: 800,
                              quality: 95);
                          setState(() {
                            cubit.moreImages.add(resizedImageFile);
                          });
                        }
                      }, camera: () async {
                        cubit.xFileMoreImages = await ImagePicker()
                            .pickImage(source: ImageSource.camera);
                        if (cubit.xFileMoreImages != null) {
                          File originalImageFile =
                              File(cubit.xFileMoreImages!.path);
                          File resizedImageFile = await resizeAndCompressImage(
                              imageFile: originalImageFile,
                              width: 800,
                              quality: 95);
                          setState(() {
                            cubit.moreImages.add(resizedImageFile);
                          });
                        }
                      });
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
          moreImages.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).width / 3,
                  child: ListView.builder(
                    itemCount: moreImages.length,
                    shrinkWrap: true,
                    reverse: true,
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
                                  moreImages[index],
                                  fit: BoxFit.fill,
                                  height: MediaQuery.sizeOf(context).width / 3,
                                  width: MediaQuery.sizeOf(context).width / 3,
                                )),
                            SizedBox(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    cubit.moreImages.removeAt(index);
                                    print(moreImages.length);
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
          images.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).width / 3,
                  child: ListView.builder(
                    itemCount: images.length,
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
                                url: images[index].productImage ?? '',
                                height: MediaQuery.sizeOf(context).width / 3,
                                width: MediaQuery.sizeOf(context).width / 3,
                              ),
                            ),
                            SizedBox(
                                child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cubit.deleteImage(
                                      imageId: images[index].productImageId!,
                                      imageName:
                                          images[index].productImage ?? '');

                                  images.removeAt(index);
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
