import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';


abstract class SettingShopRepo {
  Future<Either<Failure, AddShopInDatabaseModel>> changeStatusShop({required int idShop});



}
