import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahel_net/Features/seller/add_post/presentation/cubit/add_post_seller_cubit.dart';

import '../../../../../core/crop_Image_edite.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../../../generated/assets.dart';

class AddPostImage extends StatefulWidget {
  const AddPostImage({super.key});

  @override
  State<AddPostImage> createState() => _AddPostImageState();
}

class _AddPostImageState extends State<AddPostImage> {
  @override
  Widget build(BuildContext context) {
    var cubit = AddPostSellerCubit.get(context);
    return InkWell(
      onTap: () async {
        print('object////////////////////////');
        await AddImage.showCupertinoModalPopupAddImage(context,
            gallery: () async {
          XFile? xFile =
              await  ImagePicker().pickImage(source: ImageSource.gallery);
          if (xFile != null) {
            File originalImageFile = File(xFile.path);
            File? editeImageFiled = await cropImage(originalImageFile);
            if (editeImageFiled != null) {
              File resizedImageFile = await resizeAndCompressImage(
                /// تصغير حجم الصورة
                  imageFile: editeImageFiled,
                  width: 800,
                  quality: 95);
              setState(() {
                cubit.imagePoster = resizedImageFile;
              });
            }

          }
          // setState(() {
          //   cubit.logeImageFile = File(xFile!.path);
          // });
        }, camera: () async {
          XFile? xFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (xFile != null) {
            File originalImageFile = File(xFile.path);
            File? editeImageFiled = await cropImage(originalImageFile);
            if (editeImageFiled != null) {
              File resizedImageFile = await resizeAndCompressImage(
                  imageFile: editeImageFiled, width: 800, quality: 95);
              setState(() {
                cubit.imagePoster = resizedImageFile;
              });
            }

          }
          // setState(() {
          //   cubit.logeImageFile = File(xFile!.path);
          // });
        });
      },
      child: Column(
        children: [
          cubit.imagePoster != null
              ? Card(
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Image.file(
                            cubit.imagePoster!,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        // Container(
                        //   height: 38,
                        //   width: double.infinity,
                        //   color: Colors.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 8.0, vertical: 5),
                        //     child: Text(
                        //       'SellerCubit.get(context).nameSellerController.text',/// change
                        //       maxLines: 2,
                        //       overflow: TextOverflow.ellipsis,
                        //       textDirection: TextDirection.rtl,
                        //       textAlign: TextAlign.center,
                        //       style: AppStyles.styleSemiBold10.copyWith(
                        //           color: ColorManager.primary7,
                        //           fontWeight: FontWeight.w700),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 5,),
                      ],
                    ),
                  ),
                )
              : DottedBorder(
            color: ColorManager.primary7.withOpacity(.2),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [8, 4],
                  strokeWidth: 3,
                  padding: const EdgeInsets.all(6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 20,
                          ),
                          const Icon(
                            Icons.photo_camera_rounded,
                            color: ColorManager.backIcon,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'اضافة صورة',
                            style: AppStyles.styleSemiBold10.copyWith(
                              color: ColorManager.backIcon,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
