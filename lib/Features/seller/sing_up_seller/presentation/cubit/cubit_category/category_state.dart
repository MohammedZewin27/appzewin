part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategoryFailure extends CategoryState {
  final String errorMessage;

  CategoryFailure(this.errorMessage);
}
class CategorySuccess extends CategoryState {
  final SellerCategoryModel sellerCategoryModel;

  CategorySuccess({required this.sellerCategoryModel});
}
