import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../model/sing_up_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, SingUpModel>> singUp(
      {required int idParent,
      required String userName,
      required String userPhone,
      required String userPassword,
      required String userEmail});

  Future<Either<Failure, VerifyCode>> verifyCode(
      {required String userVerifyCode, required String userEmail});

  Future<Either<Failure, LoginModel>> login(
      {required String emailOrPhone, required String password});



  Future deleteUser({required String emailOrPhoneOrIdUser,});
  Future <Either<Failure, MassageModel>>sendCode({required String email,});
  Future <Either<Failure, VerifyCode>>changPassword({required  String email,
    required String code,
    required String userPassword,});
}
