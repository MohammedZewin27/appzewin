part of 'setting_cubit.dart';

@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}
class UserDataLoading extends SettingState {}



class UserDataFailure extends SettingState {
  final String errorMessage;

  UserDataFailure(this.errorMessage);

}

class UserDataSuccess extends SettingState {
  final UserDataModel userDataModel;

  UserDataSuccess({required this.userDataModel});
}
class FetchParentLoading extends SettingState {}



class FetchParentFailure extends SettingState {
  final String errorMessage;

  FetchParentFailure(this.errorMessage);

}

class FetchParentSuccess extends SettingState {
  final ParentModel parentModel;

  FetchParentSuccess({required this.parentModel});
}


class ChangeDataLoading extends SettingState {}
class ChangeDataFailure extends SettingState {}
class ChangeDataSuccess extends SettingState {}

class UpdateUserDataLoading extends SettingState {}
class UpdateUserDataFailure extends SettingState {
  final String errorMessage;

  UpdateUserDataFailure(this.errorMessage);
}
class UpdateUserDataSuccess extends SettingState {
  final SingUpModel upDate;

UpdateUserDataSuccess({required this.upDate});
}


class ServiceRequestDataLoading extends SettingState {}
class ServiceRequestDataFailure extends SettingState {
  final String errorMessage;

  ServiceRequestDataFailure(this.errorMessage);
}
class ServiceRequestDataSuccess extends SettingState {
  final MassageRequestModel serviceRequestModel;

  ServiceRequestDataSuccess({required this.serviceRequestModel});
}

class DeleteUserActiveLoading extends SettingState {}
class DeleteUserActiveFailure extends SettingState {
  final String errorMessage;

  DeleteUserActiveFailure(this.errorMessage);
}
class DeleteUserActiveSuccess extends SettingState {
  final MassageRequestModel massageRequestModel;

  DeleteUserActiveSuccess({required this.massageRequestModel});
}

