// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sahel_net/core/utils/theme/color_manager.dart';
// import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
// import 'package:sahel_net/core/utils/widgets/custom_communication_launch.dart';
// import 'package:sahel_net/core/utils/widgets/custom_rating.dart';
//
// import '../../../../core/utils/theme/styles_manager.dart';
// import '../../../../core/utils/widgets/my_box_container.dart';
// import '../../data/models/hiraj_model.dart';
//
// class CustomCardTabBarBodySeller extends StatelessWidget {
//   const CustomCardTabBarBodySeller({super.key, required this.hirajData});
//
//   final HirajSellerData hirajData;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5),
//       clipBehavior: Clip.antiAlias,
//       decoration: ShapeDecoration(
//         shadows: const [BoxShadow(offset: Offset(0, 1), color: Colors.white12)],
//         shape: RoundedRectangleBorder(
//             side: const BorderSide(color: Colors.black12),
//             borderRadius: BorderRadius.circular(12)),
//         color: ColorManager.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   MyBoxContainer(
//                     margin: 2,
//                     radius: 20,
//                     child: CachedImage(
//                       url: hirajData.imageHirajSeller ?? '',
//                       // height: double.infinity,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: Text(
//                 hirajData.nameHirajSelle ?? '',
//                 textAlign: TextAlign.right,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 textDirection: TextDirection.rtl,
//                 style: AppStyles.styleRegular14
//                     .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CustomRating(
//                         rating: hirajData.ratingSeller?.toDouble() ?? 1),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CustomCommunication2(
//                       size: 15,
//                       communicationModel: CommunicationModel(
//                           phone: hirajData.phoneSeller ?? '',
//                           location: hirajData.locationSeller ?? '',
//                           urlImage: hirajData.imageHirajSeller ?? '',
//                           title: hirajData.nameHirajSelle ?? ''),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           hirajData.addressSeller ?? '',
//                           style: AppStyles.styleSemiBold10,
//                           textDirection: TextDirection.rtl,
//                         ),
//                         const Text(
//                           'العنوان : ',
//                           style: AppStyles.styleSemiBold12,
//                           textDirection: TextDirection.rtl,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           hirajData.products?.productData?.length.toString() ??
//                               '0',
//                           style: AppStyles.styleSemiBold10,
//                           textDirection: TextDirection.rtl,
//                         ),
//                         const Text(
//                           'عدد المنتجات : ',
//                           style: AppStyles.styleSemiBold12,
//                           textDirection: TextDirection.rtl,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
