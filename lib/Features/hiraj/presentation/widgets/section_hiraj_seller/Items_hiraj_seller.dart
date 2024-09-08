import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../data/models/hiraj_model.dart';

class ItemsHirajSeller extends StatelessWidget {
  const ItemsHirajSeller({
    super.key,
    required this.lastSellerData,

  });

  final HirajSellerData lastSellerData;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Card(
       elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: CachedImage(
                  url: lastSellerData.imageHirajSeller ??
                      '',
                  sizeIndicator: 8,
                ),
              ),
              Container(
                height: 38,
                width: double.infinity,
                color:   Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: Text(
                    lastSellerData.nameHirajSelle ?? '',
                    maxLines:2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleSemiBold10.copyWith(
                      color: ColorManager.primary7,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}