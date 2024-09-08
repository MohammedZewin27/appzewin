import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../seller_analysis/data/models/analysis_product_model.dart';
import '../../../seller_analysis/data/repositories/analysis_seller_repo.dart';
import '../../data/repositories/post_seller_repo.dart';

part 'social_media_product_state.dart';

class SocialMediaProductCubit extends Cubit<SocialMediaProductState> {
  SocialMediaProductCubit(this.postSellerRepo) : super(SocialMediaProductInitial());
  final PostSellerRepo postSellerRepo;

  static SocialMediaProductCubit get(context) => BlocProvider.of(context);

  Future<void> getFullAnalysisProduct({required idProduct}) async {
    emit(SocialMediaProductLoading());
    var result = await postSellerRepo.getFullAnalysisProduct(
      idProduct:idProduct ,
      );

    result.fold(
          (failure) {
        emit(SocialMediaProductFailure(failure.errorMessage));
      },
          (analysisProductModel) {
        emit(SocialMediaProductSuccess(analysisProductModel: analysisProductModel));
      },
    );
  }
}
