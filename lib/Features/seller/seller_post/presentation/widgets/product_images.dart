import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/seller/core/api/api_service_seller.dart';
import 'package:sahel_net/Features/seller/seller_post/data/repositories/post_seller_repo_impl.dart';

import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../core/const.dart';
import '../../data/models/post_seller_model.dart';


class ProductImagesView extends StatelessWidget {
  const ProductImagesView({
    super.key,
    required this.productImages,
  });

  final ProductImages? productImages;

  @override
  Widget build(BuildContext context) {

    return productImages?.status==AppString.success?Padding(
      padding: const EdgeInsets.only(right: 6, left: 6),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).width/6,
        child: ListView.builder(
          reverse: true,
          itemCount: productImages?.productImagesData?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(3),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)),
              child: CachedImage(
                url: productImages?.productImagesData?[index].productImage ?? '',
                sizeIndicator: 3,
                width:MediaQuery.sizeOf(context).width/7,
                height:MediaQuery.sizeOf(context).width/7,
              ),
            );
          },
        ),
      ),
    ):SizedBox();
  }
}


