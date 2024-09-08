part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
}
class AuthSuccess extends AuthState {
  final SingUpModel singUpModel;

  AuthSuccess({required this.singUpModel});
}
class VerifyCodeSuccess extends AuthState {
  final VerifyCode verifyCode;

  VerifyCodeSuccess({required this.verifyCode});
}
class VerifyCodeFailure extends AuthState {
  final String errorMessage;

  VerifyCodeFailure(this.errorMessage);
}
class VerifyCodeLoading extends AuthState {



}
class LoginLoading extends AuthState {}
class LoginFailure extends AuthState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
class LoginSuccess extends AuthState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}
class SendCodeToMailLoading extends AuthState {}
class SendCodeToMailFailure extends AuthState {
  final String errorMessage;

  SendCodeToMailFailure(this.errorMessage);
}
class SendCodeToMailSuccess extends AuthState {
  final MassageModel massageModel;

  SendCodeToMailSuccess({required this.massageModel});
}
