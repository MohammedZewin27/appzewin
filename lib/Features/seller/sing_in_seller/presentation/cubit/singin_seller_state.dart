part of 'singin_seller_cubit.dart';

@immutable
sealed class SingInSellerState {}

final class SingInSellerInitial extends SingInSellerState {}
class SingInSellerLoading extends SingInSellerState {}
class SingInSellerFailure extends SingInSellerState {
  final String errorMessage;
  SingInSellerFailure(this.errorMessage);
}
class SingInSellerSuccess extends SingInSellerState {
  final SellerModelHome sellerModel;

  SingInSellerSuccess({required this.sellerModel});
}
