import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/data/models/hiraj_model.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/widgets/custom_rating.dart';
import '../../../../generated/assets.dart';

class ProductsItemsRating extends StatelessWidget {
  const ProductsItemsRating({
    super.key,
    required this.productData,
  });

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
           // color: ColorManager.primaryLight.withAlpha(100),
          elevation: 3,
          child: Column(
            children: [
              Container(
                 height: 25,
                color: ColorManager.primary7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: CustomRating(
                        unratedColor: Colors.black38,
                        rating:
                            double.parse(productData.ratingProduct ?? '1.0'),
                        ignoreGestures: true,
                        itemSize: getResponsiveSize(context, size: 16),
                      ),
                    ),
                    Text(
                      productData.ratingProduct?.substring(0, 3) ?? '',
                      style: AppStyles.styleBold16.copyWith(color: Colors.amber),
                    ),
                    const Spacer(),
                    Text('حاصل على تقييم',
                        style: AppStyles.styleRegular12
                            .copyWith(color: Colors.white)),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: AspectRatio(
                  aspectRatio: 3,
                  child: CachedImage(
                    url: productData.imageProduct ?? '',
                  ),
                ),
              ),
              AutoSizeText(
                productData.titleProduct ?? '',
                textDirection: TextDirection.rtl,
                maxLines: 1,
                style: AppStyles.styleSemiBold10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: AutoSizeText(
                  productData.detailsProduct ?? '',
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  style: AppStyles.styleRegular12.copyWith(fontSize: 8),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: getResponsiveSize(context, size: 10),
                  ),
                  productData.deliveryService == 1
                      ? Image.asset(
                          Assets.imagesDelivery,
                          width: 20,
                          height: 20,
                        )
                      : Image.asset(
                          Assets.imagesNoDelivery,
                          width: 20,
                          height: 20,
                        ),
                  const Expanded(flex: 2, child: SizedBox()),
                  Column(
                    children: [
                      AutoSizeText(
                        productData.startProduct?.substring(0, 11) ??
                            AppString.emptyStartProductDay,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        style: AppStyles.styleMedium12.copyWith(fontSize: 8),
                      ),
                      AutoSizeText(
                        productData.startProduct?.substring(11, 16) ??
                            AppString.emptyDetailsProductTime,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        style: AppStyles.styleMedium12.copyWith(fontSize: 8),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Card(
                color: ColorManager.primary7,

                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
                  child: AutoSizeText(
                    productData.seller!.hirajSellerData?[0].nameHirajSelle ??
                        AppString.emptySellerImage,
                    style: AppStyles.styleRegular12.copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          height: 25,
          width: 25,
          top: 30,
          left: 6,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: const ShapeDecoration(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                color: Colors.black12,
              ),
              padding: const EdgeInsets.all(2),
              clipBehavior: Clip.antiAlias,
              child: CachedImage(
                  sizeIndicator: 3,
                  url: productData.hirajname?.hirajData?[0].imageHiraj ??
                      AppString.emptySellerImage),
            ),
          ),
        ),
        // Positioned(
        //   width: 70,
        //   bottom: 70,
        //   right: 6,
        //   child: Container(
        //     clipBehavior: Clip.antiAlias,
        //     decoration: const ShapeDecoration(
        //       shape: ContinuousRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(50))),
        //       color: Colors.white,
        //     ),
        //     padding: const EdgeInsets.all(3),
        //     child: Container(
        //       decoration: ShapeDecoration(
        //         shape: ContinuousRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(50))),
        //         color: ColorManager.primary7,
        //       ),
        //       padding: const EdgeInsets.all(2),
        //       clipBehavior: Clip.antiAlias,
        //       child: Padding(
        //         padding: const EdgeInsets.all(4.0),
        //         child: AutoSizeText(
        //           productData.seller!.hirajSellerData?[0].nameHirajSelle ??
        //               AppString.emptySellerImage,
        //           style: AppStyles.styleRegular12.copyWith(color: Colors.white),
        //           maxLines: 1,
        //           overflow: TextOverflow.ellipsis,
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
