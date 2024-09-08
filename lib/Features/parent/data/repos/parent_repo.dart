import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/parent_model.dart';







abstract class ParentRepo {

 Future<Either<Failure,ParentModel>> fetchParent();


}
