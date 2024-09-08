part of 'check_seller_cubit.dart';

@immutable
sealed class CheckSellerState {}

final class CheckSellerInitial extends CheckSellerState {}
class SellerHomeLoading extends CheckSellerState {}
class SellerHomeFailure extends CheckSellerState {
  final String errorMessage;

  SellerHomeFailure(this.errorMessage);
}
class SellerHomeSuccess extends CheckSellerState {
  final SellerModelHome sellerData;

  SellerHomeSuccess({required this.sellerData});
}
