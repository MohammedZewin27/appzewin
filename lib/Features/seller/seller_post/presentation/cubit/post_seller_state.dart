part of 'post_seller_cubit.dart';

@immutable
sealed class PostSellerState {}

final class PostSellerInitial extends PostSellerState {}

final class PostSellerLoading extends PostSellerState {}

final class PostSellerFailure extends PostSellerState {
  final String errorMessage;

  PostSellerFailure(this.errorMessage);
}

final class PostSellerSuccess extends PostSellerState {
  final PostSellerModel postSellerModel;

  PostSellerSuccess({required this.postSellerModel});
}

final class UpdateSellerLoading extends PostSellerState {}

final class UpdateSellerFailure extends PostSellerState {
  final String errorMessage;

  UpdateSellerFailure(this.errorMessage);
}

final class UpdateSellerSuccess extends PostSellerState {
  final UpdateProduct updateProduct;

  UpdateSellerSuccess({required this.updateProduct});
}

final class AddImagesToProductLoading extends PostSellerState {}

final class AddImagesToProductFailure extends PostSellerState {
  final String errorMessage;

  AddImagesToProductFailure(this.errorMessage);
}

final class AddImagesToProductSuccess extends PostSellerState {
  final ImagesAddModel imagesAddModel;

  AddImagesToProductSuccess({required this.imagesAddModel});
}

final class DeleteImageFromMoreImageLoading extends PostSellerState {}

final class DeleteImageFromMoreImageFailure extends PostSellerState {
  final String errorMessage;

  DeleteImageFromMoreImageFailure(this.errorMessage);
}

final class DeleteImageFromMoreImageSuccess extends PostSellerState {

}