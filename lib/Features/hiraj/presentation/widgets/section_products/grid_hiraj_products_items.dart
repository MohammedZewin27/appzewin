import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../data/models/hiraj_model.dart';

class ProductsItems extends StatelessWidget {
  const ProductsItems({
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
          elevation: 3,
clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                height: 25,
                color: ColorManager.primary7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10, left: 10),
                    //   child: CustomRating(
                    //     unratedColor: Colors.black38,
                    //     rating:
                    //     double.parse(productData.ratingProduct ?? '1.0'),
                    //     ignoreGestures: true,
                    //     itemSize: getResponsiveSize(context, size: 16),
                    //   ),
                    // ),
                    // Text(
                    //   productData.ratingProduct?.substring(0, 3) ?? '',
                    //   style: AppStyles.styleBold16.copyWith(color: Colors.amber),
                    // ),
                    // const Spacer(),
                    Text(productData.seller!.hirajSellerData?[0].nameHirajSelle??'',
                        style: AppStyles.styleRegular12
                            .copyWith(color: Colors.white,fontWeight: FontWeight.w800)),
                    // const SizedBox(
                    //   width: 5,
                    // ),
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
                  aspectRatio: 2,
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
              AutoSizeText(
                productData.detailsProduct ?? '',
                textDirection: TextDirection.rtl,
                maxLines: 1,
                style: AppStyles.styleMedium12.copyWith(fontSize: 8),
              ),
              Row(
                children: [
                  SizedBox(width: getResponsiveSize(context, size: 10),),
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
                        productData.startProduct?.substring(0, 11) ?? AppString.emptyStartProductDay,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        style: AppStyles.styleMedium12.copyWith(fontSize: 8),
                      ),
                      AutoSizeText(
                        productData.startProduct?.substring(11, 16) ?? AppString.emptyDetailsProductTime,
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
            ],
          ),
        ),
        Positioned(
          height: 30,
          width: 30,
          top: 35,
          left: 5,
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
                  url: productData.hirajname?.hirajData?[0].imageHiraj ?? AppString.emptySellerImage),
            ),
          ),
        )
      ],
    );
  }
}
