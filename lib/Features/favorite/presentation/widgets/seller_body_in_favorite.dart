import 'package:flutter/material.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../hiraj/data/models/hiraj_model.dart';
import '../../../hiraj/presentation/widgets/post_seller_products/post_seller_body.dart';
import '../../data/models/favorite_model.dart';

class SellerBodyInFavorite extends StatelessWidget {
  const SellerBodyInFavorite({super.key, required this.seller});
  final Sellers seller;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.33,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: ColorManager.grey.withOpacity(1),
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  // width: MediaQuery.sizeOf(context).width/2,
                  decoration: BoxDecoration(
                    color: ColorManager.grey.withOpacity(.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  height: 60,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              seller.nameHirajSelle ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: AppStyles.styleSemiBold20.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // const CustomIconFavorite(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: CachedImage(url: seller.imageHirajSeller ?? ''),
                  ),
                ),
              ),
            ),
          ];
        }, body: PostSellerBody(sellerData: HirajSellerData(
        parentId:seller.parentId ,
        startSeller: seller.startSeller,
        sellerStatus:seller.sellerStatus ,
        ratingSeller:seller.ratingSeller ,

        phoneSeller:seller.phoneSeller,
        passwordHirajSelle:seller.passwordHirajSelle,
        nameHirajSelle:seller.nameHirajSelle,
        locationSeller:seller.locationSeller,
        imageHirajSeller:seller.imageHirajSeller,
        idHirajSeller:seller.idHirajSeller,
        hirajId:seller.hirajId,
        endSeller:seller.endSeller,
        codeHirajSelle:seller.codeHirajSelle,
        addressSeller: seller.addressSeller
      ), data:seller.productsF??[] ),
      ),
    );
  }
}