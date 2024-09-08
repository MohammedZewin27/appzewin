import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/cashed_image.dart';

class CustomCarouselSliderProductImages extends StatefulWidget {
  const CustomCarouselSliderProductImages({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<CustomCarouselSliderProductImages> createState() => _CustomCarouselSliderProductImagesState();
}

class _CustomCarouselSliderProductImagesState extends State<CustomCarouselSliderProductImages> {
  late int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          carouselController: _controller,
          itemBuilder: (context, index, realIndex) {
            return Container(

              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: CachedImage(url: widget.images[index] ));
          },
          disableGesture: true,
          options: CarouselOptions(
            reverse: true,
            autoPlay: widget.images.length > 1,
            autoPlayCurve: Curves.easeOut,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayInterval: const Duration(seconds: 15),
            enlargeCenterPage: true,
            viewportFraction: 1.5,
            aspectRatio: 1,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () =>_controller.animateToPage(entry.key),
              child: Container(
                width: 6.0,
                height: 6.0,
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                    (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(
                        _current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}