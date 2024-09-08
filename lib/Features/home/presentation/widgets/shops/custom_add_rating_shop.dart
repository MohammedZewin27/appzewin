import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/cubit/home_cubit.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../data/models/home_model.dart';

class CustomAddRatingShop extends StatefulWidget {
  const CustomAddRatingShop({
    super.key, required this.shopsData,
  });


  final ShopsData shopsData;

  @override
  State<CustomAddRatingShop> createState() => _CustomAddRatingShopState();
}

class _CustomAddRatingShopState extends State<CustomAddRatingShop> {
  double rating = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
            child: Container(
              height: getResponsiveSize(context, size: 6),
              width: getResponsiveSize(context, size: 60),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.shopsData.shopName??'',
            style: AppStyles.styleRegular16,
          ),
        ),

        SizedBox(
          height: getResponsiveSize(context, size: 15),
        ),
        MyBoxContainer(
          radius: 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '( $rating / 5 )',
              style: AppStyles.styleSemiBold20
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          height: getResponsiveSize(context, size: 15),
        ),
        CustomRating(
          rating: rating,
          itemSize: 50,
          ignoreGestures: false,
          onRatingUpdate: (numRating) {
            setState(() {
              rating = numRating;
            });
          },
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: getResponsiveSize(context, size: 100),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery
                .sizeOf(context)
                .width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary),
              onPressed: () {
                HomeCubit.get(context).ratingShop(
                    userid: CacheData.getData(key: StringCache.userId),
                    shopId: widget.shopsData.shopId!,
                    ratingValue: rating);
                Navigator.pop(context);
              },
              child: const Text(
                'تقيمك',
                style: AppStyles.styleSemiBold18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 80,)
      ],
    );
  }
}