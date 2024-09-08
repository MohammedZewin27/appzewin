import 'dart:io';

import 'package:dartz/dartz.dart';


import '../../../../../core/error/failures.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../models/seller_model.dart';

abstract class SellerRepo {
  Future<Either<Failure, ParentModel>> fetchParent();

  Future<Either<Failure, SellerCategoryModel>> fetchCategory({int? parentId});
  Future<Either<Failure, SellerModelHome>> fetchSellerWithId({int? idSeller});

  Future<Either<Failure, SellerModel>> addSellerHiraj({
    required String sellerName,
    required String locationSeller,
    required String phoneSeller,
    required String endSeller,
    required String passwordSelle,
    required File logoSeller,
    required int status,
    required int hirajId,
    required int parentId,
    required String addressSeller,
  });
}
