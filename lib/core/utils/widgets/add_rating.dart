import 'package:flutter/material.dart';

import '../../../Features/home/presentation/cubit/home_cubit.dart';
import '../cash_data.dart';
import '../responsive size/responsive_size.dart';
import '../theme/color_manager.dart';
import '../theme/styles_manager.dart';
import 'custom_rating.dart';
import 'my_box_container.dart';

class AddRating extends StatefulWidget {
  const AddRating({super.key, required this.name, required this.id});

  final String name;
  final int id;


  @override
  State<AddRating> createState() => _AddRatingState();
}

class _AddRatingState extends State<AddRating> {
  @override
  Widget build(BuildContext context) {
    double rating = 1;
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
          child: Text(
            widget.name ?? '',
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

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary),
              onPressed: () {
                HomeCubit.get(context).ratingShop(
                    userid: CacheData.getData(key: StringCache.userId),
                    shopId: widget.id,
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
      ],
    );
  }
}