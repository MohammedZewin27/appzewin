// import 'package:cherry_toast/cherry_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/utils/cash_data.dart';
// import '../../../../../core/utils/theme/styles_manager.dart';
// import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
// import '../../../../../generated/assets.dart';
// import '../../../../setting/presentation/widgets/setting_control/circle_image_stack.dart';
// import '../../../../splash/splash_view.dart';
// import '../cubit/setting_seller_cubit.dart';
//
// class DeleteAccountSellerUser extends StatelessWidget {
//   const DeleteAccountSellerUser({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SettingSellerCubit, SettingSellerState>(
//       listener: (context, state) {
//         if (state is ChangeStatusSellerLoading) {
//           const CustomProgressIndicator();
//         }
//         if (state is ChangeStatusSellerSuccess) {
//           StringCache.activeSeller = false;
//           CacheData.setData(key: StringCache.sellerActive, value: false);
//           CacheData.clearSellerItems();
//
//           Navigator.pop(context);
//           Navigator.pop(context);
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const SplashView(),
//               ));
//         }
//       },
//       builder: (context, state) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   GestureDetector(
//                     onTap: () => FocusScope.of(context).unfocus(),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Card(
//                         elevation: 5,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               child: Text(
//                                 'حذف الحساب ',
//                                 style: AppStyles.styleSemiBold18
//                                     .copyWith(color: Colors.red),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 25,
//                               child: Text(
//                                 'اضغط ضغطه مطولة على زر حذف',
//                                 style: AppStyles.styleSemiBold16
//                                     .copyWith(color: Colors.red),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             Container(
//                               margin:
//                               const EdgeInsets.symmetric(horizontal: 10),
//                               alignment: Alignment.center,
//                               child: Form(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: [
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Expanded(
//                                           child: ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Colors.green,
//                                               ),
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text(
//                                                 'الغاء',
//                                                 style: AppStyles.styleRegular15
//                                                     .copyWith(
//                                                     color: Colors.white),
//                                               )),
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Expanded(
//                                           child: ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                   backgroundColor: Colors.red),
//                                               onLongPress: () {
//                                                 SettingSellerCubit.get(
//                                                     context)
//                                                     .changeStatusSeller();
//                                               },
//                                               onPressed: () {
//
//                                                 CherryToast.warning(
//                                                   title: Text('احترس سوف يتم حذف الحساب, لمتابعة الحذف اضغط ضغطه مطوله '),
//
//                                                 ).show(context);
//                                               },
//                                               child: Text(
//                                                 'حذف',
//                                                 style: AppStyles.styleRegular15
//                                                     .copyWith(
//                                                     color: Colors.white),
//                                               )),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Positioned(
//                     top: -10,
//                     left: 10,
//                     child: CircleImageToStack(
//                       imageAsset: Assets.imagesLogout,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 60,
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }