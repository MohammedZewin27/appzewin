import 'package:flutter/material.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/widgets/my_box_container.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../../data/models/favorite_model.dart';
import '../cubit/favorite_view_cubit.dart';
import 'delete_icon.dart';

class ShopsFavoriteItem extends StatelessWidget {
  const ShopsFavoriteItem({
    super.key,
    required this.shopData,
  });

  final Shops? shopData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          MyBoxContainer(
            radius: 12,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CachedImage(url: shopData?.shopImage ?? '')),
                    ),
                  ],
                ),
                Text(
                  shopData?.shopName ?? '',
                  style: AppStyles.styleSemiBold16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: const Row(
                      children: [
                        Expanded(child: SizedBox()),

                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: DeleteIcon(onTap: () {

              FavoriteViewCubit.get(context)
                  .deleteShopFavorite(
                  parentId: ParentCubit.get(context).parentId,
                  shopId: shopData?.shopId??0);



            },),
          )
        ],
      ),
    );
  }
}