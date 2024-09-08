import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/favorite/data/models/favorite_model.dart';


import 'package:sahel_net/core/error/failures.dart';

import '../../../../core/utils/api/api_service.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  FavoriteRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, FavoriteModel>> fetchFavorite(
      {required int userid, required int parentId}) async {
    try {
      var data = await apiService.favoriteView(
        parentId: parentId,
        userid: userid,
        endPoint: 'appView/favorite/viewFavoriteUser.php',
      );
      FavoriteModel favoriteModel = FavoriteModel.fromJson(data);

      return right(favoriteModel);
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
  Future<Either<Failure, FavoriteDelete>> favoriteProductDelete(
      {required int userid, required int productId}) async {
    try {
      var data = await apiService.favoriteDelete(
        prametarId: 'productid',
        sellerIdOrShopOrProduct: productId,
        userid: userid,
        endPoint: 'appView/favorite/favorite_products_delete.php',
      );
      FavoriteDelete favoriteDelete = FavoriteDelete.fromJson(data);

      return right(favoriteDelete);
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
  Future<Either<Failure, FavoriteDelete>> favoriteSellerDelete(
      {required int userid, required int sellerId}) async {
    try {
      var data = await apiService.favoriteDelete(
        prametarId: 'sellerid',
        sellerIdOrShopOrProduct: sellerId,
        userid: userid,
        endPoint: 'appView/favorite/favorite_seller_delete.php',
      );
      FavoriteDelete favoriteDelete = FavoriteDelete.fromJson(data);

      return right(favoriteDelete);
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
  Future<Either<Failure, FavoriteDelete>> favoriteShopDelete(
      {required int userid, required int shopId}) async {
    try {
      var data = await apiService.favoriteDelete(
        prametarId: 'shopid',
        sellerIdOrShopOrProduct: shopId,
        userid: userid,
        endPoint: 'appView/favorite/favorite_shop_delete.php',
      );
      FavoriteDelete favoriteDelete = FavoriteDelete.fromJson(data);

      return right(favoriteDelete);
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
