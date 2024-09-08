

part of 'category_shop_cubit.dart';

@immutable
sealed class CategoryShopState {}

final class CategoryShopInitial extends CategoryShopState {}
class CategoryShopLoading extends CategoryShopState {}
class CategoryShopFailure extends CategoryShopState {
  final String errorMessage;

  CategoryShopFailure(this.errorMessage);
}
class CategoryShopSuccess extends CategoryShopState {
  final ShopCategoryModel shopCategoryModel;

  CategoryShopSuccess({required this.shopCategoryModel});
}
