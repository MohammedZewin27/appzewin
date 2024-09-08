import 'package:flutter/material.dart';

import '../../../../../../core/utils/widgets/cashed_image.dart';

class ImageLogIn extends StatelessWidget {
  const ImageLogIn({
    super.key,  this.logoImage,

  });

  final String? logoImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width / 2,
      width: MediaQuery.sizeOf(context).width / 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)),
      child: CachedImage(
        url: logoImage ?? '',
      ),
    );
  }
}