import 'package:flutter/material.dart';

import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../data/models/tapbar model.dart';

// class TapBarItem extends StatelessWidget {
//   const TapBarItem({
//     super.key,  required this.tapBarModel,
//   });
//   final TapBarModel tapBarModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: getResponsiveSize(context, size: 200),
//         margin: const EdgeInsets.all(8),
//         decoration: ShapeDecoration(
//           shadows: const [BoxShadow(color: ColorManager.grey)],
//           color: ColorManager.white,
//           shape: RoundedRectangleBorder(
//              side: const BorderSide(width: 1, color:  Colors.cyan),
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: getResponsiveSize(context, size: 200),
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Colors.cyan,
//                 borderRadius: BorderRadius.only(
//                   topRight:
//                   Radius.circular(getResponsiveSize(context, size: 22)),
//                   bottomLeft: const Radius.circular(7),
//                   topLeft: const Radius.circular(7),
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   tapBarModel.title,
//                   style: AppStyles.styleMedium16.copyWith(
//                       fontSize: getResponsiveSize(context, size: 12),
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 18,
//             ),
//             //  CachedImage(url: 'image'),
//
//             const Icon(
//               Icons.add_business,
//               color: Color(0xFF064061),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//           ],
//         ));
//   }
// }