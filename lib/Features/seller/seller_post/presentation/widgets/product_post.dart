import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sahel_net/Features/seller/core/const.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/cubit/post_seller_cubit.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/widgets/product_images.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/widgets/update_product/update_productSeller.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/function/call_me.dart';
import 'package:sahel_net/core/utils/widgets/custom_rating.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';
import 'package:sahel_net/generated/assets.dart';
import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/controller_page_view.dart';
import '../../../../../core/utils/widgets/custom_images_views.dart';
import '../../../core/PopupMenu.dart';
import '../../../seller_analysis/presentation/widgets/custom_card_analysis.dart';
import '../../data/models/post_seller_model.dart';
import 'details_product_seller.dart';

class ProductPost extends StatelessWidget {
  const ProductPost({
    super.key,
    required this.dataPost,
    // required this.productImagesData,
  });

  final ProductsSeller dataPost;

  // final List<ProductImages> productImagesData;

  @override
  Widget build(BuildContext context) {
    var cubit = PostSellerCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomCardAnalysis(productsSeller: dataPost,onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailsSellerProduct(
              dataPost: dataPost,
            ),
          ),
        );
      },),
    );

      Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) =>
                  DetailsSellerProduct(
                    dataPost: dataPost,
                  ),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          // margin: EdgeInsets.zero,
          elevation: 6,
          child: Column(
            children: [
              Stack(
                // alignment: Alignment.topLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    clipBehavior: Clip.antiAlias,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    child: CachedImage(
                      url: dataPost.imageProduct ?? '',
                      // width: 70,
                      height: MediaQuery
                          .sizeOf(context)
                          .height / 4.5,
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
                            dataPost.ratingProduct.toString().substring(0, 3),
                            style: AppStyles.styleBold14
                                .copyWith(fontSize: 12, color: Colors.white70),
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
              ProductImagesView(productImages: dataPost.productImages),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              dataPost.titleProduct ?? '',
                              textDirection: TextDirection.rtl,
                              // textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.styleBold16.copyWith(
                                  color:
                                  ColorManager.backBlack.withOpacity(.8)),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        dataPost.detailsProduct ?? '',
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleSemiBold10
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
               ProductImagesView(productImages: dataPost.productImages),
              Container(
                color: ColorManager.backGround,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Image.asset(
                          dataPost.statusProduct == 1
                              ? Assets.imagesActiveProduct
                              : Assets.imagesUnActveProduct,
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(width: 5,),
                        Text(dataPost.statusProduct == 1 ? 'نشط' : 'غير نشط')
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Image.asset(
                          dataPost.deliveryService == 1
                              ? Assets.imagesDelivery
                              : Assets.imagesNoDelivery,
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(width: 5,),
                        Text(dataPost.deliveryService == 1
                            ? 'متاح التوصيل'
                            : 'غير متاح التوصيل')
                      ],
                    ),
                    const Spacer(),
                    CustomPopupMenu(
                      onSelected: (value) {
                        if (value == 'Edit') {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  UpdateProductSeller(
                                    dataPost: dataPost,
                                  ),
                            ),
                          );
                        }

                        if (value == 'Delete') {
                          customShowModalBottomElevatedButton(
                              context, titleShowBottom: 'تاكيد الحذف',
                              titleButtonOne: 'حذف',
                              titleButtonTwo: 'الغاء',
                              onPressedButtonOne: (){
                                List<ProductImagesData> images = dataPost.productImages!.productImagesData ?? [];
                                if (images.isEmpty) {
                                  cubit
                                      .deleteProductSeller(
                                    images: images,
                                      productId: dataPost.idProduct!,
                                      imageName: dataPost.imageProduct ?? '')
                                      .whenComplete(() {
                                    PostSellerCubit.get(context).fetchPostOfSeller(
                                        sellerId: CacheData.getData(key: StringCache.idSeller));
                                  });
                                } else if (images.isNotEmpty) {

                                    cubit.deleteProductSeller(
                                      images: images,
                                        productId: dataPost.idProduct!,
                                        imageName: dataPost.imageProduct ?? '');

                                }
                                Navigator.pop(context);
                              },
                              onPressedButtonTwo: () => Navigator.pop(context));

                        }
                      },
                    ),
                  ],
                ),
              ),

              // Text(dataPost.startProduct.toString().substring(12,16)),
            ],
          ),
        ),
      ),
    );
  }
}
