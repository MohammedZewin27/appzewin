import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

import '../../../hiraj/data/models/hiraj_model.dart';
import '../models/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> fetchCategories(int parentId,
      {required int userid});

  Future<Either<Failure, RatingShop>> addRatingShop(
      {required int userid, required int shopId, required double ratingValue});

  Future<Either<Failure, FavoriteProducts>> favoriteShop(
      {required int userid, required int shopId, required int idParent});
  Future <Either<Failure, FavoriteProducts>> favoriteProducts({ required int userid,
    required int idParent,
    required int productId,
  });

  Future<Either<Failure, Shops>> getShopsByRating(
      { required int idParent});

}
