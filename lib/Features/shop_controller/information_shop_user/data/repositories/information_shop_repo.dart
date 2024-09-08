import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../models/information_model.dart';

abstract class InformationShopRepo {
  Future<Either<Failure, ShopImagesUser>> fetchPhotoShop({required int idShop});
  Future<Either<Failure, ServicesShowShopModel>> showServicesShop({ required int shopId,});


}
