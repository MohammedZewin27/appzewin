

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/data/models/information_model.dart';
import 'package:sahel_net/core/error/failures.dart';

import 'information_shop_repo.dart';

class InformationShopRepoImpl implements InformationShopRepo {
  InformationShopRepoImpl(this.apiShop);

  final ApiShop apiShop;

  @override
  Future<Either<Failure, ShopImagesUser>> fetchPhotoShop(
      {required int idShop}) async {
    try {
      var data = await apiShop.getImagesShopUser(
        shopId: idShop,
        endPoint: 'category/services_shop/image/view_images.php',
      );

      ShopImagesUser shopImagesUser = ShopImagesUser.fromJson(data);
      print("===========ShopImagesUser==================$data");
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
  Future<Either<Failure, ServicesShowShopModel>> showServicesShop(
      {required int shopId}) async {
    try {
      var data = await apiShop.getServicesShopUser(
        shopId: shopId,

        endPoint: 'category/services_shop/services/view_services.php',
      );

      ServicesShowShopModel servicesShowShopModel = ServicesShowShopModel.fromJson(data);
      print("===========servicesShowShopModel==================$data");
      return right(servicesShowShopModel);
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
