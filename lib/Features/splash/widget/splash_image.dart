import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../core/utils/theme/valus_manager.dart';


class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(Assets.imagesLogo),
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * AppSizeMediaQuery.s0_3,
    );
  }
}