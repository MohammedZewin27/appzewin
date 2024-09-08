import 'package:flutter/material.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/widgets/my_box_container.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../../data/models/favorite_model.dart';
import '../cubit/favorite_view_cubit.dart';
import 'delete_icon.dart';

class SellersFavoriteItem extends StatelessWidget {
  const SellersFavoriteItem({
    super.key,
    required this.dataSellers,
  });

  final Sellers? dataSellers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MyBoxContainer(
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
                      child: CachedImage(
                          url: dataSellers?.imageHirajSeller ?? '')),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: DeleteIcon(onTap: () {

                    FavoriteViewCubit.get(context)
                        .deleteSellerFavorite(
                        parentId: ParentCubit.get(context).parentId,
                        sellerId: dataSellers?.idHirajSeller??0);
                  },),
                )
              ],
            ),
            Text(
              dataSellers?.nameHirajSelle ?? '',
              style: AppStyles.styleSemiBold16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Row(
                  children: [
                    Expanded(child: SizedBox()),
                    // Expanded(
                    //   flex: 2,
                    //   child: CustomCommunication2(
                    //       communicationModel: CommunicationModel(
                    //           phone: dataSellers?.phoneSeller ?? '',
                    //           location: dataSellers?.locationSeller ?? '',
                    //           urlImage: dataSellers?.imageHirajSeller ?? '',
                    //           details: dataSellers?.addressSeller ?? '',
                    //           title: dataSellers?.nameHirajSelle ?? '')),
                    // ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}