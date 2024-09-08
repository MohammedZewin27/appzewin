import 'package:flutter/material.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../data/models/home_model.dart';
import 'custom_add_rating_shop.dart';

class CustomInformationShop extends StatelessWidget {
  const CustomInformationShop({
    super.key,
    required this.shopsData,
  });

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    double rating;
    if (shopsData.ratingShop != '') {
      rating = double.parse(shopsData.ratingShop!);
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

    String? ratingPro = extractRating(shopsData.ratingShop);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: getResponsiveSize(context, size: 5),
              width: getResponsiveSize(context, size: 60),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          GestureDetector(
            onTap: () {
              CacheData.getData(key: StringCache.userId) != 0
                  ? Navigator.push(
                      context,
                      ModalBottomSheetRoute(
                          builder: (context) {
                            return CustomAddRatingShop(
                              shopsData: shopsData,
                            );
                          },
                          isScrollControlled: true))
                  : registerNow(context);
            },
            child: Row(
              children: [
                CustomRating(
                  rating: rating,
                  ignoreGestures: true,
                  itemSize: getResponsiveSize(context, size: 20),
                ),
                Text(
                  '( ',
                  style: AppStyles.styleRegular14.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w900),
                ),
                Text(
                  '$ratingPro',
                  style: AppStyles.styleRegular14.copyWith(
                      color: Colors.blue, fontWeight: FontWeight.w900),
                ),
                Text(
                  '/ 5 )',
                  style: AppStyles.styleRegular14.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Text(
            'عنوان  :  ',
            style: AppStyles.styleRegular14.copyWith(color: Colors.blue[800]),
            textDirection: TextDirection.rtl,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              shopsData.shopAddress ?? '',
              style: AppStyles.styleRegular14,
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(
            indent: MediaQuery.sizeOf(context).width / 4,
            // endIndent: 100,
          ),
          Text(
            'جــــوال  : ',
            style: AppStyles.styleRegular14.copyWith(color: Colors.blue[800]),
            textDirection: TextDirection.rtl,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              shopsData.shopPhone ?? '',
              style: AppStyles.styleRegular14,
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(
            indent: MediaQuery.sizeOf(context).width / 4,
            // endIndent: 100,
          ),
          Text(
            'تفاصيل  : ',
            style: AppStyles.styleRegular14.copyWith(color: Colors.blue[800]),
            textDirection: TextDirection.rtl,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              shopsData.shopInformation ?? '',
              style: AppStyles.styleRegular14,
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(
            indent: MediaQuery.sizeOf(context).width / 4,
            // endIndent: 100,
          ),
        ],
      ),
    );
  }
}
