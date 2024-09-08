// import 'package:flutter/material.dart';
// import 'package:sahel_net/Features/auth/presentation/views/widget/auth_text_form.dart';
//
// import '../../../../../core/utils/theme/styles_manager.dart';
// import '../../../../../generated/assets.dart';
// import '../../../../setting/presentation/widgets/setting_control/circle_image_stack.dart';
//
// class ChangePasswordShop extends StatelessWidget {
//   const ChangePasswordShop({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               GestureDetector(
//                 onTap: () => FocusScope.of(context).unfocus(),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Card(
//                     elevation: 5,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                           child: Text(
//                             'حذف الحساب نهائيا',
//                             style: AppStyles.styleSemiBold18
//                                 .copyWith(color: Colors.red),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 10),
//                           alignment: Alignment.center,
//                           child: Form(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10,),
//                               child: Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.center,
//                                 children: [
//                                   const SizedBox(height: 20,),
//                                   CustomTextForm(hintText: 'hintText',
//
//                                   controller: TextEditingController(),
//                                     validator: (value) {
//                                     if(value!.isEmpty||value.length<6){
//                                       return 'كلمة المرور';
//                                     }
//                                       return null;
//                                     },
//                                   ),
//                                   const SizedBox(height: 50,)
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 top: -10,
//                 left: 10,
//                 child: CircleImageToStack(
//                   imageAsset: Assets.imagesError,
//                 ),
//               ),
//
//             ],
//           ),
//           SizedBox(height: 50,)
//         ],
//       ),
//     );
//   }
// }
