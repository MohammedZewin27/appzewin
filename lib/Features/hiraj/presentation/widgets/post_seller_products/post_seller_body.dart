import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/const/constant_manager.dart';

import '../../../../../core/utils/widgets/custom_communication/Communication_model.dart';
import '../../../../../core/utils/widgets/custom_communication/custom_communication_seller.dart';
import '../../../../../core/utils/widgets/screen_add.dart';
import '../../../../../generated/assets.dart';
import '../../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../data/models/hiraj_model.dart';
import 'custom_information_seller.dart';
import 'items_products.dart';

class PostSellerBody extends StatelessWidget {
  const PostSellerBody({
    super.key,
    required this.sellerData,
    required this.data,
  });

  final HirajSellerData sellerData;
  final List<ProductData> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomCommunicationSeller(
          isFavorite: isFavoriteSeller[sellerData.sellerFavorite] == 1,
          sellerId: sellerData.idHirajSeller!,
          communicationModel: CommunicationModel(
              details: sellerData.locationSeller ?? '',
              phone: sellerData.phoneSeller ?? '',
              location: sellerData.locationSeller ?? '',
              urlImage: sellerData.imageHirajSeller ?? '',
              title: sellerData.nameHirajSelle ?? ''),
        ),
        CustomInformationSeller(hirajSellerData: sellerData),
        data.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {

                    // List<ProductData> dataProduct = data.reversed.toList();
                    final reversedIndex = data.length - 1 - index;
                    /// طريقة اخري لعكس الترتيب
                    var item = data[reversedIndex];
                    // productsFavoriteIsSelected=item.productFavorite??0;
                    /// عكس الترتيب

                    return ItemsProducts(
                      hirajSellerData: sellerData,
                      productsSeller: item,
                    );
                  },
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                   ScreenAdd(
                     icon: Icons.phone_callback_outlined,
                     phone:sellerData.phoneSeller ,
                    titleButton: 'تواصل مع ${sellerData.nameHirajSelle}',
                    image: Assets.imagesNotFoundProducts,
                    text: 'لم يتم نشر ${sellerData.nameHirajSelle} منتجات حالياً , \n انتظر قريبا ,,,',
                  ),
                ],
              ),
      ],
    );
  }
}
