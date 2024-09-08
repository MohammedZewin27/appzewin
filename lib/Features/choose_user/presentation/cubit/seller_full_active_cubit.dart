import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../seller/sing_up_seller/data/models/seller_model.dart';
import '../../../seller/sing_up_seller/data/repositories/seller_repo.dart';

part 'seller_full_active_state.dart';

class SellerFullActiveCubit extends Cubit<SellerFullActiveState> {
  SellerFullActiveCubit(this.sellerRepo) : super(SellerFullActiveInitial());
  static SellerFullActiveCubit get(context) => BlocProvider.of(context);
  final SellerRepo sellerRepo;

  Future<void> getSellerData() async {
    emit(SellerFullActiveLoading());
    var result = await sellerRepo.fetchSellerWithId(idSeller:
    // 128
    CacheData.getData(key: StringCache.idSeller)
    );

    result.fold((failure) {
      emit(SellerFullActiveFailure(failure.errorMessage));
    }, (sellerData){
      emit(SellerFullActiveSuccess(sellerData: sellerData));
    });
  }
}
