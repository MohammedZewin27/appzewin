part of 'information_shop_cubit.dart';

@immutable
sealed class InformationShopState {}

final class InformationShopInitial extends InformationShopState {}
final class InformationShopLoading extends InformationShopState {}
class InformationShopFailure extends InformationShopState {
  final String errorMessage;

  InformationShopFailure(this.errorMessage);
}
class InformationShopSuccess extends InformationShopState {
  final ShopImagesUser shopImagesUser;
  InformationShopSuccess({required this.shopImagesUser});
}





