import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../data/models/hiraj_model.dart';

class HirajCategoryItem extends StatelessWidget {
  const HirajCategoryItem({
    super.key,
    required this.hirajData,
  });

  final HirajData hirajData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          CachedImage(
            url: hirajData.imageHiraj ?? '',
            sizeIndicator: 8,
            width: getResponsiveSize(context, size: 30),
            height: getResponsiveSize(context, size: 30),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(hirajData.nameHiraj ?? '',
                    style: AppStyles.styleSemiBold10,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}