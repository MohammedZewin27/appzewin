import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sahel_net/Features/seller/sing_up_seller/data/models/seller_model.dart';

import 'package:sahel_net/core/error/failures.dart';

import '../../../core/api/api_service_seller.dart';
import 'sing_in_seller_repo.dart';

class AuthSellerRepoImpl implements AuthSellerRepo {
  AuthSellerRepoImpl(this.apiService);

  final ApiServiceSeller apiService;

  @override
  Future<Either<Failure, SellerModelHome>> getSellerWithCodAndPassword(
      {required String? codeSeller, required String? passwordSelle}) async{
    try {
      var data = await apiService.getSellerWithPassword(
        endPoint: 'appView/seller/authSeller.php',
        codeSeller: codeSeller,
        passwordSelle: passwordSelle,
      );
      SellerModelHome postSellerModel = SellerModelHome.fromJson(data);
      print("=============================$data");
      return right(postSellerModel);
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
}
