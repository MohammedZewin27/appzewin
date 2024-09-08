import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/cash_data.dart';
import '../../data/models/favorite_model.dart';
import '../../data/repo/favorite_repo.dart';

part 'favorite_view_state.dart';

class FavoriteViewCubit extends Cubit<FavoriteViewState> {
  FavoriteViewCubit(this.favoriteRepo) : super(FavoriteViewInitial());

  final FavoriteRepo favoriteRepo;

  static FavoriteViewCubit get(context) => BlocProvider.of(context);

  Future<void> fetchFavoriteView({required int parentId}) async {
    print('//////////////////////////////////////');
    // print(ParentCubit.get(context).parentId);
    print('//////////////*************////////////////////////');
    print(CacheData.getData(key: StringCache.userId));
    print('//////////////////////////////////////');
    emit(FavoriteViewLoading());
    var result = await favoriteRepo.fetchFavorite(
        parentId:parentId,
        userid: CacheData.getData(key: StringCache.userId));

    result.fold(
      (failure) {
        emit(FavoriteViewFailure(failure.errorMessage));
      },
      (favoriteView) {
        emit(FavoriteViewSuccess(favoriteView: favoriteView));

      },
    );
  }





  /// deleteFavorite
  Future<void> deleteProductFavorite({required int productId,required int parentId}) async {
    emit(FavoriteDeleteLoading());
    var result = await favoriteRepo.favoriteProductDelete(
        productId: productId,
        userid: CacheData.getData(key: StringCache.userId));

    result.fold(
      (failure) {
        emit(FavoriteDeleteFailure(failure.errorMessage));
      },
      (favoriteDelete) {
        emit(FavoriteDeleteSuccess(favoriteDelete: favoriteDelete));
        fetchFavoriteView(parentId: parentId);
      },
    );
  }
  Future<void> deleteSellerFavorite({required int sellerId,required int parentId}) async {
    emit(FavoriteDeleteLoading());
    var result = await favoriteRepo.favoriteSellerDelete(
      sellerId:sellerId ,

        userid: CacheData.getData(key: StringCache.userId));

    result.fold(
      (failure) {
        emit(FavoriteDeleteFailure(failure.errorMessage));
      },
      (favoriteDelete) {
        emit(FavoriteDeleteSuccess(favoriteDelete: favoriteDelete));
        fetchFavoriteView(parentId: parentId);
      },
    );
  }
  Future<void> deleteShopFavorite({required int shopId,required int parentId}) async {
    emit(FavoriteDeleteLoading());
    var result = await favoriteRepo.favoriteShopDelete(
      shopId: shopId,

        userid: CacheData.getData(key: StringCache.userId));

    result.fold(
      (failure) {
        emit(FavoriteDeleteFailure(failure.errorMessage));
      },
      (favoriteDelete) {
        emit(FavoriteDeleteSuccess(favoriteDelete: favoriteDelete));
        fetchFavoriteView(parentId: parentId);
      },
    );
  }
}
