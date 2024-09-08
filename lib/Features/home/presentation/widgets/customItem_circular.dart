import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../../core/utils/api/api_service.dart';
import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/valus_manager.dart';

class CustomItemCircular extends StatelessWidget {
  const CustomItemCircular({
    super.key,
    required this.image,
    required this.title,
    this.color,
    this.width,
    this.height,
  });

  final String image;
  final String title;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s6),
      child: Column(
        children: [
          Card(
            elevation: 6,
            child: Container(
              width: getResponsiveSize(context, size: 45),
              height: getResponsiveSize(context, size: 45),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  color: ColorManager.white,
                 ),
              child: Container(
                margin: const EdgeInsets.all(5),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(

                            "$linkImage$image" ?? '',
                            scale: 1.0,),
                        fit: BoxFit.fill)),
                // child: CachedImage(url: image),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleSemiBold12.copyWith(
                  fontSize: getResponsiveSize(context, size: 12),
                  color: ColorManager.blue)),
        ],
      ),
    );
  }
}
