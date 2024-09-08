import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/const/constant_manager.dart';
import 'package:sahel_net/core/utils/widgets/custom_communication/Communication_model.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_communication/custom_communication_products.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../data/models/hiraj_model.dart';
import 'custom_carousel_sclider_product_images.dart';

class DetailsProductSeller extends StatelessWidget {
  const DetailsProductSeller({
    super.key,
    required this.productsSeller,
    required this.hirajSellerData, required this.showFavorite,
  });

  final ProductData productsSeller;
  final bool showFavorite;
  final HirajSellerData? hirajSellerData;

  @override
  Widget build(BuildContext context) {

    List<String> images = getImages();
    return Scaffold(
      appBar: AppBar(
        title: Text(hirajSellerData?.nameHirajSelle ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCarouselSliderProductImages(images: images),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyBoxContainer(
                    padding: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        productsSeller.titleProduct ?? '',
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleSemiBold16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      productsSeller.newPriceProduct != ''
                          ? Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: ShapeDecoration(
                                    color: Colors.blue.withOpacity(.47),
                                    shadows:  [
                                      BoxShadow(
                                          offset: const Offset(2, 2),
                                          color: Colors.grey.withOpacity(.47))
                                    ],
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xFFF1F1F1)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('ر.س',
                                          style: AppStyles.styleSemiBold20),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        productsSeller.oldPriceProduct.toString() ,
        
                                        style: AppStyles.styleSemiBold12
                                            .copyWith(color: Colors.white,
                                            decoration: TextDecoration.lineThrough,
                                          decorationThickness: 2
        
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: ShapeDecoration(
                                    color: Colors.orangeAccent.withOpacity(.47),
                                    shadows: const [
                                      BoxShadow(
                                          offset: Offset(2, 2),
                                          color: Colors.orangeAccent)
                                    ],
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                      color: Color(0xFFF1F1F1)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12)
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('ر.س',
                                          style: AppStyles.styleSemiBold12),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        productsSeller.newPriceProduct ?? '',
                                        style: AppStyles.styleSemiBold12
                                            .copyWith(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('  : التفاصيل', style: AppStyles.styleSemiBold16),
                  Padding(
                    padding: const EdgeInsets.only(right: 65, left: 10),
                    child: Text(productsSeller.detailsProduct ?? '',
                        textDirection: TextDirection.rtl,
                        style: AppStyles.styleSemiBold12),
                  ),
                  CustomCommunicationProductsHome(
                    idSeller: productsSeller.idSellerProduct??0,
                    showFavorite:showFavorite ,
                    isFavorite: isFavoriteProduct[productsSeller.idProduct]==1,
                   idProduct: productsSeller.idProduct!,
                    communicationModel: CommunicationModel(
                      details: '------------------'
                          '\n${productsSeller.titleProduct}\n'
                          '${productsSeller.detailsProduct}\n'
                          '${hirajSellerData?.locationSeller}',
                      phone: hirajSellerData?.phoneSeller ?? '',
                      location: hirajSellerData?.locationSeller ?? '',
                      urlImage: productsSeller.imageProduct ?? '',
                      title: hirajSellerData?.nameHirajSelle ?? '',
                    ),
                  ),
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getImages() {
    List<String> images = [productsSeller.imageProduct ?? ''];
    List productImages = productsSeller.productImages ?? [];
    for (int i = 0; i < productImages.length; i++) {
      images.add(productsSeller.productImages?[i].productImage ?? '');
    }
    List<String> imageReversed = images.reversed.toList();
    return imageReversed;
  }
}
