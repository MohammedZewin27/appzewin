import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/analysis/presentation/cubit/app_analysis_cubit.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/post_seller_products/post_seller_view.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_hiraj_category/seller_item_hiraj.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';

import '../../../../../core/utils/const/constant_manager.dart';
import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/screen_add.dart';
import '../../../data/models/hiraj_model.dart';

class ItemsCategoryHiraj extends StatelessWidget {
  const ItemsCategoryHiraj({
    super.key,
    required this.hirajData,
  });

  final HirajData hirajData;

  @override
  Widget build(BuildContext context) {
    List<HirajSellerData> sellerData =
        hirajData.hirajSeller?.hirajSellerData ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(hirajData.nameHiraj ?? ''),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CachedImage(
              url: hirajData.imageHiraj ?? '',
              width: getResponsiveSize(context, size: 25),
            ),
          )
        ],
      ),
      body: sellerData.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 16 / 9,
                  mainAxisSpacing: 5),
              itemCount: sellerData.length,
              itemBuilder: (context, index) {
                isFavoriteSeller[sellerData[index].idHirajSeller] =
                    sellerData[index].sellerFavorite;

                return GestureDetector(
                    onTap: () {
                      AppAnalysisCubit.get(context).analysisEntrySeller(idSeller: sellerData[index].idHirajSeller??0);

                      sellerData[index].products?.status == AppString.success
                          ? Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  // /// isSelected favorite
                                  // sellerFavoriteIsSelected= sellerData[index].sellerFavorite??0;
                                  return PostSeller(
                                      hirajSellerData: sellerData[index]);
                                },
                              ),
                            )
                          : null;
                    },
                    child: SellerItemHiraj(sellerData: sellerData[index]));
              },
            )
          : const ScreenAdd(),
    );
  }
}


