import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_communication/Communication_model.dart';
import '../../../../core/utils/widgets/custom_communication/custom_shop_communication.dart';
import '../../data/models/home_model.dart';

class AdvertisementView extends StatelessWidget {
  const AdvertisementView({super.key, required this.advertisementData});

  final AdvertisementData advertisementData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('اعلانات ${CacheData.getData(key: StringCache.parentName)}'),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 20,
            child: CachedImage(url: advertisementData.imageAdvertisement ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    advertisementData.nameAdvertisement ?? '',
                    textDirection: TextDirection.rtl,
                    style: AppStyles.styleSemiBold16,
                  ),
                ),
                advertisementData.phoneAdvertisement != ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'جوال',
                            textDirection: TextDirection.rtl,
                            style: AppStyles.styleSemiBold16,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            height: 3,
                            width: 45,
                            color: ColorManager.primary,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              advertisementData.phoneAdvertisement ?? '',
                              textDirection: TextDirection.rtl,
                              // style: AppStyles.styleSemiBold12,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                advertisementData.informationAdvertisement != ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'تفاصيل :',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            style: AppStyles.styleSemiBold16,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            height: 3,
                            width: 45,
                            color: ColorManager.primary,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 30.0,
                            ),
                            child: Text(
                              advertisementData.informationAdvertisement ?? '',
                              textDirection: TextDirection.rtl,
                              // style: AppStyles.styleSemiBold12,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          CustomShopCommunication(
              showFavorite: false,
              id: 1,

              ///---------اعلانات -------------------
              communicationModel: CommunicationModel(
                  details: advertisementData.phoneAdvertisement ?? '',
                  phone: advertisementData.phoneAdvertisement ?? '',
                  location: advertisementData.locationAdvertisement ?? '',
                  urlImage: advertisementData.imageAdvertisement ?? '',
                  title: advertisementData.titleAdvertisement ?? '')),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
