part of 'seller_full_active_cubit.dart';

@immutable
sealed class SellerFullActiveState {}

final class SellerFullActiveInitial extends SellerFullActiveState {}
class SellerFullActiveLoading extends SellerFullActiveState {}
class SellerFullActiveFailure extends SellerFullActiveState {
  final String errorMessage;

  SellerFullActiveFailure(this.errorMessage);
}
class SellerFullActiveSuccess extends SellerFullActiveState {
  final SellerModelHome sellerData;

  SellerFullActiveSuccess({required this.sellerData});
}