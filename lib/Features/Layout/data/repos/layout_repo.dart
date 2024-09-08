

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../setting/data/models/user_date.dart';
import '../models/dialog_advertisement_model.dart';



abstract class LayoutRepo {
  Future<Either<Failure, DialogAdvertisementModel>> fetchDialogAdvertisementModel(int idParent);
  Future<Either<Failure, UserDataModel>> checkUserDataUserData({required int? userId});

}
