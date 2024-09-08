import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';

import 'package:sahel_net/core/error/failures.dart';


import '../../../auth_shop/data/models/add_shop_database.dart';
import 'setting_shop_repo.dart';

class SettingShopRepoImpl implements SettingShopRepo {
  SettingShopRepoImpl(this.apiShop);

  final ApiShop apiShop;

  @override
  Future<Either<Failure, AddShopInDatabaseModel>> changeStatusShop(
      {required int idShop}) async {
    try {
      var data = await apiShop.changeStatusShop(
        shopId: idShop,
        endPoint: 'appView/shop/changeStatusShop.php',
      );

      AddShopInDatabaseModel shopData = AddShopInDatabaseModel.fromJson(data);
      print("===========delete shop user==================$data");
      return right(shopData);
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
