import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../seller_post/data/models/post_seller_model.dart';
import '../models/producte_model.dart';


abstract class AddProductRepo {
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
        required File image});
  Future<Either<Failure, ImagesAddModel>> addImagesPostSeller(
      {required int productId, required File? newImageProduct});

}
