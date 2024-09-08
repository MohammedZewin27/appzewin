import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/post_seller_products/post_seller_body.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../data/models/hiraj_model.dart';


class PostSeller extends StatelessWidget {
  const PostSeller({super.key, required this.hirajSellerData, });


  final HirajSellerData hirajSellerData;


  @override
  Widget build(BuildContext context) {
    var listSellerProducts = hirajSellerData.products?.productData ?? [];
    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.33,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: ColorManager.primary7,
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  // width: MediaQuery.sizeOf(context).width/2,
                  decoration: BoxDecoration(
                    color: ColorManager.primary7.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  height: 60,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              hirajSellerData.nameHirajSelle ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: AppStyles.styleSemiBold20.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // const CustomIconFavorite(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: CachedImage(url: hirajSellerData.imageHirajSeller ?? ''),
                  ),
                ),
              ),
            ),
          ];
        },
        body: PostSellerBody(sellerData: hirajSellerData, data: listSellerProducts),
      ),
    );
  }
}



