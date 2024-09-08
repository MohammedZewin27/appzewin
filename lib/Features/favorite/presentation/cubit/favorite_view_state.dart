part of 'favorite_view_cubit.dart';

@immutable
sealed class FavoriteViewState {}

final class FavoriteViewInitial extends FavoriteViewState {}
class FavoriteViewLoading extends FavoriteViewState {}

class FavoriteViewFailure extends FavoriteViewState {
  final String errorMessage;

  FavoriteViewFailure(this.errorMessage);
}

class FavoriteViewSuccess extends FavoriteViewState {
  final FavoriteModel favoriteView;

  FavoriteViewSuccess({required this.favoriteView});
}

class FavoriteDeleteLoading extends FavoriteViewState {}

class FavoriteDeleteFailure extends FavoriteViewState {
  final String errorMessage;

  FavoriteDeleteFailure(this.errorMessage);
}

class FavoriteDeleteSuccess extends FavoriteViewState {
  final FavoriteDelete favoriteDelete;

  FavoriteDeleteSuccess({required this.favoriteDelete});
}
