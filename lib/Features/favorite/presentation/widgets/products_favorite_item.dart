import 'package:flutter/material.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../hiraj/data/models/hiraj_model.dart';
import '../../../hiraj/presentation/widgets/deatils_product/details_product_seller.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../cubit/favorite_view_cubit.dart';
import 'delete_icon.dart';

class ProductsFavoriteItem extends StatelessWidget {
  const ProductsFavoriteItem({super.key, required this.product});

  final ProductData? product;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Card(
            // clipBehavior: Clip.none,
            elevation: 10,
            child:ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hoverColor: ColorManager.primary5,
              splashColor: ColorManager.primary.withOpacity(.47),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsProductSeller(
                        showFavorite: false,
                        productsSeller: product!,
                        hirajSellerData: HirajSellerData(
                        ),
                      );
                    },
                  ),
                );
              },
              title: Text(product?.titleProduct??'',  textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                maxLines: 1,overflow: TextOverflow.ellipsis,
                style: AppStyles.styleBold16.copyWith(
                    color: ColorManager.primary
                ),),
              subtitle: Text(product?.detailsProduct??'',maxLines: 1,overflow: TextOverflow.ellipsis,  textDirection: TextDirection.rtl,
                style: AppStyles.styleSemiBold10.copyWith(
                    color: Colors.black54
                ),),
              leading:Container(
                clipBehavior: Clip.antiAlias,
                width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: CachedImage(url:  product?.imageProduct ?? '',)) ,

            ),





          ),
        ),
        DeleteIcon(onTap: () {
                  FavoriteViewCubit.get(context)
                      .deleteProductFavorite(
                      parentId: ParentCubit.get(context).parentId,
                      productId: product?.idProduct??0);
                },),
      ],
    );
  }
}