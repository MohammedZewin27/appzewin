import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';
import '../../../sing_up_seller/data/repositories/seller_repo.dart';

part 'check_seller_state.dart';

class CheckSellerCubit extends Cubit<CheckSellerState> {
  CheckSellerCubit(this.sellerRepo) : super(CheckSellerInitial());

  static CheckSellerCubit get(context) => BlocProvider.of(context);
  final SellerRepo sellerRepo;

  Future<void> getSellerData() async {
    var result = await sellerRepo.fetchSellerWithId(idSeller: CacheData.getData(key: StringCache.idSeller));

    result.fold((failure) {
      emit(SellerHomeFailure(failure.errorMessage));
    }, (sellerData){
      emit(SellerHomeSuccess(sellerData: sellerData));
    });
  }
}
