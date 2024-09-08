import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/seller/seller_post/data/models/post_seller_model.dart';

import 'package:sahel_net/core/error/failures.dart';

import '../../../core/api/api_service_seller.dart';
import '../models/producte_model.dart';
import 'add_post_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  AddProductRepoImpl(this.apiServiceSeller);

  final ApiServiceSeller apiServiceSeller;

  @override
  Future<Either<Failure, ProductsModel>> addProduct(
      {required int sellerId,
      required int parentId,
      required String titleProduct,
      required String detailsProduct,
      required String newPriceProduct,
      required String oldPriceProduct,
      required String qualityProduct,
      required String deliveryService,
      required String statusProduct,
      required String endProduct,
      required String ratingProduct,
      required File image})async {
    try {
      var data = await apiServiceSeller.addProduct(
        parameterParentId: 'parent_id',
        parentId: parentId,
        ratingProduct: ratingProduct,
        imageProduct: image,
        detailsProduct: detailsProduct,
        titleProduct: titleProduct,
        deliveryService: deliveryService,
        endProduct: endProduct,
        idSellerProduct: sellerId,
        newPriceProduct: newPriceProduct,
        oldPriceProduct: oldPriceProduct,
        qualityProduct: qualityProduct,
        statusProduct: statusProduct,
        parameterDeliveryService: 'delivery_service',
        parameterDetailsProduct: 'details_product',
        parameterEndProduct: 'end_product',
        parameterImageProduct: 'image_product',
        parameterIdSellerProduct: 'id_seller_product',
        parameterNewPriceProduct: 'new_price_product',
        parameterOldPriceProduct: 'old_price_product',
        parameterQualityProduct: 'quality_product',
        parameterRatingProduct: 'rating_product',
        parameterStatusProduct: 'status_product',
        parameterTitleProduct: 'title_product',
        endPoint: 'hiraj/products_seller/add_products.php',
      );

      ProductsModel dataProductsSeller = ProductsModel.fromJson(data);
      return right(dataProductsSeller);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, ImagesAddModel>> addImagesPostSeller(
      {required int productId, required File? newImageProduct}) async {
    try {
      var data = await apiServiceSeller.addImagesProduct(
        endPoint: 'hiraj/product_images/add_image.php',
        productId: productId,
        imageProduct: newImageProduct,
        parameterImageProduct: 'product_imageUrl',
        parameterProductId: 'product_id',
      );
      ImagesAddModel imagesAddModel = ImagesAddModel.fromJson(data);
      print("=============================$data");
      return right(imagesAddModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  ///fetchCategories
}
