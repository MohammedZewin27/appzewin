import 'package:dartz/dartz.dart';
import 'package:sahel_net/core/error/failures.dart';

import '../../../../auth/data/model/sing_up_model.dart';

abstract class SellingSellerRepo {
  Future<Either<Failure, MassageModel>> deleteSeller({

    required int idSeller,
  });
}
