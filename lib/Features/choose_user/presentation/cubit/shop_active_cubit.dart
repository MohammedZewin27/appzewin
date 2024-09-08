import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../../shop_controller/auth_shop/data/models/add_shop_database.dart';
import '../../../shop_controller/auth_shop/data/models/shop_user_model.dart';
import '../../../shop_controller/auth_shop/data/repositories/auth_shop_repo.dart';


part 'shop_active_state.dart';

class ShopActiveCubit extends Cubit<ShopActiveState> {
  ShopActiveCubit(this.shopRepo) : super(ShopActiveInitial());

  static ShopActiveCubit get(context) => BlocProvider.of(context);

  final AuthShopRepo shopRepo;

  Future<void> getDateShop() async {
    emit(ShopActiveLoading());

    try {
      var result = await shopRepo.getShopWithId(
          idShop: CacheData.getData(key: StringCache.idShop)??0);

      result.fold((failure) {
        print("Failure: ${failure.errorMessage}");
        emit(ShopActiveFailure(failure.errorMessage));
      }, (shopDataModel) {
        print("Shop Data Model: $shopDataModel");
        emit(ShopActiveSuccess(shopDataModel: shopDataModel));
      });
    } catch (e) {
      print("Exception: $e");
      emit(ShopActiveFailure(e.toString()));
    }
  }
}
