part of 'shop_active_cubit.dart';

@immutable
sealed class ShopActiveState {}

final class ShopActiveInitial extends ShopActiveState {}
class ShopActiveLoading extends ShopActiveState {}
class ShopActiveFailure extends ShopActiveState {
  final String errorMessage;

  ShopActiveFailure(this.errorMessage);
}
class ShopActiveSuccess extends ShopActiveState {
  final AddShopInDatabaseModel shopDataModel;

  ShopActiveSuccess({required this.shopDataModel});
}