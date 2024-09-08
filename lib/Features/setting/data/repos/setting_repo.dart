import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/data/model/sing_up_model.dart';
import '../../../parent/data/models/parent_model.dart';
import '../models/user_date.dart';

abstract class SettingRepo {
  Future<Either<Failure, UserDataModel>> getUserData({required int? userId});

  Future<Either<Failure, ParentModel>> fetchSettingParent();

  Future<Either<Failure, MassageRequestModel>> serviceRequest({
    required String? email,
    required String? phone,
    required String? text,
  });

  Future<Either<Failure, SingUpModel>> updateUser(
      {required int? userId,
      required String? userPhone,
      required String? userName});

  Future<Either<Failure, MassageRequestModel>> deleteUserActive(
      { required String? userId,
        required String? userPassword,});


  Future<Either<Failure, MassageRequestModel>> sendMassageFromUser(
      {  required String userId,
        required String title,
        required String subject,
        required String type,});


}
