import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../../hiraj/presentation/cubit/hiraj_cubit.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../search/preasention/view_model/search_cubit.dart';
import '../../data/models/parent_model.dart';
import '../../data/repos/parent_repo.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit(this.parentRepo) : super(ParentInitial());

  final ParentRepo parentRepo;

  static ParentCubit get(context) => BlocProvider.of(context);

  Future<void> fetchParent() async {
    emit(ParentLoading());
    var result = await parentRepo.fetchParent();

    result.fold(
      (failure) {
        emit(ParentFailure(failure.errorMessage));
      },
      (parentModel) {
        emit(ParentSuccess(parentModel: parentModel));
      },
    );
  }

  late int parentId = CacheData.getData(key: StringCache.idParent);


  Future<void> changeParent({required BuildContext context,required DataParent parentList}) async {

    CacheData.setData(
        key: StringCache.idParent,
        value: parentList.id);

    CacheData.setData(
        key: StringCache.appLogo,
        value: parentList.appLogo);
    CacheData.setData(
        key: StringCache.backgroundImage,
        value: parentList.backgroundImage);
    CacheData.setData(
        key: StringCache.parentName,
        value: parentList.name);
    CacheData.setData(
        key: StringCache.appDescription,
        value: parentList.appDescription);
   SettingCubit.get(context).parentName=CacheData.getData(key: StringCache.parentName);




   SettingCubit.get(context).urlImage=CacheData.getData(key: StringCache.appLogo);

    HomeCubit.get(context).fetchHome(idParent: parentList.id!);
     HirajCubit.get(context).fetchHiraj(idParent:  parentList.id!);
     SearchCubit.get(context).fetchResultSearch(search: '', idParent:  parentList.id!);
     parentId =  parentList.id!;
     SettingCubit.get(context).fetchParent();
     // SettingCubit.get(context).changeDataSetting(parentModel: parentList);
     CacheData.setData(key: StringCache.idParent, value:  parentList.id!);
     Navigator.pop(context);
     emit(ChangeParentSuccess());


  }




}
