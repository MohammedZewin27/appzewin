import 'package:flutter/material.dart';
import 'package:sahel_net/Features/favorite/data/models/favorite_model.dart';

import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/add_rating.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';

class CustomInformation extends StatelessWidget {
  const CustomInformation({super.key, required this.shops});

  final Shops shops;

  @override
  Widget build(BuildContext context) {
    double rating;
    if (shops.ratingShop != '') {
      rating = double.parse(shops.ratingShop!);
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

    String? ratingPro = extractRating(shops.ratingShop);
    return Column(
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
            Navigator.push(
                context,
                ModalBottomSheetRoute(
                    builder: (context) {
                      return AddRating(name:shops.shopName??'' ,id: shops.shopId??1,);
                    },
                    isScrollControlled: true));
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
                style: AppStyles.styleRegular14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              ),
              Text(
                '$ratingPro',
                style: AppStyles.styleRegular14
                    .copyWith(color: Colors.blue, fontWeight: FontWeight.w900),
              ),
              Text(
                '/ 5 )',
                style: AppStyles.styleRegular14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
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
            shops.shopAddress ?? '',
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
            shops.shopPhone ?? '',
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
            shops.shopInformation ?? '',
            style: AppStyles.styleRegular14,
            textDirection: TextDirection.rtl,
          ),
        ),
        Divider(
          indent: MediaQuery.sizeOf(context).width / 4,
          // endIndent: 100,
        ),
        shops.shopImages!.isNotEmpty
            ? Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Text(
              ' صور',
              style: AppStyles.styleSemiBold16
                  .copyWith(color: Colors.blue[800]),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: getResponsiveSize(context, size: 500),
              child: GridView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 7 / 4.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: shops.shopImages?.length,
                itemBuilder: (context, index) => MyBoxContainer(
                  radius: 15,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context, CupertinoPageRoute(
                      // builder: (context) {
                      // return ImagesView(
                      // imagesData: shops.shopImages!.imagesData!);
                      // },
                      // ));
                    },
                    child: CachedImage(
                        url: shops.shopImages?[index].shopImageUrl ?? ''),
                  ),
                ),
              ),
            ),
          ],
        )
            : const SizedBox()
      ],
    );
  }
}