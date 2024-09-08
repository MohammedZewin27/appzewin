import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../data/repositories/analysis_repo.dart';

part 'app_analysis_state.dart';

class AppAnalysisCubit extends Cubit<AppAnalysisState> {
  AppAnalysisCubit(this.analysisRepo) : super(AppAnalysisInitial());

  static AppAnalysisCubit get(context) => BlocProvider.of(context);
  final AnalysisRepo analysisRepo;

  Future<void> analysisEntrySeller({required int idSeller}) async {
    await analysisRepo.analysisEntryInteractionsSeller(
        idSeller: idSeller, idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisCallSeller({required int idSeller}) async {
    await analysisRepo.analysisCallSeller(
        idSeller: idSeller, idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisLocationSeller({required int idSeller}) async {
    await analysisRepo.analysisLocationSeller(
        idSeller: idSeller, idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisSharingSeller({required int idSeller}) async {
    await analysisRepo.analysisSharingSeller(
        idSeller: idSeller, idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisWhatsAppSeller({required int idSeller}) async {
    await analysisRepo.analysisWhatsAppSeller(
        idSeller: idSeller, idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> entryProduct(
      {required int idSeller, required int idProduct}) async {
    await analysisRepo.entryInteractionsProduct(
        idSeller: idSeller,
        idProduct: idProduct,
        idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisCallProduct(  {required int idSeller, required int idProduct}) async {
    await analysisRepo.analysisCallProduct(
        idProduct: idProduct,
        idSeller: idSeller,
        idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisLocationProduct(  {required int idSeller, required int idProduct}) async {
    await analysisRepo.analysisLocationProduct(
        idProduct: idProduct,
        idSeller: idSeller,
        idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisSharingProduct(  {required int idSeller, required int idProduct}) async {
    await analysisRepo.analysisSharingProduct(
        idProduct: idProduct,
        idSeller: idSeller,
        idUser: CacheData.getData(key: StringCache.userId));
  }

  Future<void> analysisWhatsAppProduct(  {required int idSeller, required int idProduct}) async {
    await analysisRepo.analysisWhatsAppProduct(
        idProduct: idProduct,
        idSeller: idSeller,
        idUser: CacheData.getData(key: StringCache.userId));
  }
}
