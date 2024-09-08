part of 'auth_shop_cubit.dart';

@immutable
sealed class AuthShopState {}

final class AuthShopInitial extends AuthShopState {}
class AuthShopLoading extends AuthShopState {}
class AuthShopFailure extends AuthShopState {
  final String errorMessage;

  AuthShopFailure(this.errorMessage);
}
class AuthShopSuccess extends AuthShopState {
  final AddShopInDatabaseModel shopsModel;
  AuthShopSuccess({required this.shopsModel});
}

class ShopParentLoading extends AuthShopState {}
class ShopParentFailure extends AuthShopState {
  final String errorMessage;

  ShopParentFailure(this.errorMessage);
}
class ShopParentSuccess extends AuthShopState {
  final ParentModel parentModel;
  ShopParentSuccess({required this.parentModel});
}

class AddShopLoading extends AuthShopState {}
class AddShopFailure extends AuthShopState {
  final String errorMessage;

  AddShopFailure(this.errorMessage);
}
class AddShopSuccess extends AuthShopState {
  final AddShopInDatabaseModel shopDataModel;
  AddShopSuccess({required this.shopDataModel});
}