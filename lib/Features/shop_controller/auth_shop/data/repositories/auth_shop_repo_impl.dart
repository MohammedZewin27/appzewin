import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sahel_net/Features/parent/data/models/parent_model.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/data/models/shop_user_model.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';
import 'package:sahel_net/core/error/failures.dart';


import '../models/add_shop_database.dart';
import 'auth_shop_repo.dart';

class AuthShopRepoImpl implements AuthShopRepo {
  AuthShopRepoImpl(this.apiShop);

  final ApiShop apiShop;

  @override
  Future<Either<Failure, AddShopInDatabaseModel>> getShopWithCodAndPassword(
      {required String shopCode, required String shopPassword}) async {
    try {
      var data = await apiShop.getShopUser(
        shopCode: shopCode,
        shopPassword: shopPassword,
        endPoint: 'appView/shop/view_shop.php',
      );
      AddShopInDatabaseModel shopsModel = AddShopInDatabaseModel.fromJson(data);
      print("=============================$data");
      return right(shopsModel);
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
  Future<Either<Failure, ParentModel>> fetchParent() async {
    try {
      var data = await apiShop.get(
        endPoint: 'appView/view_parent.php',
      );

      ParentModel parentModel = ParentModel.fromJson(data);
      print("=============================$data");
      return right(parentModel);
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
  Future<Either<Failure, ShopCategoryModel>> fetchShopCategory(
      {int? parentId}) async {
    try {
      var data = await apiShop.getCategory(
        parentId: parentId,
        endPoint: 'category/categories/viewCategory.php',
      );

      ShopCategoryModel shopCategoryModel = ShopCategoryModel.fromJson(data);
      print("=============================$data");
      return right(shopCategoryModel);
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
  Future<Either<Failure, ShopSubCategoryModel>> fetchShopSubCategory(
      {int? categoriesId}) async {
    try {
      var data = await apiShop.getSubCategory(
        categoriesId: categoriesId,
        endPoint: 'category/sub_category/viewSubCategories.php',
      );

      ShopSubCategoryModel shopSubCategoryModel =
          ShopSubCategoryModel.fromJson(data);
      print("=============================$data");
      return right(shopSubCategoryModel);
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
  Future<Either<Failure, AddShopInDatabaseModel>> addShop(
      {required String shopName,
      required String shopPhone,
      required String shopAddress,
      required String shopInformation,
      required String shopTimeEnd,
      required int? shopStatus,
      required String subCategoriesId,
      required String passwordShop,
      required String shopLocation,
      required int? parentId,
      required File imageProduct}) async {
    try {
      var data = await apiShop.addShopUser(
        shopLocation:shopLocation ,
        imageProduct: imageProduct,

        parentId: parentId,
        shopAddress: shopAddress,
        shopInformation: shopInformation,
        shopName: shopName,
        shopPhone: shopPhone,
        passwordShop: passwordShop,
        shopStatus: shopStatus,
        shopTimeEnd: shopTimeEnd,
        subCategoriesId: subCategoriesId,
        endPoint: 'appView/shop/addNewShop.php',
      );

      AddShopInDatabaseModel shopDataModel = AddShopInDatabaseModel.fromJson(data);
      print("=============================$data");
      return right(shopDataModel);
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
  Future<Either<Failure, AddShopInDatabaseModel>> getShopWithId(
      {required int idShop}) async {
    try {
      var data = await apiShop.getWithIdShop(
        shopId: idShop,
        endPoint: 'appView/shop/viewShopWithId.php',
      );

      AddShopInDatabaseModel shopDataModel =
      AddShopInDatabaseModel.fromJson(data);
      print("===========5555555555==================$data");
      return right(shopDataModel);
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
