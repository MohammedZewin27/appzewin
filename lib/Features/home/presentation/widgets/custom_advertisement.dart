import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/widgets/custom_advertisement_item.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../core/variable.dart';
import '../../data/models/home_model.dart';
import 'advertisement_view.dart';

class CustomAdvertisement extends StatefulWidget {
  const CustomAdvertisement({super.key, required this.advertisement});

  final Advertisement advertisement;

  @override
  State<CustomAdvertisement> createState() => _CustomAdvertisementState();
}

class _CustomAdvertisementState extends State<CustomAdvertisement> {
  late int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
  dataAdvertisement = widget.advertisement.advertisementData ?? [];
    return dataAdvertisement.isNotEmpty
        ? SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: dataAdvertisement.length,
                  itemBuilder: (context, index, realIndex) {

                   return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AdvertisementView(
                              advertisementData: dataAdvertisement[index],
                            ),
                          ),
                        );
                      },
                      child: CustomAdvertisementItem(
                        advertisementData: dataAdvertisement[index],
                      ),
                    );
                  },
                  disableGesture: true,
                  options: CarouselOptions(
                      reverse: true,
                      autoPlay: dataAdvertisement.length > 1,
                      autoPlayCurve: Curves.easeOut,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlayInterval: const Duration(seconds: 15),
                      enlargeCenterPage: true,
                      viewportFraction: .80,
                      aspectRatio: 3,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: dataAdvertisement.asMap().entries.map((entry) {
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
                                        : ColorManager.primary)
                                    .withOpacity(
                                        _current == entry.key ? 1 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        : const SliverToBoxAdapter(
            child: SizedBox(),
          );
  }
}
