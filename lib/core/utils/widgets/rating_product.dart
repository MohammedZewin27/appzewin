import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/presentation/cubit/hiraj_cubit.dart';

import '../responsive size/responsive_size.dart';
import '../theme/color_manager.dart';
import '../theme/styles_manager.dart';
import 'custom_rating.dart';
import 'my_box_container.dart';

class RatingProductAdd extends StatefulWidget {
  const RatingProductAdd({
    super.key, required this.name, required this.productId, required this.userid,
  });

  final String name;
  final int productId;
  final int userid;

  @override
  State<RatingProductAdd> createState() => _RatingProductAddState();
}

class _RatingProductAddState extends State<RatingProductAdd> {
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
          child: Text(widget.name,
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
                HirajCubit.get(context).ratingProduct(userid:widget.userid,
                    productId: widget.productId,
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
        SizedBox(height: MediaQuery.sizeOf(context).height / 12,),
      ],
    );
  }
}