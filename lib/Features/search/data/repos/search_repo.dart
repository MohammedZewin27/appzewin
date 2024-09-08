import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../models/search_model.dart';





abstract class SearchRepo {

 Future<Either<Failure,SearchModel>> fetchSearchView({required String search,required int idParent});


}
