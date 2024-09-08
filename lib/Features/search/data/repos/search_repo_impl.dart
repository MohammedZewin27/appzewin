
import 'package:dartz/dartz.dart';




import 'package:dio/dio.dart';
import 'package:sahel_net/Features/search/data/repos/search_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/api/api_service.dart';
import '../models/search_model.dart';


class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SearchModel>> fetchSearchView(
      {required String search,required int idParent}) async {
    try {
      var data = await apiService.getSearch(endPoint: 'appView/newSearch.php', search: search,parentId: idParent);

      SearchModel searchShops = SearchModel.fromJson(data);
      print("=============================$data");
      return right(searchShops);
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
