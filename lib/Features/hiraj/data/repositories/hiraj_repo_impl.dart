import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sahel_net/Features/hiraj/data/models/hiraj_model.dart';

import 'package:sahel_net/core/error/failures.dart';

import '../../../../core/utils/api/api_service.dart';
import '../../../../core/utils/cash_data.dart';
import 'hiraj_repo.dart';

class HirajRepoImpl implements HirajRepo {
  HirajRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, HirajModel>> fetchHiraj(int idParent) async {
    try {
      var data = await apiService.getWithParentId(
          userid: CacheData.getData(key: StringCache.userId),
          endPoint: 'appView/hirajAll/hiraj.php', parentId: idParent);
      HirajModel categoriesModel = HirajModel.fromJson(data);

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
  Future<Either<Failure, RatingProduct>> addRatingProduct(
      {required int userid,
      required int productId,
      required double ratingValue}) async {
    try {
      var data = await apiService.productRating(
        productId: productId,
        ratingValue: ratingValue,
        userid: userid,
        endPoint: 'appView/rating/rating_products.php',
      );
      RatingProduct ratingProduct = RatingProduct.fromJson(data);

      return right(ratingProduct);
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
  Future<Either<Failure, RatingProduct>> addRatingSeller(
      {required int userid,
      required int sellerId,
      required double ratingValue}) async {
    try {
      var data = await apiService.sellerRating(
        sellerId: sellerId,
        ratingValue: ratingValue,
        userid: userid,
        endPoint: 'appView/rating/rating_seller.php',
      );
      RatingProduct ratingProduct = RatingProduct.fromJson(data);

      return right(ratingProduct);
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
  Future<Either<Failure, FavoriteProducts>> favoriteProducts({
    required int userid,
    required int productId,
    required int idParent,
  }) async {
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

  @override
  Future<Either<Failure, FavoriteProducts>> favoriteSeller({
    required int userid,
    required int sellerId,
    required int idParent,
  }) async {
    try {
      var data = await apiService.favoriteSeller(
       idParent:idParent ,
        sellerId: sellerId,
        userid: userid,
        endPoint: 'appView/favorite/favorite_seller.php',
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
