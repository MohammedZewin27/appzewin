import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/presentation/cubit/information_shop_cubit.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/custom_Title_and_details.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../choose_user/presentation/cubit/shop_active_cubit.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../core_shop/const/const_shop.dart';
import '../../data/models/information_model.dart';
import '../cubit/services_shop_cubit.dart';
import '../widgets/grid_servies_shop.dart';
import '../widgets/images_shop_user.dart';

class InformationShopUser extends StatelessWidget {
  const InformationShopUser({
    super.key,
    this.shopData,
  });

  final ShopData? shopData;

  // final List<ImagesData> imagesShopUser;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        InformationShopCubit.get(context).getImagesShop();
        ServicesShopCubit.get(context).getServicesShop();
        return ShopActiveCubit.get(context).getDateShop();
      },
      child: BlocConsumer<ShopActiveCubit, ShopActiveState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ShopActiveSuccess) {

            // DateTime start=DateTime(year);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorManager.primary7),
                          child: Text(
                            shopData?.shopName ?? '',
                            style: AppStyles.styleSemiBold20
                                .copyWith(color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyBoxContainer(
                          radius: 12,
                          margin: 10,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: CachedImage(url: shopData?.shopImage ?? ''),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ImagesShopUser(),

                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTitleAndDetails(
                            text: 'كود', details: shopData?.codeShop ?? ''),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTitleAndDetails(
                            text: 'العنوان',
                            details: shopData?.shopAddress ?? ''),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTitleAndDetails(
                            text: 'جوال', details: shopData?.shopPhone ?? ''),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTitleAndDetails(
                            text: 'التقييم',
                            details: shopData?.ratingShop
                                    .toString()
                                    .substring(0, 3) ??
                                '1'),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTitleAndDetails(
                            text: 'تاريخ البدء',
                            details:
                                shopData?.shopTimestart
                                    // ?.substring(0, 11)
                                    ??
                                    ''),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTitleAndDetails(
                            text: 'تاريخ الانتهاء',
                            details:
                                shopData?.shopTimeend
                                    // ?.substring(0, 11)
                                    ?? ''),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const GridServicesShop(),

                   SliverToBoxAdapter(
                    child: SizedBox(height: MediaQuery.sizeOf(context).width/3,),
                  )
                ],
              ),
            );
          }
          if (state is ShopActiveFailure) {
          } else {
            return const Center(child: CustomProgressIndicator());
          }
          return const Center(child: CustomProgressIndicator());
        },
      ),
    );
  }
}


