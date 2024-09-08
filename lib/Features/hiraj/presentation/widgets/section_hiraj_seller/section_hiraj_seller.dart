import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/post_seller_products/post_seller_view.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_hiraj_seller/show_all_seller.dart';
import 'package:sahel_net/core/utils/function/functions.dart';
import '../../../../../core/utils/const/constant_manager.dart';
import '../../../../../core/utils/widgets/custom_header_view_all.dart';
import '../../../../analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../../data/models/hiraj_model.dart';
import 'Items_hiraj_seller.dart';

class SectionHirajSeller extends StatelessWidget {
  const SectionHirajSeller({
    super.key,
    required this.sellerData,
  });

  final List<HirajSellerData> sellerData;

  @override
  Widget build(BuildContext context) {
    List<HirajSellerData> lastSellerData = sellerData
        .sublist(sellerData.length - lastItems(data: sellerData, number: 10));
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(direction: Axis.vertical, children: [
          CustomHeaderViewAll(
            title: 'بائعين',
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return ShowAllSeller(
                      sellerData: sellerData,
                    );
                  },
                ),
              );
            },
          ),
          AspectRatio(
              aspectRatio: 3,
              child: AnimationLimiter(
                child: ListView.builder(
                  reverse: true,
                  itemCount: lastSellerData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final reversedIndex = lastSellerData.length - 1 - index;
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        horizontalOffset: 120,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              /// favorite seller

                              isFavoriteSeller[
                                      sellerData[reversedIndex].idHirajSeller] =
                                  sellerData[reversedIndex].sellerFavorite;
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    AppAnalysisCubit.get(context)/// App Analysis
                                        .analysisEntrySeller(
                                            idSeller: sellerData[reversedIndex]
                                                    .idHirajSeller ??
                                                0);
                                    return PostSeller(
                                        hirajSellerData:
                                            sellerData[reversedIndex]);
                                  },
                                ),
                              );
                            },
                            child: ItemsHirajSeller(
                              lastSellerData: lastSellerData[reversedIndex],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
