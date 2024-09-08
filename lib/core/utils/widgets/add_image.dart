import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../permission_service.dart';

class AddImage {
  static Future<dynamic> showCupertinoModalPopupAddImage(BuildContext context,
      {required Function gallery, required Function camera}) async {
    print('555555555555*5/////////////');

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 70, // ارتفاع الـ Bottom Sheet
          padding: EdgeInsets.symmetric(horizontal: 10), // إضافة padding ليبدو التصميم أجمل
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع العناصر بشكل متساوٍ
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () async {
                    var permission = await isPermissionStorageGranted();
                                    if (permission == false) return;

                                    gallery();
                                    // CherryToast.success( title: Text('تم اختيار الصورة من الاستوديو بنجاح ')).show(context);
                                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.photo_library, size: 30),
                      SizedBox(height: 5),
                      Text('عرض الصور'),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1, // عرض الفاصل الرأسي
                height: 50, // طول الفاصل الرأسي
                color: Colors.grey, // لون الفاصل
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    var permission = await isPermissionCameraGranted();
                    if (permission == false) return;
                    camera();

                    // CherryToast.success( title: Text('تم اختيار الصورة من الكاميرا بنجاح ')).show(context);
                    Navigator.pop(context);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.camera_alt, size: 30),
                      SizedBox(height: 5),
                      Text('الكاميرا'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );


    //   showDialog(
    //   context: context,
    //   builder: (BuildContext context) => AlertDialog(
    //     backgroundColor: ColorManager.primary7,
    //     actions: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CupertinoDialogAction(
    //               onPressed: () async {
    //                 var permission = await isPermissionStorageGranted();
    //                 if (permission == false) return;
    //
    //                 gallery();
    //                 // CherryToast.success( title: Text('تم اختيار الصورة من الاستوديو بنجاح ')).show(context);
    //                 Navigator.pop(context);
    //               },
    //               child: const Text('معرض الصور',
    //                   style: AppStyles.styleSemiBold18)),
    //           Divider(),
    //           CupertinoDialogAction(
    //               onPressed: () async {
    //                 var permission = await isPermissionCameraGranted();
    //                 if (permission == false) return;
    //                 camera();
    //
    //                 // CherryToast.success( title: Text('تم اختيار الصورة من الكاميرا بنجاح ')).show(context);
    //                 Navigator.pop(context);
    //               },
    //               child:
    //                   const Text('الكاميرا', style: AppStyles.styleSemiBold18)),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}










