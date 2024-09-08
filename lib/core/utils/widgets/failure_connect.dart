import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/assets.dart';

class FailureConnect extends StatelessWidget {
  const FailureConnect({
    super.key,

    required this.onPressed,
  });


  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
            opacity: .03,
            child:Image.asset(Assets.imagesLogo)
                // CachedImage(url: CacheData.getData(key: StringCache.appLogo))
        
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(height: MediaQuery.sizeOf(context).width/2),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Lottie.asset(Assets.imagesFailureConnect,
                      fit: BoxFit.fill, animate: true),
                ),
                 Shimmer.fromColors(
                   baseColor: ColorManager.primary,
                   highlightColor:  ColorManager.ofWhite,
                   child: const Text(
                    'جاري العمل على اضافة المحلات ',
                    style: AppStyles.styleBold16,
                                 ),
                 ),
                const SizedBox(height: 60),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.lightOrange.withOpacity(.9),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                  onPressed: onPressed,

                  child:  Text('إعادة التحميل',
                      style:  AppStyles.styleRegular14.copyWith(
                        color: Colors.white
                      ),),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
