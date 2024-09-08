// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../theme/color_manager.dart';
//
// class SpecialCard extends StatelessWidget {
//   const SpecialCard({
//     super.key,
//     this.margin,
//     required this.imageUrl,
//     this.onTap,
//     required this.subTitle,
//     required this.name,
//     this.sharePhone, this.color, this.radius, this.width,
//   });
//
//   final EdgeInsetsGeometry? margin;
//   final String imageUrl;
//   final void Function()? onTap;
//
//   final String subTitle;
//   final String name;
//   final String? sharePhone;
//   final Color? color;
//   final BorderRadius?  radius;
//   final double?  width;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color:color?? ColorManager.lightPetrol.withOpacity(.50),
//         borderRadius:radius?? const BorderRadius.only(bottomLeft: Radius.circular(30)),
//       ),
//       margin: margin,
//       alignment: Alignment.topLeft,
//
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () {},
//             child: ClipRRect(
//               clipBehavior: Clip.antiAlias,
//               // borderRadius: BorderRadius.circular(4),
//               child: CachedNetworkImage(
//                 placeholder: (context, url) => Container(),
//                 imageUrl: imageUrl,
//
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * .04,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       ScaffoldMessenger.of(context).showSnackBar(
//
//                         SnackBar(
//                           content: const Center(child: Text('انتظر قليلا')),
//                           backgroundColor:
//                           ColorManager.lightGreen.withOpacity(.47),),
//                       );
//                       // await CustomLaunchUrl.launchUrlShare(
//                       //   title: name,
//                       //   urlPreview: imageUrl,
//                       // );
//                     },
//                     // child: SvgPicture.asset(
//                     //   Assets.imagesShare,
//                     //   colorFilter: const ColorFilter.mode(
//                     //       Colors.blueAccent, BlendMode.srcIn),
//                     //   // color: Colors.blue,
//                     //
//                     //   width: 24,
//                     //   height: 24,
//                     // ),
//                   ),
//                   // const SizedBox(width: 12),
//                   // SvgPicture.asset(
//                   //   Assets.imagesHeart,
//                   //   colorFilter: const ColorFilter.mode(
//                   //       Colors.redAccent, BlendMode.srcIn),
//                   //   width: 24,
//                   //   height: 24,
//                   // ),
//                   // const SizedBox(width: 12),
//                   // GestureDetector(
//                   //   onTap: () async {
//                   //     await CustomLaunchUrl.launchUrlWhatsapp(
//                   //         numPhone: name,
//                   //         name: sharePhone ?? '',
//                   //         urlPreview: imageUrl);
//                   //   },
//                   //   child: Image.asset(
//                   //     Assets.imagesWhatsapp,
//                   //     width: 24,
//                   //     height: 24,
//                   //   ),
//                   // )
//                 ],
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         name,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleSmall!
//                             .copyWith(fontSize: 16.sp),
//                       ),
//                       Text(
//                         subTitle,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleSmall!
//                             .copyWith(fontSize: 12.sp, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }