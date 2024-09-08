part of 'hiraj_cubit.dart';

@immutable
abstract class HirajState {}

class HirajInitial extends HirajState {}
class HirajLoading extends HirajState {}

class HirajFailure extends HirajState {
  final String errorMessage;

  HirajFailure(this.errorMessage);
}

class HirajSuccess extends HirajState {
  final HirajModel hirajModel;

  HirajSuccess({required this.hirajModel});
}
class RatingLoading extends HirajState {}

class RatingFailure extends HirajState {
  final String errorMessage;

  RatingFailure(this.errorMessage);
}

class RatingSuccess extends HirajState {
  final RatingProduct ratingProduct;

  RatingSuccess({required this.ratingProduct});
}


class FavoriteProductsLoading extends HirajState {}

class FavoriteProductsFailure extends HirajState {
  final String errorMessage;

  FavoriteProductsFailure(this.errorMessage);
}

class FavoriteProductsSuccess extends HirajState {
  final FavoriteProducts favoriteProducts;

  FavoriteProductsSuccess({required this.favoriteProducts});
}