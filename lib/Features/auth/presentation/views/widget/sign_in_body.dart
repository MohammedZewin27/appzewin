// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/reset_password.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/text_form_password.dart';
import 'package:sahel_net/core/utils/function/call_me.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';

// import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/utils/widgets/title_auth.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../../../../setting/presentation/cubit/setting_cubit.dart';
import '../../cubit/auth_cubit.dart';
import 'auth_text_form.dart';
import 'button_Log_in.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
    required this.dataParent,
  });

  final DataParent dataParent;

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late GlobalKey<FormState> formKeyLogIn;

  @override
  void initState() {
    formKeyLogIn = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeyLogIn.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (state.loginModel.status == AppString.success) {
            SettingCubit.get(context).userActiveSignIn = true;
            CacheData.setData(key: StringCache.userActiveSignIn, value: true);
            CacheData.setData(
                key: StringCache.userName,
                value: state.loginModel.userData?.userName);
            CacheData.setData(
                key: StringCache.userName,
                value: state.loginModel.userData?.userName);
            CacheData.setData(
                key: StringCache.userEmail,
                value: state.loginModel.userData?.userEmail);
            CacheData.setData(
                key: StringCache.userPhone,
                value: state.loginModel.userData?.userPhone);
            CacheData.setData(
                key: StringCache.userId,
                value: state.loginModel.userData?.userId);
            CacheData.setData(key: StringCache.activeUser, value: true);
            AuthCubit.get(context).nameController.clear();
            AuthCubit.get(context).emailController.clear();
            AuthCubit.get(context).phoneController.clear();
            AuthCubit.get(context).passwordController.clear();
            AuthCubit.get(context).loginNameController.clear();
            AuthCubit.get(context).loginPasswordController.clear();
            AuthCubit.get(context).activeEmailControllerController.clear();
            Navigator.pop(context);

            SettingCubit.get(context).fetchUserData();
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Icon(
                  Icons.error_outlined,
                  color: ColorManager.red,
                  size: 35,
                ),
                content: Text(
                  state.loginModel.message ?? '',
                  style: AppStyles.styleRegular16,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.primary),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('حدث خطاء',
                              style: AppStyles.styleBoldWhite16)),
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Icon(
                Icons.error_outlined,
                color: ColorManager.red,
                size: 35,
              ),
              content: Text(
                state.errorMessage,
                style: AppStyles.styleRegular16,
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primary),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('حدث خطاء',
                            style: AppStyles.styleBoldWhite16)),
                  ),
                ),
              ],
            ),
          );
        } else if (state is LoginLoading) {
          const Center(child: CustomProgressIndicator());
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        child: Form(
                          key: formKeyLogIn,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TitleAuth(
                                title: 'تسجيل دخول',
                              ),
                              const SizedBox(height: 25),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'الايميل او رقم الجوال',
                                  style: AppStyles.styleSemiBold12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: CustomTextForm(
                                    colorIcon: Colors.blue,
                                    validator: (value) {
                                      if (value?.trim() == '' ||
                                          value!.isEmpty) {
                                        return 'الايميل او رقم الجوال';
                                      }
                                      return null;
                                    },
                                    controller: cubit.loginNameController,
                                    hintText: '',
                                    prefixIcon: Icons.person),
                              ),
                              const SizedBox(height: 16),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'كلمة المرور',
                                  style: AppStyles.styleSemiBold12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFormPassword(
                                controller: cubit.loginPasswordController,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) => ResetPassword(
                                              dataParent: widget.dataParent,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'نسيت كلمة المرور',
                                        style: AppStyles.styleSemiBold10
                                            .copyWith(
                                                color: ColorManager.blue2),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'الموافقة على سياسة الخصوصية ',
                                          style: AppStyles.styleSemiBold10
                                              .copyWith(
                                                  color: AuthCubit.get(context)
                                                          .policyChecked
                                                      ? ColorManager.blue2
                                                      : ColorManager.red),
                                        ),
                                      ),
                                      Checkbox(
                                        activeColor: Colors.green,
                                        checkColor: Colors.white,
                                        value: AuthCubit.get(context)
                                            .policyChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            AuthCubit.get(context)
                                                .policyChecked = value!;
                                            privacyPolicy(context);
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              ButtonLogIn(
                                onPressed: () {
                                  if (formKeyLogIn.currentState!.validate()) {
                                    if (AuthCubit.get(context).policyChecked ==
                                        true) {
                                      cubit.loginAndValidate(
                                          emailOrPhone:
                                              cubit.loginNameController.text,
                                          password: cubit
                                              .loginPasswordController.text);
                                    }
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      signInWithGoogle();
                                    },
                                    child: const Icon(FontAwesomeIcons.google),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Icon(FontAwesomeIcons.facebook),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Icon(FontAwesomeIcons.apple),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
