import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/hiraj/data/models/hiraj_model.dart';

import '../../../../core/error/failures.dart';

import '../../../../core/utils/api/api_service.dart';

import '../models/home_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.apiService);

  final ApiService apiService;

  ///fetchCategories
  @override
  Future<Either<Failure, HomeModel>> fetchCategories(int parentId,
      {required int userid}) async {
    try {
      var data = await apiService.getWithParentId(
          userid: userid, endPoint: 'appView/home.php', parentId: parentId);
      HomeModel categoriesModel = HomeModel.fromJson(data);

      return right(categoriesModel);
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
  Future<Either<Failure, RatingShop>> addRatingShop(
      {required int userid,
      required int shopId,
      required double ratingValue}) async {
    try {
      var data = await apiService.shopRating(
        shopId: shopId,
        ratingValue: ratingValue,
        userid: userid,
        endPoint: 'appView/rating/rating_shop.php',
      );
      RatingShop ratingShop = RatingShop.fromJson(data);

      return right(ratingShop);
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
  Future<Either<Failure, FavoriteProducts>> favoriteShop(
      {required int userid, required int shopId, required int idParent}) async {
    try {
      var data = await apiService.favoriteShop(
        idParent: idParent,
        shopId: shopId,
        userid: userid,
        endPoint: 'appView/favorite/favorite_shop.php',
      );
      FavoriteProducts favoriteProducts = FavoriteProducts.fromJson(data);

      return right(favoriteProducts);
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
  Future<Either<Failure, Shops>> getShopsByRating(
      {required int idParent}) async {
    try {
      var data = await apiService.getMaxRating(
        parentId: idParent,
        parameter: 'parent_id',
        endPoint: 'appView/rating/getMaxRatingShops.php',
      );
      Shops shops = Shops.fromJson(data);

      return right(shops);
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
  Future<Either<Failure, FavoriteProducts>>  favoriteProducts(
      {required int userid, required int idParent, required int productId}) async{

    try {
      var data = await apiService.favoriteProducts(
        idParent: idParent,
        productId: productId,
        userid: userid,
        endPoint: 'appView/favorite/favorite_products.php',
      );
      FavoriteProducts favoriteProducts = FavoriteProducts.fromJson(data);

      return right(favoriteProducts);
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
