import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../data/repositories/setting_shop_repo.dart';

part 'setting_shop_user_state.dart';

class SettingShopUserCubit extends Cubit<SettingShopUserState> {
  SettingShopUserCubit(this.settingShopRepo) : super(SettingShopUserInitial());
  final SettingShopRepo settingShopRepo;

  static SettingShopUserCubit get(context) => BlocProvider.of(context);

  GlobalKey<ScaffoldState> scaffoldKeySettingShop = GlobalKey<ScaffoldState>();

  Future<void> changeStatus() async {
    emit(SettingShopLoading());
    final shopId = CacheData.getData(key: StringCache.idShop) ?? 0;

    var data = await settingShopRepo.changeStatusShop(idShop: shopId);
    data.fold(
      (failure) {
        emit(SettingShopFailure(failure.errorMessage));
      },
      (dataShop) {
        emit(SettingShopSuccess(dataShop: dataShop));
      },
    );
  }
}
