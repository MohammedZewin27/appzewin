import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../core/PopupMenu.dart';
import '../../../seller_post/data/models/post_seller_model.dart';
import '../../../seller_post/presentation/cubit/post_seller_cubit.dart';
import '../../../seller_post/presentation/widgets/product_images.dart';
import '../../../seller_post/presentation/widgets/update_product/update_productSeller.dart';

class CustomCardAnalysis extends StatelessWidget {
  const CustomCardAnalysis(
      {super.key, required this.productsSeller, required this.onTap});

  final ProductsSeller productsSeller;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var cubit = PostSellerCubit.get(context);
    return Card(
      color: ColorManager.white.withOpacity(.47),
      elevation: 0,
      child: InkWell(
        onTap:onTap ,
        child: Container(
          decoration: BoxDecoration(
              color: ColorManager.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedImage(
                      url: productsSeller.imageProduct ?? '',
                      // height:MediaQuery.sizeOf(context),
                      width: 100,
                      sizeIndicator: 3,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 35,),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: ColorManager.primary7.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    productsSeller.ratingProduct
                                        .toString()
                                        .substring(0, 3),
                                    style: AppStyles.styleBold14
                                        .copyWith(fontSize: 12, color: ColorManager.backBlack),
                                  ),
                                ),
                                CustomPopupMenu(
                                  onSelected: (value) {
                                    if (value == 'Edit') {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              UpdateProductSeller(
                                                dataPost: productsSeller,
                                              ),
                                        ),
                                      );
                                    }

                                    if (value == 'Delete') {
                                      customShowModalBottomElevatedButton(context,
                                          titleShowBottom: 'تاكيد الحذف',
                                          titleButtonOne: 'حذف',
                                          titleButtonTwo: 'الغاء',
                                          onPressedButtonOne: () {
                                            List<ProductImagesData> images =
                                                productsSeller.productImages!
                                                    .productImagesData ??
                                                    [];
                                            if (images.isEmpty) {
                                              cubit
                                                  .deleteProductSeller(
                                                  images: images,
                                                  productId: productsSeller
                                                      .idProduct!,
                                                  imageName: productsSeller
                                                      .imageProduct ??
                                                      '')
                                                  .whenComplete(() {
                                                PostSellerCubit.get(context)
                                                    .fetchPostOfSeller(
                                                    sellerId:
                                                    CacheData.getData(
                                                        key: StringCache
                                                            .idSeller));
                                              });
                                            } else if (images.isNotEmpty) {
                                              cubit.deleteProductSeller(
                                                  images: images,
                                                  productId:
                                                  productsSeller.idProduct!,
                                                  imageName: productsSeller
                                                      .imageProduct ??
                                                      '');
                                            }
                                            Navigator.pop(context);
                                          },
                                          onPressedButtonTwo: () =>
                                              Navigator.pop(context));
                                    }
                                  },
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            productsSeller.titleProduct ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: AppStyles.styleSemiBold18.copyWith(
                              color: ColorManager.backBlack
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            productsSeller.detailsProduct ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color:ColorManager.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,

                            )
                                ,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 3),
                            decoration: BoxDecoration(
                                color: ColorManager.primary7.withOpacity(.2),
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              productsSeller.startProduct
                                  .toString()
                                  .substring(0, 16),
                              style: AppStyles.styleBold14.copyWith(
                                  fontSize: 12, color: ColorManager.backBlack),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
              ProductImagesView(productImages: productsSeller.productImages),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// CustomPopupMenu(
//   onSelected: (value) {
//     if (value == 'Edit') {
//       Navigator.push(
//         context,
//         CupertinoPageRoute(
//           builder: (context) =>
//               UpdateProductSeller(
//                 dataPost: productsSeller,
//               ),
//         ),
//       );
//     }
//
//     if (value == 'Delete') {
//       customShowModalBottomElevatedButton(
//           context, titleShowBottom: 'تاكيد الحذف',
//           titleButtonOne: 'حذف',
//           titleButtonTwo: 'الغاء',
//           onPressedButtonOne: (){
//             List<ProductImagesData> images = productsSeller.productImages!.productImagesData ?? [];
//             if (images.isEmpty) {
//               cubit
//                   .deleteProductSeller(
//                   images: images,
//                   productId: productsSeller.idProduct!,
//                   imageName: productsSeller.imageProduct ?? '')
//                   .whenComplete(() {
//                 PostSellerCubit.get(context).fetchPostOfSeller(
//                     sellerId: CacheData.getData(key: StringCache.idSeller));
//               });
//             } else if (images.isNotEmpty) {
//
//               cubit.deleteProductSeller(
//                   images: images,
//                   productId: productsSeller.idProduct!,
//                   imageName: productsSeller.imageProduct ?? '');
//
//             }
//             Navigator.pop(context);
//           },
//           onPressedButtonTwo: () => Navigator.pop(context));
//
//     }
//   },
// ),