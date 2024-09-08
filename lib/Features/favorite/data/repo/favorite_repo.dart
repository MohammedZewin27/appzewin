





import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/favorite_model.dart';


abstract class FavoriteRepo {
  Future<Either<Failure, FavoriteModel>> fetchFavorite({required int userid,required int parentId});
  Future<Either<Failure, FavoriteDelete>> favoriteProductDelete({required int userid,required int productId});
  Future<Either<Failure, FavoriteDelete>> favoriteSellerDelete({required int userid,required int sellerId});
  Future<Either<Failure, FavoriteDelete>> favoriteShopDelete({required int userid,required int shopId});

}