import 'package:flutter/material.dart';

import '../responsive size/responsive_size.dart';
import 'cashed_image.dart';

class ImageAppBar extends StatelessWidget {
  const ImageAppBar({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getResponsiveSize(context, size:40),
      height: getResponsiveSize(context, size: 50),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(offset: Offset(2, 2), color: Colors.white)
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0xFFF1F1F1)),
          // borderRadius: BorderRadius.circular(8),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 9),
      child: CachedImage(url: url),
    );
  }
}