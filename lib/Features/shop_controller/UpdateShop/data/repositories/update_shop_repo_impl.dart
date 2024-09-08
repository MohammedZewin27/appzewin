import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/data/models/add_shop_database.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/data/models/information_model.dart';
import 'package:sahel_net/Features/shop_controller/UpdateShop/data/repositories/update_shop_repo.dart';
import 'package:sahel_net/core/error/failures.dart';

import '../../../core_shop/api/api_shop.dart';

class UpdateShopRepoImpl implements UpdateShopRepo {
  UpdateShopRepoImpl(this.apiShop);

  final ApiShop apiShop;

  @override
  Future<Either<Failure, AddShopInDatabaseModel>> updateShop(
      {required int shopId,
      required String shopPhone,
      required String shopAddress,
      required String shopInformation,
      required String oldShopImage,
      File? newImageShop}) async {
    try {
      var data = await apiShop.upDateShopUser(
        shopId: shopId,
        shopPhone: shopPhone,
        shopInformation: shopInformation,
        shopAddress: shopAddress,
        newImageShop: newImageShop,
        oldShopImage: oldShopImage,
        endPoint: 'appView/shop/updateShop.php',
      );

      AddShopInDatabaseModel updateUserShop =
          AddShopInDatabaseModel.fromJson(data);
      print("===========updateUserShop==================$data");
      return right(updateUserShop);
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
  Future<Either<Failure, DeleteShopImage>> deletePhotoShop(
      {required int imageId, required String imageShop}) async {
    try {
      var data = await apiShop.deleteImagesShopUser(
        imageId: imageId,
        imageShop: imageShop,
        endPoint: 'category/services_shop/image/delete_image.php',
      );

      DeleteShopImage shopImagesUser = DeleteShopImage.fromJson(data);
      print("===========DeleteShopImage==================$data");
      return right(shopImagesUser);
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
  Future<Either<Failure, DeleteShopImage>> addPhotoShop(
      {required int shopId, File? shopImage}) async {
    try {
      var data = await apiShop.addImagesShopUser(
        shopId: shopId,
        shopImage: shopImage,
        endPoint: 'category/services_shop/image/add_image.php',
      );

      DeleteShopImage shopImagesUser = DeleteShopImage.fromJson(data);
      print("===========addImage==================$data");
      return right(shopImagesUser);
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
  Future<Either<Failure, AddServicesShopModel>> addServicesShop(
      {required String shopServices, required int shopId}) async {
    try {
      var data = await apiShop.addServicesShopUser(
        shopId: shopId,
        shopServices: shopServices,
        endPoint: 'category/services_shop/services/add_services.php',
      );

      AddServicesShopModel shopImagesUser = AddServicesShopModel.fromJson(data);
      print("===========addImage==================$data");
      return right(shopImagesUser);
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
  Future<Either<Failure, AddServicesShopModel>> deleteServicesShop(
      {required int servicesId}) async{
    try {
      var data = await apiShop.deleteServicesShopUser(
       servicesId: servicesId,
        endPoint: 'category/services_shop/services/delete_services.php',
      );

      AddServicesShopModel shopImagesUser = AddServicesShopModel.fromJson(data);
      print("===========addImage==================$data");
      return right(shopImagesUser);
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
