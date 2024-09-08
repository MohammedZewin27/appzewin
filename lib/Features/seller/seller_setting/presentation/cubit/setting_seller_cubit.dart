import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../core/api/api_service_seller.dart';
import '../../data/repositories/setting_seller_repo.dart';

part 'setting_seller_state.dart';

class SettingSellerCubit extends Cubit<SettingSellerState> {
  SettingSellerCubit(this.sellingSellerRepo) : super(SettingSellerInitial());
  static SettingSellerCubit get(context)=>BlocProvider.of(context);

  GlobalKey<ScaffoldState> scaffoldKeySettingSeller = GlobalKey<ScaffoldState>();
  final SellingSellerRepo sellingSellerRepo;
  Future<void> changeStatusSeller() async {
    emit(ChangeStatusSellerLoading());
    final idSeller = CacheData.getData(key: StringCache.idSeller) ?? 0;

    var data = await sellingSellerRepo.deleteSeller(idSeller: idSeller);
    data.fold(
          (failure) {
        emit(ChangeStatusSellerFailure(failure.errorMessage));
      },
          (dataShop) {
        emit(ChangeStatusSellerSuccess());
      },
    );
  }


}
