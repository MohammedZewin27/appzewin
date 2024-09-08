import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';

import '../../../../../core/crop_Image_edite.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../../../generated/assets.dart';

class AddImageNewShop extends StatefulWidget {
  const AddImageNewShop({super.key});

  @override
  State<AddImageNewShop> createState() => _AddImageNewShopState();
}

class _AddImageNewShopState extends State<AddImageNewShop> {
  @override
  Widget build(BuildContext context) {
    var cubit = AuthShopCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .10),
      child: GestureDetector(
        onTap: () async {
          await AddImage.showCupertinoModalPopupAddImage(context,
              gallery: () async {
            XFile? xFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (xFile != null) {
              File originalImageFile = File(xFile.path);
              File? editeImageFiled = await cropImage(originalImageFile);
              if (editeImageFiled != null) {
                File resizedImageFile = await resizeAndCompressImage(
                    imageFile: editeImageFiled, width: 800, quality: 95);
                setState(() {
                  cubit.logeImageFile = resizedImageFile;
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
                  cubit.logeImageFile = resizedImageFile;
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
            cubit.logeImageFile != null
                ? Card(
                    elevation: 3,
                    clipBehavior: Clip.antiAlias,
                    child: AspectRatio(
                      aspectRatio: 1.3,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Image.file(
                              cubit.logeImageFile!,
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
                          //       SellerCubit.get(context).nameSellerController.text,
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
                : Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 30,
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
                        height: MediaQuery.sizeOf(context).height / 30,
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
