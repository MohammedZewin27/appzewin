import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/crop_Image_edite.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../cubit/up_date_shop_cubit.dart';

class ImageShopUserEdit extends StatefulWidget {
  const ImageShopUserEdit({
    super.key,
    this.shopData,
  });

  final ShopData? shopData;

  @override
  State<ImageShopUserEdit> createState() => _ImageShopUserEditState();
}

class _ImageShopUserEditState extends State<ImageShopUserEdit> {
  @override
  Widget build(BuildContext context) {
    var cubit = UpDateShopCubit.get(context);
    return InkWell(
      onTap: () async {
        print('object////////////////////////');
        await AddImage.showCupertinoModalPopupAddImage(context,
            gallery: () async {
          cubit.xFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (cubit.xFile != null) {
            File originalImageFile = File(cubit.xFile!.path);
            File? editeImageFiled = await cropImage(originalImageFile);
            if (editeImageFiled != null) {
              File resizedImageFile = await resizeAndCompressImage(

                /// تصغير حجم الصورة
                  imageFile: editeImageFiled,
                  width: 800,
                  quality: 95);
              setState(() {
                cubit.newImageProduct = resizedImageFile;
              });
            }
            setState(() {
              cubit.newImageProduct = File(cubit.xFile!.path);
            });
            }

        }, camera: () async {
          cubit.xFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (cubit.xFile != null) {
            File originalImageFile = File(cubit.xFile!.path);
            File? editeImageFiled = await cropImage(originalImageFile);
            if (editeImageFiled != null) {
              File resizedImageFile = await resizeAndCompressImage(
                  imageFile: editeImageFiled, width: 800, quality: 95);
              setState(() {
                cubit.newImageProduct = resizedImageFile;
              });
            }

          }
          setState(() {
            cubit.newImageProduct = File(cubit.xFile!.path);
          });
        });
      },
      child: Column(
        children: [
          // cubit.imagePoster != null
          //     ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
                elevation: 3,
                clipBehavior: Clip.antiAlias,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: cubit.xFile == null
                            ? CachedImage(url: widget.shopData?.shopImage ?? '')
                            : Image.file(
                                File(cubit.xFile!.path),
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
