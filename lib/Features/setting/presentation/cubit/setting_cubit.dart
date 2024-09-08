import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../auth/data/model/sing_up_model.dart';
import '../../../parent/data/models/parent_model.dart';
import '../../data/models/user_date.dart';
import '../../data/repos/setting_repo.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.settingRepo) : super(SettingInitial());
  final SettingRepo settingRepo;

  static SettingCubit get(context) => BlocProvider.of(context);

  Future<void> fetchUserData() async {
    emit(UserDataLoading());
    var result = await settingRepo.getUserData(
        userId: CacheData.getData(key: StringCache.userId));

    result.fold(
      (failure) {
        emit(UserDataFailure(failure.errorMessage));
      },
      (userDataModel) {
        userDataSetting = userDataModel.userData;

        emit(UserDataSuccess(userDataModel: userDataModel));
      },
    );
  }

  Future<void> deleteUserActive({
    required String? userId,
    required String? userPassword,
  }) async {
    emit(DeleteUserActiveLoading());
    var result = await settingRepo.deleteUserActive(
        userId: userId, userPassword: userPassword);

    result.fold(
      (failure) {
        fetchUserData();
        emit(DeleteUserActiveFailure(failure.errorMessage));
      },
      (userDataModel) {
        fetchUserData();

        emit(DeleteUserActiveSuccess(massageRequestModel: userDataModel));
      },
    );
  }

  late UserDataSetting? userDataSetting;
  late GlobalKey<ScaffoldState> scaffoldKeySetting;

  Future<void> fetchParent() async {
    emit(FetchParentLoading());
    var result = await settingRepo.fetchSettingParent();

    result.fold(
      (failure) {
        emit(FetchParentFailure(failure.errorMessage));
      },
      (parentModel) {
         urlImage = CacheData.getData(key: StringCache.appLogo);
         parentName = CacheData.getData(key: StringCache.parentName);
         // userName = CacheData.getData(key: StringCache.userName);
         // userPhone = CacheData.getData(key: StringCache.userPhone);
         // userMail = CacheData.getData(key: StringCache.userEmail);
         fetchUserData();
        emit(FetchParentSuccess(parentModel: parentModel));
      },
    );
  }

  Future<void> changeDataSetting({required DataParent parentModel}) async {
    urlImage = parentModel.appLogo!;
    CacheData.getData(key: StringCache.appDescription);
    CacheData.getData(key: StringCache.idParent);
    CacheData.getData(key: StringCache.userPhone);
    CacheData.getData(key: StringCache.userEmail);

    CacheData.getData(key: StringCache.backgroundImage);
    parentName = parentModel.name!;
     fetchUserData();
    emit(ChangeDataSuccess());
  }

  String urlImage = CacheData.getData(key: StringCache.appLogo);
  String parentName = CacheData.getData(key: StringCache.parentName);
  String userName = CacheData.getData(key: StringCache.userName);
  String userPhone = CacheData.getData(key: StringCache.userPhone);
  String userMail = CacheData.getData(key: StringCache.userEmail);

  // String parentId = CacheData.getData(key: StringCache.idParent);
  // String userId = CacheData.getData(key: StringCache.userId);

  Future<void> updateUserDate(
      {required int? userId,
      required String? userPhone,
      required String? userName}) async {
    emit(UpdateUserDataLoading());
    var result = await settingRepo.updateUser(
        userId: userId, userPhone: userPhone, userName: userName);

    result.fold(
      (failure) {
        emit(UpdateUserDataFailure(failure.errorMessage));
      },
      (upDate) {
        fetchUserData();

        emit(
          UpdateUserDataSuccess(upDate: upDate),
        );
      },
    );
  }

  Future<void> serviceRequest({
    required String? email,
    required String? phone,
    required String? text,
  }) async {
    emit(ServiceRequestDataLoading());
    var result = await settingRepo.serviceRequest(
        email: email, phone: phone, text: text);

    result.fold(
      (failure) {
        emit(ServiceRequestDataFailure(failure.errorMessage));
      },
      (serviceRequestModel) {
        fetchUserData();
        emit(ServiceRequestDataSuccess(
            serviceRequestModel: serviceRequestModel));
      },
    );
  }

 late  bool isActive ;
 late bool userActiveSignIn=StringCache.activeSignIn;
}
