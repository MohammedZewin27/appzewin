
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import 'package:sahel_net/core/error/failures.dart';

import '../../../../core/utils/api/api_service.dart';
import '../model/sing_up_model.dart';
import 'auth_repo.dart';

class AuthRepoRepoImpl implements AuthRepo {
  AuthRepoRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, SingUpModel>> singUp(
      {required int idParent,
      required userName,
      required userPhone,
      required userPassword,
      required userEmail}) async {
    try {
      var data = await apiService.addUser(
        idParent: idParent,
        userEmail: userEmail,
        userName: userName,
        userPassword: userPassword,
        userPhone: userPhone,
        endPoint: 'auth/singup.php',
      );
      SingUpModel categoriesModel = SingUpModel.fromJson(data);

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
  Future<Either<Failure, VerifyCode>> verifyCode({
    required String userVerifyCode,
    required String userEmail,
  }) async {
    try {
      var data = await apiService.verifyCode(
          userVerifyCode: userVerifyCode,
          endPoint: 'auth/verfiycode.php',
          userEmail: userEmail);
      VerifyCode verifyCode = VerifyCode.fromJson(data);

      return right(verifyCode);
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
  Future<Either<Failure, LoginModel>> login(
      {required String emailOrPhone, required String password}) async {
    try {
      var data = await apiService.login(
          emailOrPhone: emailOrPhone,
          endPoint: 'auth/login.php',
          password: password);
      LoginModel loginModel = LoginModel.fromJson(data);

      return right(loginModel);
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
  Future deleteUser({required String emailOrPhoneOrIdUser}) async{
    try {
      var data = await apiService.deleteUser(
        parameter: 'emailOrphoneOrIdUser',
          emailOrPhoneOrIdUser:emailOrPhoneOrIdUser ,

          endPoint: 'auth/deleteuser.php',
         );
      LoginModel loginModel = LoginModel.fromJson(data);

      return loginModel;
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

    }
  }

  @override
  Future<Either<Failure, VerifyCode>> changPassword({required String? email, required String code, required String userPassword})async {
    try {
      var data = await apiService.changePassword(
        parameterMail: 'email',
          parameterUserPassword:'user_password' ,
          parameterVerifyCode:'verifycode' ,
          verifyCode: code,
          userPassword:userPassword ,
          email:email ,

          endPoint: 'auth/changePassword.php',
       );
      VerifyCode verifyCode = VerifyCode.fromJson(data);

      return right(verifyCode);
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
  Future<Either<Failure, MassageModel>> sendCode({required String email}) async{
    try {
      var data = await apiService.sendCodeToMail(
        email:email ,
        parameter: 'user_email',

        endPoint: 'auth/sendCode.php',
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
