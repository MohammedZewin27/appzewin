import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/auth/data/model/sing_up_model.dart';
import 'package:sahel_net/Features/seller/seller_setting/data/repositories/setting_seller_repo.dart';
import 'package:sahel_net/core/error/failures.dart';

import '../../../core/api/api_service_seller.dart';

class SettingSellerRepoImpl implements SellingSellerRepo {
  SettingSellerRepoImpl(this.apiServiceSeller);

  final ApiServiceSeller apiServiceSeller;

  @override
  Future<Either<Failure, MassageModel>> deleteSeller(
      { required int idSeller}) async {
    try {
      var data = await apiServiceSeller.changeStatusSeller(
        idSeller: idSeller,
        endPoint: 'appView/seller/deleteSeller.php',
      );
      MassageModel massageModel = MassageModel.fromJson(data);
      return right(massageModel);
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
