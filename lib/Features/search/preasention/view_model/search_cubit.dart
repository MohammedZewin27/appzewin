import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/search_model.dart';
import '../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());


final SearchRepo searchRepo;
static SearchCubit get(context)=>BlocProvider.of(context);

  Future<void> fetchResultSearch({required String search,required int idParent}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchView(search: search,idParent: idParent);

    result.fold(
          (failure) {
        emit(SearchFailure(failure.errorMessage));
      },
          (searchModel) {
        emit(SearchSuccess(searchModel: searchModel));
      },
    );
  }


  bool shopsChecked = true;
  bool sellersChecked = true;
  bool productsChecked = true;
  var controllerWordSearch = TextEditingController();

}
