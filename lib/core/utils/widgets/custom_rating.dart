import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../responsive size/responsive_size.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.rating, this.onRatingUpdate, this.ignoreGestures, this.itemSize, this.unratedColor,
  });

  final double rating;
  final bool? ignoreGestures;
  final double? itemSize;
  final Color? unratedColor;
  final Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(


      initialRating: rating,
      ignoreGestures: ignoreGestures??true,
      minRating: 1,
      direction: Axis.horizontal,
      unratedColor: unratedColor,

      // allowHalfRating: false,
      itemSize: itemSize?? getResponsiveSize(context, size: 16),
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate:onRatingUpdate?? (rating) {
        print(rating);
      },
    );
  }
}