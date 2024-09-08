part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class AllCategoryLoading extends HomeState {}

class AllCategoryFailure extends HomeState {
  final String errorMessage;

  AllCategoryFailure(this.errorMessage);
}

class AllCategorySuccess extends HomeState {
  final HomeModel homeModel;

  AllCategorySuccess({required this.homeModel});
}

class RatingFailure extends HomeState {
  final String errorMessage;

  RatingFailure(this.errorMessage);
}

class RatingSuccess extends HomeState {
  final RatingShop ratingShop;

  RatingSuccess({required this.ratingShop});
}

class FavoriteShopLoading extends HomeState {}

class FavoriteShopFailure extends HomeState {
  final String errorMessage;

  FavoriteShopFailure(this.errorMessage);
}

class FavoriteShopSuccess extends HomeState {
  final FavoriteProducts favoriteShop;

  FavoriteShopSuccess({required this.favoriteShop});
}
class FavoriteProductLoading extends HomeState {}

class FavoriteProductFailure extends HomeState {
  final String errorMessage;

  FavoriteProductFailure(this.errorMessage);
}

class FavoriteProductSuccess extends HomeState {
  final FavoriteProducts favoriteProduct;

  FavoriteProductSuccess({required this.favoriteProduct});
}