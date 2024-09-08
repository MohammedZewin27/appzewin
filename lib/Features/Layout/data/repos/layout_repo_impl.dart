


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sahel_net/Features/Layout/data/models/dialog_advertisement_model.dart';
import 'package:sahel_net/Features/setting/data/models/user_date.dart';

import '../../../../core/error/failures.dart';



import '../../../../core/utils/api/api_service.dart';
import '../../../../core/utils/cash_data.dart';
import 'layout_repo.dart';


class LayoutRepoImpl implements LayoutRepo {
  LayoutRepoImpl(this.apiService);

  final ApiService apiService;

  ///fetch Dialog Advertisement
  @override
  Future<Either<Failure, DialogAdvertisementModel>> fetchDialogAdvertisementModel(int parentId) async{
    try {
      var data = await apiService.getWithParentId(
         userid: CacheData.getData(key: StringCache.userId),
          endPoint: 'dialog_advertisement/view_add_dialog_advertisement.php', parentId: parentId);
      DialogAdvertisementModel categoriesModel = DialogAdvertisementModel.fromJson(data);

      return right(categoriesModel);
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

  @override

  Future<Either<Failure, UserDataModel>> checkUserDataUserData(
      {required int? userId}) async {
    try {
      var data = await apiService.getUserData(
        endPoint: 'appView/setting/getUserData.php',
        userId: userId,
      );
      UserDataModel userDataModel = UserDataModel.fromJson(data);
      print("=============================$data");
      return right(userDataModel);
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
