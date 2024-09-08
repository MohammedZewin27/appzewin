part of 'send_massage_cubit.dart';

@immutable
sealed class SendMassageState {}

final class SendMassageInitial extends SendMassageState {}
class AddUserMassageLoading extends SendMassageState {}
class AddUserMassageFailure extends SendMassageState {
  final String errorMessage;

  AddUserMassageFailure(this.errorMessage);
}
class AddUserMassageSuccess extends SendMassageState {
  final MassageRequestModel massageRequestModel;

  AddUserMassageSuccess({required this.massageRequestModel});
}
