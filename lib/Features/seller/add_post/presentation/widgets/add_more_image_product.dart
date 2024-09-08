import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/crop_Image_edite.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../cubit/add_post_seller_cubit.dart';

class AddMoreImageProduct extends StatefulWidget {
  const AddMoreImageProduct({
    super.key,
  });

  @override
  State<AddMoreImageProduct> createState() => _AddMoreImageProductState();
}

class _AddMoreImageProductState extends State<AddMoreImageProduct> {
  @override
  Widget build(BuildContext context) {
    var cubit = AddPostSellerCubit.get(context);

    List<File> addMoreImages = cubit.addMoreImages;
    return SizedBox(
      height: MediaQuery.sizeOf(context).width / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.primary7.withOpacity(.03),
        ),
        child: ListView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              height:
                  // addMoreImages.isNotEmpty || images.isNotEmpty
                  //     ?
                  MediaQuery.sizeOf(context).width / 5
              // : 45
              ,
              width: MediaQuery.sizeOf(context).width / 5,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: DottedBorder(
                  color: ColorManager.primary7.withOpacity(.2),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [8, 4],
                  strokeWidth: 3,
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Center(
                      child: IconButton(
                        color: ColorManager.backIcon,
                        onPressed: () async {
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
                                        imageFile: editeImageFiled,
                                        width: 800,
                                        quality: 95);
                                setState(() {
                                  cubit.addMoreImages.add(resizedImageFile);
                                });
                              }
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
            ),
            addMoreImages.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).width / 3,
                    child: ListView.builder(
                      itemCount: addMoreImages.length,
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
                                    addMoreImages[index],
                                    fit: BoxFit.fill,
                                    height:
                                        MediaQuery.sizeOf(context).width / 3,
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
          ],
        ),
      ),
    );
  }
}
