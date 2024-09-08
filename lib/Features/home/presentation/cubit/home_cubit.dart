import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/Features/hiraj/data/models/hiraj_model.dart';

import '../../../../core/utils/cash_data.dart';
import '../../data/models/home_model.dart';
import '../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> fetchHome({required int idParent}) async {
    emit(AllCategoryLoading());
    var result = await homeRepo.fetchCategories(idParent,
        userid: CacheData.getData(key: StringCache.userId)

    );

    result.fold(
      (failure) {
        isSettingDataUserActive=false;
       isSettingAdvertisementActive=false;
        emit(AllCategoryFailure(failure.errorMessage));
      },
      (category) {
        isSettingDataUserActive=true;
        isSettingAdvertisementActive=true;
        emit(AllCategorySuccess(homeModel: category));
      },
    );
  }

  /// rating Shop

  Future<void> ratingShop(
      {required int userid,
      required int shopId,
      required double ratingValue}) async {
    emit(AllCategoryLoading());
    var result = await homeRepo.addRatingShop(
        shopId: shopId, userid: userid, ratingValue: ratingValue);
    result.fold(
      (failure) {
        emit(RatingFailure(failure.errorMessage));
      },
      (hirajModel) {
        emit(RatingSuccess(ratingShop: hirajModel));
        fetchHome(idParent: CacheData.getData(key: StringCache.idParent));
      },
    );
  }




  Future<void> favoriteShop(
      {
        // required int userid,
        required int shopId}) async {
    emit(FavoriteShopLoading());
    var result = await homeRepo.favoriteShop(
      idParent: CacheData.getData(key: StringCache.idParent),
      shopId:shopId ,
      userid: CacheData.getData(key: StringCache.userId), );
    result.fold(
          (failure) {
        emit(FavoriteShopFailure(failure.errorMessage));
      },
          (favoriteProducts) {

        emit(FavoriteShopSuccess(favoriteShop: favoriteProducts));
        fetchHome(idParent: CacheData.getData(key: StringCache.idParent));
      },
    );
  }



  /// favorite Products
  Future<void> favoriteProductsHome(
      {
        // required int userid,
        required int productId}) async {

    var result =
     await homeRepo.favoriteProducts(
      productId:productId ,
      idParent:CacheData.getData(key: StringCache.idParent) ,
      userid: CacheData.getData(key: StringCache.userId), );
    result.fold(
          (failure) {
        emit(FavoriteProductFailure(failure.errorMessage));
      },
          (favoriteProducts) {

        emit(FavoriteProductSuccess(favoriteProduct: favoriteProducts));
        fetchHome(idParent: CacheData.getData(key: StringCache.idParent));


      },
    );
  }


bool isSettingDataUserActive=false;
bool isSettingAdvertisementActive=false;
// bool is=false;
}
