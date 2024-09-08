import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sahel_net/Features/seller/seller_analysis/data/models/analysis_seller_model.dart';

import 'package:sahel_net/core/error/failures.dart';

import '../../../../analysis/api_analysis/api_analysis.dart';
import '../models/analysis_product_model.dart';
import 'analysis_seller_repo.dart';

class AnalysisSellerRepoImpl implements AnalysisSellerRepo {
  AnalysisSellerRepoImpl(this.apiAnalysis);

  final ApiAnalysis apiAnalysis;
  /// analysis seller
  @override
  Future<Either<Failure, AnalysisSellerModel>> getFullAnalysisSeller(
      {required int idSeller}) async {
    try {
      var result = await apiAnalysis.getFullAnalysisSeller(
        idSeller: idSeller,
        endPoint: 'appView/analysis/full_analysis_seller.php',
      );
      AnalysisSellerModel analysisSellerModel =
          AnalysisSellerModel.fromJson(result);

      return right(analysisSellerModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
// /// analysis product
//   @override
//   Future<Either<Failure, AnalysisProductModel>> getFullAnalysisProduct(
//       {required int idProduct}) async {
//     try {
//       var result = await apiAnalysis.getFullAnalysisProduct(
//         productId: idProduct,
//         endPoint: 'appView/analysis_products/full_analysis_product.php',
//       );
//       AnalysisProductModel analysisProductModel =
//           AnalysisProductModel.fromJson(result);
//
//       return right(analysisProductModel);
//     } catch (e) {
//       if (e is DioException) {
//         return left(
//           ServerFailure.fromDioError(e),
//         );
//       }
//       return left(
//         ServerFailure(
//           e.toString(),
//         ),
//       );
//     }
//   }
}
