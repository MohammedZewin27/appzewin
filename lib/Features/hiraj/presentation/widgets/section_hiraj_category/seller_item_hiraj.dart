import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../data/models/hiraj_model.dart';

class SellerItemHiraj extends StatelessWidget {
  const SellerItemHiraj({
    super.key,
    required this.sellerData,
  });

  final HirajSellerData sellerData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(offset: Offset(2, 2), color: Colors.white),
                ]),
            child: CachedImage(
              url: sellerData.imageHirajSeller ?? '',
              height: getResponsiveSize(
                context,
                size: 120,
              ),

            ),
          ),
          Text(
            sellerData.nameHirajSelle ?? '',
            style: AppStyles.styleSemiBold16
                .copyWith( fontWeight: FontWeight.w900),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text(
                  sellerData.products?.productData?.length.toString() ?? '0',
                  style: AppStyles.styleSemiBold12
                      .copyWith( fontWeight: FontWeight.w900),
                ),
                Text(
                  ' : عدد المنشورات',
                  style: AppStyles.styleSemiBold12
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomRating(
            rating: sellerData.ratingSeller?.toDouble() ?? 1.0,
            itemSize: 15,
          ),


        ],
      ),
    );
  }
}
