import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/widgets/update_product/update_productSeller.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/custom_images_views.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../../generated/assets.dart';
import '../../../core/PopupMenu.dart';
import '../../../core/api/api_service_seller.dart';
import '../../../core/const.dart';
import '../../data/models/post_seller_model.dart';
import '../../data/repositories/post_seller_repo_impl.dart';
import '../cubit/social_media_product_cubit.dart';
import 'analysis_post.dart';

class DetailsSellerProduct extends StatelessWidget {
  const DetailsSellerProduct({super.key, required this.dataPost});

  final ProductsSeller dataPost;

  @override
  Widget build(BuildContext context) {
    List<ProductImagesData> productImages =
        dataPost.productImages?.productImagesData ?? [];
    List<String> imagesUrl = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(dataSellerInScreenAddPost?.nameHirajSelle ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    // alignment: Alignment.topLeft,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6)),
                        child: CachedImage(
                          url: dataPost.imageProduct ?? '',
                          // width: 70,
                          height: MediaQuery.sizeOf(context).height / 4.5,
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Image.asset(
                          dataPost.statusProduct == 1
                              ? Assets.imagesActiveProduct
                              : Assets.imagesUnActveProduct,
                          height: 15,
                          width: 15,
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 8, left: 5, bottom: 2, top: 2),
                          // width: 43,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.white70,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                dataPost.ratingProduct
                                    .toString()
                                    .substring(0, 3),
                                style: AppStyles.styleBold14.copyWith(
                                    fontSize: 12, color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: MyBoxContainer(
                            radius: 6,
                            padding: 3,
                            child: Text(
                              dataPost.startProduct.toString().substring(0, 11),
                              style: AppStyles.styleBold14,
                            )),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      MyBoxContainer(
                        margin: 10,
                        padding: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            dataPost.titleProduct ?? '',
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleSemiBold16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          dataPost.newPriceProduct != ''
                              ? Row(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      decoration: ShapeDecoration(
                                        color: Colors.blue.withOpacity(.47),
                                        shadows: [
                                          BoxShadow(
                                              offset: const Offset(2, 2),
                                              color:
                                                  Colors.grey.withOpacity(.47))
                                        ],
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFFF1F1F1)),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              bottomLeft: Radius.circular(12)),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('ر.س',
                                              style: AppStyles.styleSemiBold20),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            dataPost.oldPriceProduct.toString(),
                                            style: AppStyles.styleSemiBold12
                                                .copyWith(
                                                    color: Colors.white,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationThickness: 2),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      decoration: ShapeDecoration(
                                        color: Colors.orangeAccent
                                            .withOpacity(.47),
                                        shadows: const [
                                          BoxShadow(
                                              offset: Offset(2, 2),
                                              color: Colors.orangeAccent)
                                        ],
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFFF1F1F1)),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('ر.س',
                                              style: AppStyles.styleSemiBold12),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            dataPost.newPriceProduct ?? '',
                                            style: AppStyles.styleSemiBold12
                                                .copyWith(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('  : التفاصيل',
                          style: AppStyles.styleSemiBold16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enabled: false,
                          maxLines: 15,
                          minLines: 1,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 16),
                          textDirection: TextDirection.rtl,
                          controller: TextEditingController(
                              text: dataPost.detailsProduct),
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            filled: true,
                            fillColor: ColorManager.backTextFrom,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 10, left: 10),
                      //   child: Text(dataPost.detailsProduct ?? '',
                      //       textDirection: TextDirection.rtl,
                      //       style: AppStyles.styleSemiBold12),
                      // ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // mainAxisSpacing: 5,
                    // crossAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  itemCount: productImages.length,
                  itemBuilder: (context, index) {
                    imagesUrl.add(productImages[index].productImage ?? '');
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CustomImagesViews(
                                index: index,
                                tag:
                                    'ImagesViewShop${productImages[index].productImageId}',
                                images: imagesUrl);
                          },
                        ));
                      },
                      child: Hero(
                        tag:
                            'ImagesViewShop${productImages[index].productImageId}',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 6,
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3)),
                              child: CachedImage(
                                url: productImages[index].productImage ?? '',
                                sizeIndicator: 3,
                                width: MediaQuery.sizeOf(context).width / 4,
                                height: MediaQuery.sizeOf(context).width / 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UpdateProductSeller(
                              dataPost: dataPost,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.all(10),
                      ),
                      child: Text(
                        'تعديل',
                        style: AppStyles.styleSemiBold12
                            .copyWith(color: Colors.white),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              icon: Image.asset(
                                Assets.imagesAnalysisSeller,
                                height: 35,
                                width: 35,
                              ),
                              title: const Text('بيانات التفاعل'),
                              content: AspectRatio(
                                  aspectRatio: .6,
                                  child: AnalysisPost(idProduct: dataPost.idProduct??0,)),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.all(10),
                      ),
                      child: Text(
                        'بيانات التفاعل مع المنتج',
                        style: AppStyles.styleSemiBold12
                            .copyWith(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


