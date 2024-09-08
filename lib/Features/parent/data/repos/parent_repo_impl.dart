
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:sahel_net/Features/parent/data/repos/parent_repo.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/utils/api/api_service.dart';
import '../models/parent_model.dart';

class ParentRepoImpl implements ParentRepo {
  final ApiService apiService;

  ParentRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ParentModel>> fetchParent() async {
    try {
      var data = await apiService.get(
        endPoint: 'appView/view_parent.php',
      );

      ParentModel parentModel = ParentModel.fromJson(data);
      print("=============================$data");
      return right(parentModel);
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
