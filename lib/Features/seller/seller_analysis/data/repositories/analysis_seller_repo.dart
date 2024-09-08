









import 'package:dartz/dartz.dart';
import 'package:sahel_net/core/error/failures.dart';

import '../models/analysis_product_model.dart';
import '../models/analysis_seller_model.dart';

abstract class AnalysisSellerRepo {
   Future<Either<Failure,AnalysisSellerModel>>  getFullAnalysisSeller({required int idSeller});
   // Future<Either<Failure,AnalysisProductModel>>  getFullAnalysisProduct({required int idProduct});



}