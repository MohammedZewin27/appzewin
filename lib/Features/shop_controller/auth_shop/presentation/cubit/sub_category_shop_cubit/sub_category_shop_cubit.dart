import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/shop_user_model.dart';
import '../../../data/repositories/auth_shop_repo.dart';

part 'sub_category_shop_state.dart';

class SubCategoryShopCubit extends Cubit<SubCategoryShopState> {
  SubCategoryShopCubit(this.authShopRepo) : super(SubCategoryShopInitial());
  static SubCategoryShopCubit get(context) => BlocProvider.of(context);
  final AuthShopRepo authShopRepo;
  Future<void> fetchShopSubCategories({required int categoriesId }) async {
    emit(SubCategoryShopLoading());
    var result = await authShopRepo.fetchShopSubCategory(categoriesId:categoriesId );

    result.fold(
          (failure) {
        emit(SubCategoryShopFailure(failure.errorMessage));
      },
          (sellerCategoryModel) {
        emit(SubCategoryShopSuccess(shopSubCategoryModel: sellerCategoryModel));
      },
    );
  }
}
