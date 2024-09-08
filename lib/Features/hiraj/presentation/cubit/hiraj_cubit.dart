import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../data/models/hiraj_model.dart';
import '../../data/repositories/hiraj_repo.dart';

part 'hiraj_state.dart';

class HirajCubit extends Cubit<HirajState> {
  HirajCubit(this.hirajRepo) : super(HirajInitial());

  final HirajRepo hirajRepo;

  static HirajCubit get(context) => BlocProvider.of(context);

  Future<void> fetchHiraj({required int idParent}) async {
    emit(HirajLoading());
    var result = await hirajRepo.fetchHiraj(idParent);

    result.fold(
      (failure) {
        emit(HirajFailure(failure.errorMessage));
      },
      (hirajModel) {
        emit(HirajSuccess(hirajModel: hirajModel));
      },
    );
  }
///     ratingProduct
  Future<void> ratingProduct(
      {required int userid,
      required int productId,
      required double ratingValue}) async {
    emit(HirajLoading());
    var result = await hirajRepo.addRatingProduct(
        userid: userid, productId: productId, ratingValue: ratingValue);

    result.fold(
      (failure) {
        emit(RatingFailure(failure.errorMessage));
      },
      (hirajModel) {
        emit(RatingSuccess(ratingProduct: hirajModel));
        fetchHiraj(idParent: CacheData.getData(key: StringCache.idParent));
      },
    );
  }
///       ratingSeller
  Future<void> ratingSeller(
      {required int userid,
      required int sellerId,
      required double ratingValue}) async {
    emit(HirajLoading());
    var result = await hirajRepo.addRatingSeller(
        sellerId: sellerId, userid: userid, ratingValue: ratingValue);
    result.fold(
      (failure) {
        emit(RatingFailure(failure.errorMessage));
      },
      (hirajModel) {
        emit(RatingSuccess(ratingProduct: hirajModel));
        fetchHiraj(idParent: CacheData.getData(key: StringCache.idParent));
      },
    );
  }

  /// favorite Products
  Future<void> favoriteProducts(
      {
        // required int userid,
        required int productId}) async {
    emit(HirajLoading());
    var result = await hirajRepo.favoriteProducts(
      productId:productId ,
       idParent:CacheData.getData(key: StringCache.idParent) ,
       userid: CacheData.getData(key: StringCache.userId), );
    result.fold(
          (failure) {
        emit(FavoriteProductsFailure(failure.errorMessage));
      },
          (favoriteProducts) {

        emit(FavoriteProductsSuccess(favoriteProducts: favoriteProducts));
        fetchHiraj(idParent: CacheData.getData(key: StringCache.idParent));


      },
    );
  }
///     favorite Seller
  Future<void> favoriteSeller(
      {
        // required int userid,
        required int sellerId}) async {
    emit(HirajLoading());
    var result = await hirajRepo.favoriteSeller(
      sellerId:sellerId ,
      idParent:CacheData.getData(key: StringCache.idParent) ,
      userid: CacheData.getData(key: StringCache.userId), );
    result.fold(
          (failure) {
        emit(FavoriteProductsFailure(failure.errorMessage));
      },
          (favoriteProducts) {
        emit(FavoriteProductsSuccess(favoriteProducts: favoriteProducts));
        fetchHiraj(idParent: CacheData.getData(key: StringCache.idParent));
      },
    );
  }
}
