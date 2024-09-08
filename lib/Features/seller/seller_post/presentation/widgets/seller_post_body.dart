import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/seller/core/api/function.dart';
import 'package:sahel_net/Features/seller/core/const.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../add_post/presentation/pages/AddPost.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';
import '../cubit/post_seller_cubit.dart';

import 'list_post.dart';

class SellerPostBody extends StatelessWidget {
  const SellerPostBody({
    super.key,
    required this.sellerData,
  });

  final SellerData? sellerData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostSellerCubit, PostSellerState>(
      builder: (context, state) {
        if (state is PostSellerSuccess) {
          dataPostToSeller =
              state.postSellerModel.product?.productsSeller ?? [];
          getPostActive(dataPostToSeller);
          return dataPostToSeller.isNotEmpty
              ? ListPostSeller(
                  dataPost: dataPostToSeller, sellerData: sellerData)
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesEmptyProducts,
                        height: MediaQuery.sizeOf(context).width / 2,
                        width: MediaQuery.sizeOf(context).width / 2,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'لا يوجد منتجات ',
                        style: AppStyles.styleSemiBold18,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddSellerPost(),
                              ));
                        },
                        icon: Icon(
                          FontAwesomeIcons.handPointDown,
                          size: 50,
                          color: ColorManager.lightOrange,
                        ),
                      )
                    ],
                  ),
                );
        } else if (state is PostSellerFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CustomProgressIndicator());
        }
      },
    );
  }
}
