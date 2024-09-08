part of 'sub_category_shop_cubit.dart';

@immutable
sealed class SubCategoryShopState {}

final class SubCategoryShopInitial extends SubCategoryShopState {}
class SubCategoryShopLoading extends SubCategoryShopState {}
class SubCategoryShopFailure extends SubCategoryShopState {
  final String errorMessage;

  SubCategoryShopFailure(this.errorMessage);
}
class SubCategoryShopSuccess extends SubCategoryShopState {
  final ShopSubCategoryModel shopSubCategoryModel;

  SubCategoryShopSuccess({required this.shopSubCategoryModel});
}
