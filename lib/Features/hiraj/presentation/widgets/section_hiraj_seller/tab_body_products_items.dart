import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../../generated/assets.dart';
import '../../../data/models/hiraj_model.dart';

class TabBodyProductsItems extends StatelessWidget {
  const TabBodyProductsItems({
    super.key,
    required this.productData, required this.sellerData,
  });

  final ProductData productData;
  final HirajSellerData sellerData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        MyBoxContainer(
          radius: 12,
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: AspectRatio(
                  aspectRatio: 1.5,
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
          top: 5,
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
                  url:sellerData.imageHirajSeller ?? AppString.emptySellerImage),
            ),
          ),
        )
      ],
    );
  }
}