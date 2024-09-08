import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/seller/core/api/api_service_seller.dart';
import 'package:sahel_net/Features/seller/seller_post/data/models/post_seller_model.dart';
import 'package:sahel_net/core/error/failures.dart';
import '../../../seller_analysis/data/models/analysis_product_model.dart';
import 'post_seller_repo.dart';

class PostSellerRepoImpl implements PostSellerRepo {
  PostSellerRepoImpl(this.apiService);

  final ApiServiceSeller apiService;

  @override
  Future<Either<Failure, PostSellerModel>> getPostSeller(
      {required int? sellerId}) async {
    try {
      var data = await apiService.getPostSeller(
        endPoint: 'hiraj/post_seller/post_seller_view.php',
        idSeller: sellerId,
      );
      PostSellerModel postSellerModel = PostSellerModel.fromJson(data);
      print("=============================$data");
      return right(postSellerModel);
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

  // @override
  // Future<Either<Failure, ImagesProductModel>> getImagesPostSeller(
  //     {required int? productId}) async {
  //   try {
  //     var data = await apiService.getImagesPostSeller(
  //         endPoint: 'hiraj/post_seller/view_product_images.php',
  //         productId: productId);
  //     ImagesProductModel imagesProductModel = ImagesProductModel.fromJson(data);
  //     print("=============================$data");
  //     return right(imagesProductModel);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }

  @override
  Future<Either<Failure, UpdateProduct>> updatePostSeller({
    required String titleProduct,
    required String detailsProduct,
    required String newPriceProduct,
    required String oldPriceProduct,
    required String qualityProduct,
    required String deliveryService,
    required String statusProduct,
    required String oldImage,
    required int idSellerProduct,
    File? newImageProduct,
  }) async {
    try {
      var data = await apiService.updateProduct(
        deliveryService: deliveryService,
        detailsProduct: detailsProduct,
        endPoint: 'hiraj/post_seller/update_post.php',
        idSellerProduct: idSellerProduct,
        newPriceProduct: newPriceProduct,
        oldImage: oldImage,
        oldPriceProduct: oldPriceProduct,
        qualityProduct: qualityProduct,
        statusProduct: statusProduct,
        titleProduct: titleProduct,
        newImage: newImageProduct,
      );
      UpdateProduct updateProduct = UpdateProduct.fromJson(data);
      print("=============================$data");
      return right(updateProduct);
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
      var data = await apiService.addImagesProduct(
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

  @override
  Future<Either<Failure, ImagesAddModel>> deleteFromMoreImages(
      {required String imageId, required String imageName}) async {
    try {
      var data = await apiService.deleteImageFromMoreImages(
        endPoint: 'hiraj/product_images/delete_image.php',
        imageId: imageId,
        imageName: imageName,
        parameterImageId: 'product_image_id',
        parameterImageName: 'image_name',
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

  @override
  Future<Either<Failure, PostSellerModel>> deleteProduct(
      {required String productId, required String imageName}) async {
    try {
      var data = await apiService.deleteProductFromSeller(
        endPoint: 'hiraj/products_seller/delete_products.php',
        productId: productId,
        imageName: imageName,
        parameterProductId: 'id_product',
        parameterImageName: 'image_name',
      );
      PostSellerModel postSellerModel = PostSellerModel.fromJson(data);
      print("=============================$data");
      return right(postSellerModel);
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
  Future<Either<Failure, AnalysisProductModel>> getFullAnalysisProduct(
      {required int idProduct}) async {
    try {
      var result = await apiService.getFullAnalysisProduct(
        productId: idProduct,
        endPoint: 'appView/analysis_products/full_analysis_product.php',
      );
      AnalysisProductModel analysisProductModel =
      AnalysisProductModel.fromJson(result);
      print("=============================$result");
      return right(analysisProductModel);
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

}
