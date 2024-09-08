part of 'up_date_shop_cubit.dart';

@immutable
sealed class UpDateShopState {}

final class UpDateShopInitial extends UpDateShopState {}
final class UpdateShopLoading extends UpDateShopState {}
final class UpdateShopFailure extends UpDateShopState {
  final String errorMessage;

  UpdateShopFailure(this.errorMessage);
}
class UpdateShopSuccess extends UpDateShopState {
  final AddShopInDatabaseModel updateShop;
  UpdateShopSuccess({required this.updateShop});
}