import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/const/const_shop.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/presentation/cubit/information_shop_cubit.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../data/models/information_model.dart';
import '../cubit/services_shop_cubit.dart';

class GridServicesShop extends StatelessWidget {
  const GridServicesShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ServicesShopCubit.get(context).getServicesShop();
    return BlocBuilder<ServicesShopCubit, ServicesShopState>(
      builder: (context, state) {
        if(state is  ServicesShopSuccess){
          moreServicesShop=state.servicesShowShopModel.services??[];
          List<Services> servicesShop=state.servicesShowShopModel.services??[];
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: servicesShop.length,
                  (context, index) {
                  return  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorManager.primary7),
                    child: Center(
                      child: AutoSizeText(
                        servicesShop[index].shopServices??'',
                        style: AppStyles.styleSemiBold12.copyWith(color: Colors.white),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  );
                  },
            ),


          );
        }
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
      },
    );
  }
}