import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';

import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/widgets/my_box_container.dart';

class ListImageCarouselSlider extends StatelessWidget {
  const ListImageCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (context, index, realIndex) => AspectRatio(
                aspectRatio: getResponsiveSize(context, size: 3.0),
                child: const MyBoxContainer(
                  radius: 12,
                  child: CachedImage(
                      url:
                          'https://www.annahar.com/ContentFiles/248329Image1-1180x677_d.jpg?version=3399709'),
                ),
              ),
          options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            animateToClosest: true,
            autoPlay: false,
            enlargeCenterPage: true,
            reverse: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.7,
            aspectRatio:   getResponsiveSize(context, size: 3.5),

            initialPage: 1,
          )),
    );
  }
}
