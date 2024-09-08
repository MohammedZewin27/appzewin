import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';



abstract class AuthSellerRepo {

  Future<Either<Failure, SellerModelHome>> getSellerWithCodAndPassword(
      {required String? codeSeller,required String? passwordSelle});

}
