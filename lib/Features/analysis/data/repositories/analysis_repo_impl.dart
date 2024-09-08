import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/favorite/data/models/favorite_model.dart';

import 'package:sahel_net/core/error/failures.dart';

import '../../../../core/utils/api/api_service.dart';
import '../../api_analysis/api_analysis.dart';
import 'analysis_repo.dart';

class AnalysisRepoImpl implements AnalysisRepo {
  AnalysisRepoImpl(this.apiAnalysis);

  final ApiAnalysis apiAnalysis;

  @override
  Future analysisEntryInteractionsSeller(
      {required int idSeller, int? idUser}) async {
    await apiAnalysis.analysisEntrySeller(
      idSeller: idSeller,
      idUser: idUser,
      endPoint: 'appView/analysis/entry_interactions_seller.php',
    );
  }

  @override
  Future entryInteractionsProduct(
      {required int idSeller, required int idProduct, int? idUser}) async {
    await apiAnalysis.entryInteractionsProduct(
      idSeller: idSeller,
      idProduct: idProduct,
      idUser: idUser,
      endPoint: 'appView/analysis/entry_interactions.php',
    );
  }

  @override
  Future analysisCallSeller({required int idSeller, int? idUser}) async {
    await apiAnalysis.analysisEntrySeller(
      idSeller: idSeller,
      idUser: idUser,
      endPoint: 'appView/analysis/analysis_seller_call.php',
    );
  }

  @override
  Future analysisLocationSeller({required int idSeller, int? idUser}) async {
    await apiAnalysis.analysisEntrySeller(
      idSeller: idSeller,
      idUser: idUser,
      endPoint: 'appView/analysis/analysis_seller_location.php',
    );
  }

  @override
  Future analysisSharingSeller({required int idSeller, int? idUser}) async {
    await apiAnalysis.analysisEntrySeller(
      idSeller: idSeller,
      idUser: idUser,
      endPoint: 'appView/analysis/analysis_seller_sharing.php',
    );
  }

  @override
  Future analysisWhatsAppSeller({required int idSeller, int? idUser})async {
    await apiAnalysis.analysisEntrySeller(
      idSeller: idSeller,
      idUser: idUser,
      endPoint: 'appView/analysis/analysis_seller_whatsapp.php',
    );
  }

  @override
  Future analysisCallProduct({required int idProduct,required int idSeller, int? idUser})async {
    await apiAnalysis.analysisAddProduct(
      sellerId: idSeller,
      productId: idProduct,
      idUser: idUser,
      endPoint: 'appView/analysis_products/analysis_product_call.php',
    );
  }

  @override
  Future analysisLocationProduct({required int idProduct,required int idSeller, int? idUser}) async{
    await apiAnalysis.analysisAddProduct(
      sellerId: idSeller,
      productId: idProduct,
      idUser: idUser,
      endPoint: 'appView/analysis_products/analysis_product_location.php',
    );
  }

  @override
  Future analysisSharingProduct({required int idProduct,required int idSeller, int? idUser}) async{
    await apiAnalysis.analysisAddProduct(
      sellerId: idSeller,
      productId: idProduct,
      idUser: idUser,
      endPoint: 'appView/analysis_products/analysis_product_sharing.php',
    );
  }

  @override
  Future analysisWhatsAppProduct({required int idProduct,required int idSeller, int? idUser})async {
    await apiAnalysis.analysisAddProduct(
      sellerId: idSeller,
      productId: idProduct,
      idUser: idUser,
      endPoint: 'appView/analysis_products/analysis_product_whatsapp.php',
    );
  }
}
