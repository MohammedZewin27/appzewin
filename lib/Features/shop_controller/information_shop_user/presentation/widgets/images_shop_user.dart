import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';

import '../../../core_shop/const/const_shop.dart';
import '../../data/models/information_model.dart';
import '../cubit/information_shop_cubit.dart';

class ImagesShopUser extends StatelessWidget {
  const ImagesShopUser({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InformationShopCubit, InformationShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
    if(state is InformationShopSuccess){
      addMoreImages=state.shopImagesUser.imagesData??[];
      var imagesShopUser=state.shopImagesUser.imagesData??[];
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        delegate: SliverChildBuilderDelegate(
          childCount: imagesShopUser.length,
              (context, index) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: CachedImage(
                  url: imagesShopUser[index].shopImageUrl ?? ''),

            );
          },
        ),
      );
    }
    return SliverToBoxAdapter(child: SizedBox());

      },
    );
  }
}