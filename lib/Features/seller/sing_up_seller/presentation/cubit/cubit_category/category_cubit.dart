import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/seller_model.dart';
import '../../../data/repositories/seller_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.sellerRepo) : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  final SellerRepo sellerRepo;
  Future<void> fetchCategories({required int parentId }) async {
    emit(CategoryLoading());
    var result = await sellerRepo.fetchCategory(parentId:parentId );

    result.fold(
          (failure) {
        emit(CategoryFailure(failure.errorMessage));
      },
          (sellerCategoryModel) {
        emit(CategorySuccess(sellerCategoryModel: sellerCategoryModel));
      },
    );
  }
}
