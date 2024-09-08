





import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/hiraj_model.dart';

abstract class HirajRepo {
  Future<Either<Failure, HirajModel>> fetchHiraj(int idParent);
  Future<Either<Failure, RatingProduct>> addRatingProduct({ required int userid,
    required int productId,
    required double ratingValue});
  Future<Either<Failure, RatingProduct>> addRatingSeller({ required int userid,
    required int sellerId,
    required double ratingValue});
  Future<Either<Failure, FavoriteProducts>> favoriteProducts({ required int userid,
    required int idParent,
    required int productId,
   });
  Future<Either<Failure, FavoriteProducts>> favoriteSeller({
    required int userid,
    required int sellerId,
    required int idParent,

  });
}