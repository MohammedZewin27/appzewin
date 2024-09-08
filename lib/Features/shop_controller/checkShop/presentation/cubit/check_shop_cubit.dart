// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../../../../core/utils/cash_data.dart';
// import '../../../../choose_user/data/model/shop_data_active_model.dart';
// import '../../../auth_shop/data/models/shop_user_model.dart';
// import '../../../auth_shop/data/repositories/setting_shop_repo.dart';
//
// part 'check_shop_state.dart';
//
// class CheckShopCubit extends Cubit<CheckShopState> {
//   CheckShopCubit(this.shopRepo) : super(CheckShopInitial());
//
//   static CheckShopCubit get(context) => BlocProvider.of(context);
//   final AuthShopRepo shopRepo;
//
//   Future<void> getShopData() async {
//     var result =
//     await shopRepo.getShopWithId(
//         idShop:300
//         // CacheData.getData(key: StringCache.idShop)??0
//     );
//
//     result.fold((failure) {
//       emit(CheckShopFailure(failure.errorMessage));
//     }, (shopDataModel) {
//       emit(CheckShopSuccess(shopDataModel: shopDataModel));
//     });
//   }
// }
