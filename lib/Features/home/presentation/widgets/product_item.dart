import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../../generated/assets.dart';
import '../../data/models/home_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productItemData,
  });

  final LastProductsData productItemData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          // width: MediaQuery.sizeOf(context).width / 2.29,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shadows: const [
              BoxShadow(offset: Offset(0, 2), color: Colors.white12)
            ],
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            color: ColorManager.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: CachedImage(
                        url: '${productItemData.imageProduct}',
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Text(
                    productItemData.titleProduct ?? '',
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: AppStyles.styleRegular14.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'تفاصيل:',
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: AppStyles.styleRegular12.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      productItemData.detailsProduct ?? '',
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: AppStyles.styleSemiBold10.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        productItemData.deliveryService == 1
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
                      ],
                    ),
                  ),
                ],
              ),
              productItemData.newPriceProduct != '0'
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          productItemData.newPriceProduct != ''
                              ? RichText(
                                  text: TextSpan(
                                    text: ' ر.س  ',
                                    style: AppStyles.styleRegular14.copyWith(
                                        fontSize: getResponsiveSize(context,
                                            size: 12),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          RichText(
                            text: TextSpan(
                              text: '${productItemData.newPriceProduct}  ',
                              style: AppStyles.styleRegular14.copyWith(
                                  fontSize:
                                      getResponsiveSize(context, size: 12),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          productItemData.oldPriceProduct! > 0
                              ? RichText(
                                  text: TextSpan(
                                    text:
                                        '${productItemData.oldPriceProduct}  ',
                                    style: AppStyles.styleRegular14.copyWith(
                                        fontSize:
                                            getResponsiveSize(context, size: 8),
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                        decorationThickness: 2),
                                  ),
                                )
                              : const SizedBox.shrink(),

                          // const Expanded(child: SizedBox()),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: MyBoxContainer(
            radius: 6,
            color: ColorManager.lightPetrol.withOpacity(.20),
            padding: 5,
            child: Text(
              productItemData.seller!.hirajSellerData?[0].nameHirajSelle ?? '',
              maxLines: 1,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleSemiBold10,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: CircleAvatar(
            backgroundColor:Colors.white ,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(55)),
              child: CachedImage(
                url: productItemData
                        .seller!.hirajSellerData?[0].imageHirajSeller ??
                    '',
                height: 35,
                width: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
