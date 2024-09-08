import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sahel_net/core/utils/function/call_me.dart';
import 'package:sahel_net/core/utils/widgets/rating_product.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';

import '../../../../../core/utils/widgets/launch_url.dart';
import '../../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../data/models/hiraj_model.dart';
import '../deatils_product/details_product_seller.dart';
import 'custom_popup_menu_button.dart';
import 'images_product.dart';

class ItemsProducts extends StatelessWidget {
  const ItemsProducts({
    super.key,
    // required this.productImagesData,

    required this.productsSeller,
    required this.hirajSellerData,
  });

  final ProductData productsSeller;
  final HirajSellerData hirajSellerData;

  // final List<ProductImages> productImagesData;

  @override
  Widget build(BuildContext context) {
    var productImages = productsSeller.productImages ?? [];
    double rating;
    if (productsSeller.ratingProduct != '') {
      rating = double.parse(productsSeller.ratingProduct!);
    } else {
      rating = 1.0;
    }

    String? extractRating(String? ratingProduct) {
      if (ratingProduct == null) {
        return null;
      }

      int? indexOfDot = ratingProduct.indexOf('.');

      if (indexOfDot == -1) {
        return ratingProduct;
      }

      return ratingProduct.substring(0, indexOfDot + 2);
    }

    String? ratingPro = extractRating(productsSeller.ratingProduct);

    return StickyHeader(
      header: Container(
        height: getResponsiveSize(context, size: 36.0),
        color: ColorManager.blue.withOpacity(.55),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                productsSeller.titleProduct ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: AppStyles.styleSemiBold20.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              productsSeller.startProduct?.substring(0, 11) ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      content: Column(
        children: [
          GestureDetector(
            onTap: () {
              AppAnalysisCubit.get(context).entryProduct(
                  idSeller: productsSeller.idSellerProduct ?? 0,
                  idProduct: productsSeller.idProduct ?? 0,

              );

              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => DetailsProductSeller(
                    showFavorite: true,
                    hirajSellerData: hirajSellerData,
                    productsSeller: productsSeller,
                  ),
                ),
              );
            },
            child: CachedImage(
              url: productsSeller.imageProduct ?? '',
              width: double.infinity,
              height: getResponsiveSize(context, size: 200),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              productsSeller.detailsProduct ?? '',
              textDirection: TextDirection.rtl,
              style: AppStyles.styleBold14
                  .copyWith(color: ColorManager.ofWhite2.withOpacity(.8)),
            ),
          ),
          productImages.isNotEmpty
              ? ImagesProduct(
                  productImagesData: productsSeller.productImages ?? [],
                  titleProduct: productsSeller.titleProduct ?? '',
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  CacheData.getData(key: StringCache.userId) != 0
                      ? Navigator.push(
                          context,
                          ModalBottomSheetRoute(
                              builder: (context) {
                                return RatingProductAdd(
                                  userid: CacheData.getData(
                                      key: StringCache.userId),
                                  productId: productsSeller.idProduct ?? 137,
                                  name: productsSeller.titleProduct ?? '',
                                );
                              },
                              isScrollControlled: true))
                      : registerNow(context);
                },
                child: Row(
                  children: [
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(' التقييم $ratingPro'),
                  ],
                ),
              ),
              CustomPopupMenuButton(
                onSelected: (value) {
                  if (value == 'call') {
                    CustomLaunchUrl.launchUrlCall(
                        numPhone: hirajSellerData.phoneSeller);
                  } else if (value == 'share') {
                    CustomLaunchUrl.launchUrlShare(
                        title: productsSeller.titleProduct,
                        urlPreview: productsSeller.imageProduct,
                        details: productsSeller.detailsProduct,
                        phone: hirajSellerData.phoneSeller);
                  } else if (value == 'chat') {
                    CustomLaunchUrl.launchUrlWhatsapp(
                        numPhone: 'numPhone',
                        name: 'name',
                        urlPreview: 'urlPreview');
                  }
                },
                productsSeller: productsSeller,
              )
            ],
          ),
        ],
      ),
    );
  }
}
