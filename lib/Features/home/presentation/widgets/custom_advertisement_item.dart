import 'package:flutter/material.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../data/models/home_model.dart';

class CustomAdvertisementItem extends StatelessWidget {
  const CustomAdvertisementItem({
    super.key,
    required this.advertisementData,
  });

  final AdvertisementData advertisementData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6)
        ),
        child: Stack(
          children: [
            CachedImage(
              url: '${advertisementData.imageAdvertisement}',
              height: double.infinity,
            ),
            Align(
              alignment: const Alignment(.9, .7),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Text(
                  advertisementData.titleAdvertisement ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,

                  style: AppStyles.styleRegular14
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(.6, 1),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,

                child: Text(
                  advertisementData.subtitleAdvertisement ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  style: AppStyles.styleRegular14
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
