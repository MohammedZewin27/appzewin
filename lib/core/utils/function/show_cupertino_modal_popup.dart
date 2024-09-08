import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
// import 'package:nb_utils/nb_utils.dart';

// Future<dynamic> showCupertinoModalPopupEditOrRemove(BuildContext context,
//     {required Function remove,
//     required void Function() cancel,
//     required String name}) {
//   return showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => Theme(
//             data: ThemeData.light(),
//             child: CupertinoActionSheet(
//               title: Text(
//                 name,
//                 textDirection: TextDirection.rtl,
//                 style: boldTextStyle(size: 18),
//               ),
//               // message: const Text('انتبه جيدا قبل الحذف '),
//               actions: [
//                 CupertinoActionSheetAction(
//                     onPressed: () {
//                       remove();
//                       // toasty(context, 'تم الحذف بنجاح');
//                     // //  finish(context);
//                       Navigator.of(context);
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Icon(Icons.delete,color: Colors.red,),
//                         Expanded(child: Text('تسجيل خروج', style:  style:AppStyles.styleSemiBold18,)),
//                       ],
//                     )
//                 ),
//                 CupertinoActionSheetAction(
//                     onPressed: cancel,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Icon(Icons.edit,color: Colors.grey,),
//                         Expanded(child: Text('الغاء', style:  style:AppStyles.styleSemiBold18,)),
//                       ],
//                     )
//                 ),
//               ],
//               cancelButton: CupertinoActionSheetAction(
//                   onPressed: () {
//                    // // finish(context);
//                     Navigator.of(context);
//                   },
//                   child: Text(
//                     'Cancel',
//                     style: primaryTextStyle(color: redColor, size: 18),
//                   )),
//             ),
//           ));
// }

// Future<dynamic> showCupertinoModalPopupAddImage(BuildContext context,
//     {required Function gallery, required Function camera}) {
//   return showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => Theme(
//             data: ThemeData.light(),
//             child: CupertinoActionSheet(
//               actions: [
//                 CupertinoActionSheetAction(
//                     onPressed: () {
//                       gallery();
//                       finish(context, 'تم اختيار الصورة من الاستوديو بنجاح ');
//                     },
//                     child:
//                         Text('الاستوديو', style:  style:AppStyles.styleSemiBold18,)),
//                 CupertinoActionSheetAction(
//                     onPressed: () {
//                       camera();
//
//                       finish(context, 'تم اختيار الصورة من الكاميرا بنجاح ');
//                     },
//                     child: Text('الكاميرا', style:  style:AppStyles.styleSemiBold18,)),
//               ],
//               cancelButton: CupertinoActionSheetAction(
//                 onPressed: () {
//                   // finish(context);
//                 },
//                 child: Text(
//                   'Cancel',
//                   style: primaryTextStyle(color: redColor, size: 18),
//                 ),
//               ),
//             ),
//           ));
// }


// Future<dynamic> showCupertinoModalPopupRemove(BuildContext context,
//     {required Function remove,
//       required String title}) {
//   return showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => Theme(
//         data: ThemeData.light(),
//         child: CupertinoActionSheet(
//           title: Text(
//             title,
//             textDirection: TextDirection.rtl,
//             style: boldTextStyle(size: 18),
//           ),
//           // message: const Text('انتبه جيدا قبل الحذف '),
//           actions: [
//             CupertinoActionSheetAction(
//                 onPressed: () {
//                   remove();
//                   toasty(context, 'تم الحذف بنجاح');
//                   // finish(context);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Icon(Icons.delete,color: Colors.red,),
//                     Expanded(child: Text('حذف', style:  style:AppStyles.styleSemiBold18,)),
//                   ],
//                 )
//             ),
//
//           ],
//           cancelButton: CupertinoActionSheetAction(
//               onPressed: () {
//                 // finish(context);
//               },
//               child: Text(
//                 'Cancel',
//                 style: primaryTextStyle(color: redColor, size: 18),
//               )),
//         ),
//       ));
// }



//
// Future<dynamic> showCupertinoModalPopupNav(BuildContext context,
//     {
//       required void Function() pageOne,
//       required void Function() pageTow,
//       // required void Function() pageThree,
//       required String title,
//       required String pageNameOne,
//       required String pageNameTow,
//       // required String pageNameThree,
//     }) {
//   return showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => Theme(
//         data: ThemeData.light(),
//         child: CupertinoActionSheet(
//           title: Text(
//             title,
//             textDirection: TextDirection.rtl,
//             style: boldTextStyle(size: 18),
//           ),
//
//           actions: [
//             CupertinoActionSheetAction(
//                 onPressed: pageOne,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(width: MediaQuery.of(context).size.width/4,),
//                     const Icon(FontAwesomeIcons.phone,color: Colors.blue, ),
//                     const Spacer(),
//                     Text(pageNameOne, style:  style:AppStyles.styleSemiBold18,),
//                     const Spacer(),
//                   ],
//                 )
//             ),
//             CupertinoActionSheetAction(
//                 onPressed: pageTow,
//                 child: Row(
//                   children: [
//                     SizedBox(width: MediaQuery.of(context).size.width/4,),
//                     const Icon(FontAwesomeIcons.whatsapp,color: Colors.green, ),
//                     const Spacer(),
//                     Text(pageNameTow, style:  style:AppStyles.styleSemiBold18,),
//                     const Spacer(),
//                   ],
//                 )
//             ),
//             // CupertinoActionSheetAction(
//             //     onPressed: pageThree,
//             //     child: Row(
//             //
//             //       children: [
//             //         SizedBox(width: MediaQuery.of(context).size.width/4,),
//             //         const Icon(FontAwesomeIcons.comment,color: Colors.redAccent ),
//             //         const Spacer(),
//             //         Text(pageNameThree, style:  style:AppStyles.styleSemiBold18,),
//             //         const Spacer(),
//             //       ],
//             //     )
//             // ),
//
//           ],
//           cancelButton: CupertinoActionSheetAction(
//               onPressed: () {
//                 // finish(context);
//               },
//               child: Text(
//                 'الغاء',
//                 style: primaryTextStyle(color: redColor, size: 18),
//               )),
//         ),
//       ));
// }
Future<dynamic> showCupertinoModalPopupProduct(BuildContext context,
    {
      required void Function() pageOne,
      required void Function() pageTow,
      required void Function() pageThree,
      required String title,
      required String pageNameOne,
      required String pageNameTow,
      required String pageNameThree,
    }) {
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData.light(),
        child: CupertinoActionSheet(
          title: Text(
            title,
            textDirection: TextDirection.rtl,
            style:AppStyles.styleSemiBold18,
          ),

          actions: [
            CupertinoActionSheetAction(
                onPressed: pageOne,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/4,),
                    const Icon(FontAwesomeIcons.phone,color: Colors.blue, ),
                    const Spacer(),
                    Text(pageNameOne,  style:AppStyles.styleSemiBold18,),
                    const Spacer(),
                  ],
                )
            ),
            CupertinoActionSheetAction(
                onPressed: pageTow,
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/4,),
                    const Icon(FontAwesomeIcons.whatsapp,color: Colors.green, ),
                    const Spacer(),
                    Text(pageNameTow, style:  AppStyles.styleSemiBold18,),
                    const Spacer(),
                  ],
                )
            ),
            CupertinoActionSheetAction(
                onPressed: pageThree,
                child: Row(

                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/4,),
                    const Icon(FontAwesomeIcons.comment,color: Colors.redAccent ),
                    const Spacer(),
                    Text(pageNameThree, style:  AppStyles.styleSemiBold18,),
                    const Spacer(),
                  ],
                )
            ),

          ],
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                // finish(context);
              },
              child: Text(
                'الغاء',
                style:  AppStyles.styleSemiBold18.copyWith(color: Colors.red,),
              )),
        ),
      ));
}

// Future<dynamic> showCupertinoModalPopupNavType(BuildContext context,
//     {
//       required void Function() pageOne,
//       required void Function() pageTow,
//       required void Function() pageThree,
//       required String title,
//       required String pageNameOne,
//       required String pageNameTow,
//       required String pageNameThree,
//
//     }) {
//   return showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => Theme(
//         data: ThemeData.light(),
//         child: CupertinoActionSheet(
//           title: Text(
//             title,
//             textDirection: TextDirection.rtl,
//             style: boldTextStyle(size: 18),
//           ),
//
//           actions: [
//             CupertinoActionSheetAction(
//                 onPressed: pageOne,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(width: MediaQuery.of(context).size.width/4,),
//                     const Icon(FontAwesomeIcons.shop ),
//                     const Spacer(),
//                     Text(pageNameOne, style:  style:AppStyles.styleSemiBold18,),
//                     const Spacer(),
//                   ],
//                 )
//             ),
//             CupertinoActionSheetAction(
//                 onPressed: pageTow,
//                 child: Row(
//
//                   children: [
//                     SizedBox(width: MediaQuery.of(context).size.width/4,),
//                     const Icon(FontAwesomeIcons.basketShopping ),
//                     const Spacer(),
//                     Text(pageNameTow, style: AppStyles.styleSemiBold18,),
//                     const Spacer(),
//                   ],
//                 )
//             ),
//             CupertinoActionSheetAction(
//                 onPressed: pageThree,
//                 child: Row(
//
//                   children: [
//                     SizedBox(width: MediaQuery.of(context).size.width/4,),
//                     const Icon(FontAwesomeIcons.textHeight ),
//                     const Spacer(),
//                     Text(pageNameThree, style: AppStyles.styleSemiBold18,),
//                     const Spacer(),
//                   ],
//                 )
//             ),
//           ],
//           cancelButton: CupertinoActionSheetAction(
//               onPressed: () {
//                 // finish(context);
//               },
//               child: Text(
//                 'Cancel',
//                 style: primaryTextStyle(color: redColor, size: 18),
//               )),
//         ),
//       ));
// }