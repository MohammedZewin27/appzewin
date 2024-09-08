import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:sahel_net/Features/auth/data/model/sing_up_model.dart';
import 'package:sahel_net/Features/setting/data/repos/setting_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/api/api_service.dart';
import '../../../parent/data/models/parent_model.dart';
import '../models/user_date.dart';

class SettingRepoImpl implements SettingRepo {
  final ApiService apiService;

  SettingRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ParentModel>> fetchSettingParent() async {
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

  @override
  Future<Either<Failure, SingUpModel>> updateUser({required int? userId,
    required String? userPhone,
    required String? userName}) async {
    try {
      var data = await apiService.updateUser(
          endPoint: 'auth/user_update.php',
          userId: userId,
          userPhone: userPhone,
          userName: userName);
      SingUpModel singUpModel = SingUpModel.fromJson(data);
      print("=============================$data");
      return right(singUpModel);
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
  Future<Either<Failure, UserDataModel>> getUserData(
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

  @override
  Future<Either<Failure, MassageRequestModel>> serviceRequest(
      {required String? email,
        required String? phone,
        required String? text}) async {
    try {
      var data = await apiService.serviceRequest(
        text: text,
        email: email,
        phone: phone,
        endPoint: 'appView/setting/serviceRequest.php',
      );
      MassageRequestModel serviceRequestModel =
      MassageRequestModel.fromJson(data);
      print("=============================$data");
      return right(serviceRequestModel);
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
  Future<Either<Failure, MassageRequestModel>> deleteUserActive(
      {required String? userId, required String? userPassword}) async {
    try {
      var data = await apiService.deleteUserActive(
        userPassword: userPassword,
        endPoint: 'auth/deleteuserActive.php',
        userId: userId,
      );
      MassageRequestModel userDelete = MassageRequestModel.fromJson(data);
      print("=============================$data");
      return right(userDelete);
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
  Future<Either<Failure, MassageRequestModel>> sendMassageFromUser(
      {required String userId,
        required String title,
        required String subject,
        required String type}) async {
    try {
      var data = await apiService.addUserMassage(
          endPoint:'massage/send_massage.php' ,
          userId: userId,
          title: title,
          subject: subject,
          type: type);

    MassageRequestModel userDelete = MassageRequestModel.fromJson(data);
    print("=============================$data");
    return right(userDelete);
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
