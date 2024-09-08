part of 'add_post_seller_cubit.dart';

@immutable
sealed class AddPostSellerState {}

final class AddPostSellerInitial extends AddPostSellerState {}
final class AddPostSellerLoading extends AddPostSellerState {}
final class AddPostSellerSuccess extends AddPostSellerState {
final ProductsModel productsModel;
AddPostSellerSuccess({required this.productsModel});
}
final class AddPostSellerFailure extends AddPostSellerState {}
