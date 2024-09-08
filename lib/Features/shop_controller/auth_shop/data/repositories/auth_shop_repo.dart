import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';


import '../../../../parent/data/models/parent_model.dart';

import '../models/add_shop_database.dart';
import '../models/shop_user_model.dart';




abstract class AuthShopRepo {
  Future<Either<Failure, ParentModel>> fetchParent();
  Future<Either<Failure, ShopCategoryModel>> fetchShopCategory({int? parentId});
  Future<Either<Failure, ShopSubCategoryModel>> fetchShopSubCategory({int? categoriesId});
  Future<Either<Failure, AddShopInDatabaseModel>> addShop({   required String shopName,
    required String shopLocation,
    required String shopPhone,
    required String shopAddress,
    required String shopInformation,
    required String shopTimeEnd,
    required int? shopStatus,
    required String subCategoriesId,
    required String passwordShop,
    required int? parentId,
    required File imageProduct,});
  Future<Either<Failure, AddShopInDatabaseModel>> getShopWithCodAndPassword(
      {required String shopCode,required String shopPassword});
  Future<Either<Failure, AddShopInDatabaseModel>> getShopWithId(
      {required int idShop});

}
