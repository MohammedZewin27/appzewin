import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/seller/add_post/data/repos/add_post_repo_impl.dart';
import 'package:sahel_net/Features/seller/core/api/api_service_seller.dart';
import 'package:sahel_net/Features/seller/core/const.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';
import '../../../../choose_user/presentation/cubit/seller_full_active_cubit.dart';
import '../../../core/api/function.dart';
import '../../../seller_analysis/presentation/pages/seller_analysis.dart';
import '../../../seller_post/presentation/cubit/post_seller_cubit.dart';
import '../../../seller_post/presentation/widgets/update_product/update_productSeller.dart';
import '../cubit/add_post_seller_cubit.dart';
import '../widgets/AddSellerPostBody.dart';


class AddSellerPost extends StatelessWidget {
  const AddSellerPost({super.key});

  @override
  Widget build(BuildContext context) {
    getPostActive(dataPostToSeller); /// get post active /// and get post unActive
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اضافة منتج ',
          style: AppStyles.styleSemiBold18.copyWith(color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            AddPostSellerCubit(AddProductRepoImpl(ApiServiceSeller(Dio()))),
        child: BlocConsumer<AddPostSellerCubit, AddPostSellerState>(
          listener: (context, state) {
            if (state is AddPostSellerLoading) {
              const CustomProgressIndicator();
            }
            if (state is AddPostSellerSuccess) {
              PostSellerCubit.get(context).fetchPostOfSeller(
                     sellerId: CacheData.getData(key: StringCache.idSeller));
              Navigator.pop(context);
              Navigator.pop(context);
            }
            if (state is AddPostSellerFailure) {}
          },
          builder: (context, state) {
            return const AddSellerPostBody();
          },
        ),
      ),
    );
  }
}
