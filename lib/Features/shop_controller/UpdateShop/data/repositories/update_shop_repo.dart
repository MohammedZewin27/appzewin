import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../information_shop_user/data/models/information_model.dart';

abstract class UpdateShopRepo {
  Future<Either<Failure, AddShopInDatabaseModel>> updateShop({
    required int shopId,
    required String shopPhone,
    required String shopAddress,
    required String shopInformation,
    required String oldShopImage,
    File? newImageShop,
  });

  Future<Either<Failure, DeleteShopImage>> addPhotoShop({
    required int shopId,
    File? shopImage,
  });

  Future<Either<Failure, AddServicesShopModel>> addServicesShop({
    required String shopServices,
    required int shopId,
  });
  Future<Either<Failure, AddServicesShopModel>> deleteServicesShop({

    required int servicesId,
  });

  Future<Either<Failure, DeleteShopImage>> deletePhotoShop({
    required int imageId,
    required String imageShop,
  });
}
