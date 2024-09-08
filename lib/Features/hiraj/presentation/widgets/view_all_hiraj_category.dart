import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/post_seller_products/post_seller_view.dart';

import '../../../../core/utils/const/constant_manager.dart';
import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';

import '../../../../core/utils/widgets/custom_rating.dart';
import '../../../../core/utils/widgets/my_box_container.dart';
import '../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../home/presentation/widgets/sub_category/custom_tap_bar.dart';
import '../../data/models/hiraj_model.dart';

class ViewAllHirajCategory extends StatelessWidget {
  const ViewAllHirajCategory({
    super.key,
    required this.hirajData,
  });

  final List<HirajData> hirajData;

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = hirajData.map((data) {
      return Tab(
        text: data.nameHiraj,
        icon: SizedBox(
          height: getResponsiveSize(context, size: 20),
          width: getResponsiveSize(context, size: 20),
          child: CachedImage(
            url: data.imageHiraj ?? '',
            sizeIndicator: 10,
          ),
        ),
      );
    }).toList();
    return DefaultTabController(
      length: hirajData.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'الاقسام',
            style: AppStyles.styleSemiBold16,
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: CustomTapBar(tabs: tabs)),
        ),
        body: TabBarView(
            children: tabs.map((e) {
          int indexTab = tabs.indexOf(e);

          List<HirajSellerData> seller =
              hirajData[indexTab].hirajSeller?.hirajSellerData ?? [];
          return seller.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 16 / 14,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 250),
                    itemCount: seller.length,
                    itemBuilder: (context, index) {
                      isFavoriteSeller[seller[index].idHirajSeller]=seller[index].sellerFavorite;
                      return TabBodySeller(seller: seller[index]);
                    },
                  ),
                )
              : Center(child: Text('${AppString.noCategory}${e.text}'));
        }).toList()),
      ),
    );
  }
}

class TabBodySeller extends StatelessWidget {
  const TabBodySeller({super.key, required this.seller});

  final HirajSellerData seller;

  @override
  Widget build(BuildContext context) {
    return MyBoxContainer(
      radius: 8,
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      /// favorite seller
                      // sellerFavoriteIsSelected= seller.sellerFavorite??0;

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            AppAnalysisCubit.get(context).analysisEntrySeller(idSeller: seller.idHirajSeller??0);
                            return PostSeller(hirajSellerData: seller);
                          },
                        ),
                      );
                    },
                    child: CachedImage(
                      url: seller.imageHirajSeller ?? '',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  // const CustomIconFavorite(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomRating(
                        rating:
                            double.parse(seller.ratingSeller.toString()),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              seller.nameHirajSelle ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                              style: AppStyles.styleBold16
                                  .copyWith(color: Colors.black),
                            ),
                            // Center(
                            //   child: Text(
                            //     sellerData. ?? '',
                            //     maxLines: 2,
                            //     overflow: TextOverflow.ellipsis,
                            //     textDirection: TextDirection.rtl,
                            //     style: AppStyles.styleRegular14,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
