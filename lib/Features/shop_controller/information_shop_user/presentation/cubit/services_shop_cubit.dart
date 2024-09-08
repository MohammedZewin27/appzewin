import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../data/models/information_model.dart';
import '../../data/repositories/information_shop_repo.dart';

part 'services_shop_state.dart';

class ServicesShopCubit extends Cubit<ServicesShopState> {
  ServicesShopCubit(this.informationShopRepo) : super(ServicesShopInitial());
  final InformationShopRepo informationShopRepo;
  static ServicesShopCubit get(context) => BlocProvider.of(context);


  Future<void> getServicesShop() async {
    emit(ServicesShopLoading());
    var result = await informationShopRepo.showServicesShop(
        shopId:CacheData.getData(key: StringCache.idShop) ?? 0);
    result.fold(
          (failure) {
        emit(ServicesShopFailure(failure.errorMessage));
      },
          (servicesShowShopModel) {
        emit(ServicesShopSuccess(servicesShowShopModel: servicesShowShopModel));
      },
    );
  }
}
