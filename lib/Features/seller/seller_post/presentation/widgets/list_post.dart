import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/cubit/analysis_cubit.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/widgets/product_post.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../core/const.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';
import '../../data/models/post_seller_model.dart';

import '../cubit/post_seller_cubit.dart';
import '../pages/seller_post.dart';

class ListPostSeller extends StatelessWidget {
  const ListPostSeller({
    super.key,
    required this.dataPost,
    required this.sellerData,
  });

  final List<ProductsSeller> dataPost;
  final SellerData? sellerData;

  @override
  Widget build(BuildContext context) {
    List<ProductsSeller> data = dataPost;
    return RefreshIndicator(
      onRefresh: () async {
        await PostSellerCubit.get(context)
            .fetchPostOfSeller(sellerId: sellerData?.idHirajSeller ?? 0);
      },
      child: BlocBuilder<AnalysisCubit, AnalysisState>(
        builder: (context, state) {
          if (state is AnalysisLowestRating) {
            data.sort((a, b) => a.ratingProduct!.compareTo(b.ratingProduct!));

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ProductPost(dataPost: dataPost[index]);
              },
            );
          }
          if (state is AnalysisHighestRating) {
            data.sort((a, b) => b.ratingProduct!.compareTo(a.ratingProduct!));
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ProductPost(dataPost: dataPost[index]);
              },
            );
          }
          if (state is AnalysisUnActive) {
            return ListView.builder(
              itemCount: postUnActive.length,
              itemBuilder: (context, index) {
                return ProductPost(dataPost: postUnActive[index]);
              },
            );
          }
          if (state is AnalysisActive) {
            return ListView.builder(
              itemCount:postActive.length,
              itemBuilder: (context, index) {
                return ProductPost(dataPost: postActive[index]);
              },
            );
          }
          return ListView.builder(
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              final reversedIndex = dataPost.length - 1 - index;

              /// طريقة اخري لعكس الترتيب
              var item = dataPost[reversedIndex];
              // productsFavoriteIsSelected=item.productFavorite??0;
              /// عكس الترتيب
              ///

              return ProductPost(dataPost: item);
            },
          );
        },
      ),
    );
    ListView(
      /// show posts
      children: [
        Row(
          children: [
            CachedImage(
              url: dataPost[0].imageProduct ?? '',
              height: 35,
              width: 100,
            ),
            Expanded(
              child: Text(
                sellerData?.nameHirajSelle ?? '',
                style: AppStyles.styleBoldPrimary16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
