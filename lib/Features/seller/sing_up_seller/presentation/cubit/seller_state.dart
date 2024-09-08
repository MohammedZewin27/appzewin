part of 'seller_cubit.dart';

@immutable
sealed class SellerState {}

final class SellerInitial extends SellerState {}
class SellerLoading extends SellerState {}
class SellerFailure extends SellerState {
  final String errorMessage;

  SellerFailure(this.errorMessage);
}
class SellerSuccess extends SellerState {
  final ParentModel parentModel;

  SellerSuccess({required this.parentModel});
}

class AddSellerLoading extends SellerState {}
class AddSellerFailure extends SellerState {
  final String errorMessage;

  AddSellerFailure(this.errorMessage);
}
class AddSellerSuccess extends SellerState {
  final SellerModel sellerData;

  AddSellerSuccess({required this.sellerData});
}
