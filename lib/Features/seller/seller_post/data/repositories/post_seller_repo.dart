import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../seller_analysis/data/models/analysis_product_model.dart';
import '../models/post_seller_model.dart';

abstract class PostSellerRepo {
  Future<Either<Failure, PostSellerModel>> getPostSeller(
      {required int? sellerId});

  // Future<Either<Failure, ImagesProductModel>> getImagesPostSeller(
  //     {required int? productId});

  Future<Either<Failure, ImagesAddModel>> addImagesPostSeller(
      {required int productId, required File? newImageProduct});

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
  });
  Future<Either<Failure, ImagesAddModel>> deleteFromMoreImages({
    required String imageId,
    required String imageName,
  });
  Future<Either<Failure, PostSellerModel>> deleteProduct({
    required String productId,
    required String imageName,
  });
  Future<Either<Failure,AnalysisProductModel>>  getFullAnalysisProduct({required int idProduct});



}
