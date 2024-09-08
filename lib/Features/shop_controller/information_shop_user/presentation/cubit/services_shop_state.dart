part of 'services_shop_cubit.dart';

@immutable
sealed class ServicesShopState {}

final class ServicesShopInitial extends ServicesShopState {}
final class ServicesShopLoading extends ServicesShopState {}
class ServicesShopFailure extends ServicesShopState {
  final String errorMessage;

  ServicesShopFailure(this.errorMessage);
}
class ServicesShopSuccess extends ServicesShopState {
  final ServicesShowShopModel servicesShowShopModel;

  ServicesShopSuccess({required this.servicesShowShopModel});
}