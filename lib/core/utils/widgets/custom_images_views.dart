import 'package:flutter/material.dart';

import '../theme/color_manager.dart';
import 'cashed_image.dart';
import 'controller_page_view.dart';

class CustomImagesViews extends StatelessWidget {
  const CustomImagesViews(
      {super.key, required this.index, required this.tag, required this.images});

  final int index;
  final String tag;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          PageView.builder(
            controller: MyPageController(index: index),

            itemBuilder: (context, index) =>
                Hero(
                    tag: tag,
                    child: CachedImage(url: images[index] ?? '')),
            reverse: true,
            itemCount: images.length,
          ),
          Positioned(
            height: 100,
            right: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                padding:
                const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorManager.white),
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.redAccent,
                ),),),
          ),
        ],
      ),
    );
  }
}