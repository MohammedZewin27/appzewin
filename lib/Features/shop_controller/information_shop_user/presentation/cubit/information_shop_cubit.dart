import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/data/repositories/information_shop_repo.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../data/models/information_model.dart';

part 'information_shop_state.dart';

class InformationShopCubit extends Cubit<InformationShopState> {
  InformationShopCubit(this.informationShopRepo)
      : super(InformationShopInitial());
  final InformationShopRepo informationShopRepo;
  static InformationShopCubit get(context) => BlocProvider.of(context);



  Future<void> getImagesShop() async {
    emit(InformationShopLoading());
    var result = await informationShopRepo.fetchPhotoShop(
        idShop: CacheData.getData(key: StringCache.idShop) ?? 0);

    result.fold(
      (failure) {
        emit(InformationShopFailure(failure.errorMessage));
      },
      (shopImagesUser) {
        emit(InformationShopSuccess(shopImagesUser: shopImagesUser));
      },
    );
  }




}
