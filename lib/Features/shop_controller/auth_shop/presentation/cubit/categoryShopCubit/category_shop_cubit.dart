import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/data/repositories/auth_shop_repo.dart';

import '../../../data/models/shop_user_model.dart';

part 'category_shop_state.dart';

class CategoryShopCubit extends Cubit<CategoryShopState> {
    CategoryShopCubit(this.authShopRepo) : super(CategoryShopInitial());

  static CategoryShopCubit get(context) => BlocProvider.of(context);
  final AuthShopRepo authShopRepo;
  Future<void> fetchShopCategories({required int parentId }) async {
    emit(CategoryShopLoading());
    var result = await authShopRepo.fetchShopCategory(parentId:parentId );

    result.fold(
          (failure) {
        emit(CategoryShopFailure(failure.errorMessage));
      },
          (sellerCategoryModel) {
        emit(CategoryShopSuccess(shopCategoryModel: sellerCategoryModel));
      },
    );
  }
}
