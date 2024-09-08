import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../core/crop_Image_edite.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../../core/utils/widgets/reduce_image_size.dart';
import '../../../../../generated/assets.dart';
import '../cubit/seller_cubit.dart';

class TestAddNewSeller extends StatefulWidget {
  const TestAddNewSeller({
    super.key,
  });

  @override
  State<TestAddNewSeller> createState() => _TabBodySellerState();
}

class _TabBodySellerState extends State<TestAddNewSeller> {
  @override
  Widget build(BuildContext context) {
    // isPermissionGranted();
    var cubit = SellerCubit.get(context);
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
          });
        },
        child: Column(
          children: [
            cubit.logeImageFile != null
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
                              cubit.logeImageFile!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),

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
                      // Center(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         Assets.imagesAddLogo,
                      //         height: 30,
                      //         width: 30,
                      //       ),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       const AutoSizeText(
                      //         '+ اضغط هنا لاختيار صورة لمتجرك',
                      //         style: AppStyles.styleSemiBold16,
                      //       ),
                      //       const SizedBox(
                      //         height: 6,
                      //       ),
                      //       AutoSizeText(
                      //         'سوف تظهر عند عرض بيانات الاساسية داخل التطبيق ',
                      //         style: AppStyles.styleSemiBold12
                      //             .copyWith(color: Colors.black38),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
