import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../data/models/analysis_seller_model.dart';
import '../../data/repositories/analysis_seller_repo.dart';

part 'social_media_seller_state.dart';

class SocialMediaSellerCubit extends Cubit<SocialMediaSellerState> {
  SocialMediaSellerCubit(this.analysisSellerRepo) : super(SocialMediaSellerInitial());
  final AnalysisSellerRepo analysisSellerRepo;

  static SocialMediaSellerCubit get(context) => BlocProvider.of(context);

  Future<void> getFullAnalysisSeller() async {
    emit(SocialMediaSellerLoading());
    var result = await analysisSellerRepo.getFullAnalysisSeller(
        idSeller: CacheData.getData(key: StringCache.idSeller));

    result.fold(
          (failure) {
        emit(SocialMediaSellerFailure(failure.errorMessage));
      },
          (analysisSellerModel) {
        emit(SocialMediaSellerSuccess(analysisSellerModel: analysisSellerModel));
      },
    );
  }
}
