import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/sing_up_model.dart';
import '../../data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> addUser(
      {required int idParent,
      required userName,
      required userPhone,
      required userPassword,
      required userEmail}) async {
    emit(AuthLoading());
    var result = await authRepo.singUp(
        idParent: idParent,
        userName: userName,
        userPhone: userPhone,
        userPassword: userPassword,
        userEmail: userEmail);

    result.fold(
      (failure) {
        emit(AuthFailure(failure.errorMessage));
      },
      (singUpModel) {

        emit(AuthSuccess(singUpModel: singUpModel));

      },
    );
  }

  late int userId;
  late String userName;
  late String userEmail;
  late String userPhone;
  late String userPassword;
  late int userVerfycode;
  late String userCreate;
  late int userActive;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginNameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController activeEmailControllerController =
      TextEditingController();

  Future<void> verifyCode({required userVerifyCode, required userEmail}) async {
    emit(VerifyCodeLoading());
    var result = await authRepo.verifyCode(
        userVerifyCode: userVerifyCode, userEmail: userEmail);

    result.fold(
      (failure) {
        emit(VerifyCodeFailure(failure.errorMessage));
      },
      (verifyCode) {

        emit(VerifyCodeSuccess(verifyCode: verifyCode));
      },
    );
  }
late final String nameParent;
  Future<void> login(
      {required String emailOrPhone, required String password}) async {
    emit(LoginLoading());
    var result =
        await authRepo.login(emailOrPhone: emailOrPhone, password: password);

    result.fold(
      (failure) {
        emit(LoginFailure(failure.errorMessage));
      },
      (loginModel) {

        emit(LoginSuccess(loginModel: loginModel),);

      },
    );
  }

  Future<void> loginAndValidate(
      {required String emailOrPhone, required String password}) async {
    await login(emailOrPhone: emailOrPhone, password: password);
  }

  Future<void> deleteUser({required String emailOrPhoneOrIdUser}) async {
    await authRepo.deleteUser(emailOrPhoneOrIdUser: emailOrPhoneOrIdUser);
  }

  Future<void> sendCodeToMail({required String email}) async {
    emit(SendCodeToMailLoading());
    var result = await authRepo.sendCode(email: email);

    result.fold(
      (failure) {
        emit(SendCodeToMailFailure(failure.errorMessage));
      },
      (loginModel) {
        emit(SendCodeToMailSuccess(massageModel: loginModel));
      },
    );
  }

  Future<void> logUpAndValidate({required int idParent}) async {
    await addUser(
        idParent: idParent,
        userName: nameController.text ,
        userPhone: phoneController.text,
        userPassword: passwordController.text,
        userEmail: emailController.text);
  }

  Future<void> changePassword(
      {required String email,
      required String code,
      required String userPassword}) async {
    var result = await authRepo.changPassword(
        email: email, code: code, userPassword: userPassword);

    result.fold(
      (failure) {
        emit(VerifyCodeFailure(failure.errorMessage));
      },
      (verifyCode) {
        emit(VerifyCodeSuccess(verifyCode: verifyCode));
      },
    );
  }

  Set<String> selected = {'1'};

  bool policyChecked = false;
}
