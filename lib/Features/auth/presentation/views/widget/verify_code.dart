
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/log_name_and_logo.dart';
import '../../../../../generated/assets.dart';

import '../../../../parent/data/models/parent_model.dart';
import '../../../../setting/presentation/cubit/setting_cubit.dart';
import '../../cubit/auth_cubit.dart';
import '../sign_in_view.dart';


class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView(
      {super.key, required this.email, required this.dataParent, required this.password, required this.phone});

  final String email;
  final String password;
  final String phone;
  final DataParent dataParent;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        AuthCubit.get(context).deleteUser(emailOrPhoneOrIdUser: email);
        return true;
      },
      child:  Scaffold(
        backgroundColor: ColorManager.primary5,
        // resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () async {
            await callMe(context);
          },
          child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.assetsCallus),
              )),
        ),

        bottomSheet: BottomSheet(
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return Container(
                padding: const EdgeInsets.only(top: 20, left: 5, right: 16),
                alignment: Alignment.topLeft,
                height:
                     MediaQuery.sizeOf(context).width * 1.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width/4,),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is VerifyCodeSuccess) {
                          if (state.verifyCode.status == AppString.success) {
                            AuthCubit.get(context).loginNameController.text=email;
                            AuthCubit.get(context).loginPasswordController.text=password;
                            AuthCubit.get(context).selected={'1'};
                            SettingCubit.get(context).userActiveSignIn=true;
                            CacheData.setData(key: StringCache.userActiveSignIn, value: true);
                            CacheData.setData(
                                key: StringCache.userName,
                                value: state.verifyCode.userData?.userName);
                            CacheData.setData(
                                key: StringCache.userEmail,
                                value: state.verifyCode.userData?.userEmail);
                            CacheData.setData(
                                key: StringCache.userPhone,
                                value: state.verifyCode.userData?.userPhone);
                            CacheData.setData(
                                key: StringCache.userId,
                                value: state.verifyCode.userData?.userId);
                            CacheData.setData(key: StringCache.activeUser, value: true);
                            Navigator.pop(context);
                            // Navigator.pop(context);


                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {

                                  return  SignInView(dataParent: dataParent,);
                                },
                              ),
                            );
                            // Navigator.pushReplacementNamed(context, AppRoutes.layout);
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
                                  state.verifyCode.message??'',
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
                        }

                        if (state is VerifyCodeFailure) {
                          print(state.errorMessage);
                        }

                        // if (state is VerifyCodeLoading) {
                        //   print('loading ....');
                        //   showDialog(
                        //     barrierDismissible: false,
                        //     context: context,
                        //     builder: (context) => const CustomProgressIndicator(),
                        //   );
                        // }
                      },
                      builder: (context, state) {
                        return Column(

                          children: [
                            const Text(
                              'قم بإدخال الكود المرسل على \n ',
                              style: AppStyles.styleBold14,
                            ),
                            Text(
                              email,
                              style: AppStyles.styleSemiBold16,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            OtpTextField(
                              fieldWidth: 50,
                              borderRadius: BorderRadius.circular(10),
                              numberOfFields: 5,
                              borderColor: ColorManager.primary,
                              fillColor: ColorManager.white,
                              enabledBorderColor: ColorManager.grey,
                              filled: true,
                              showFieldAsBox: true,

                              onCodeChanged: (String code) {},

                              onSubmit: (String verificationCode) async {
                                print(verificationCode);
                                print(email);
                                await AuthCubit.get(context).verifyCode(
                                    userVerifyCode: verificationCode, userEmail: email);
                              }, // end onSubmit
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ));
          },
        ),
        body: const SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                LogNameAndLogo()

              ],
            ),
          ),
        ),
      )


      // Scaffold(
      //   body: Stack(
      //     children: [
      //       CachedImage(
      //         url: dataParent.backgroundImage ?? '',
      //         width: MediaQuery.sizeOf(context).width,
      //         height: MediaQuery.sizeOf(context).height,
      //       ),
      //       BlocConsumer<AuthCubit, AuthState>(
      //         listener: (context, state) {
      //           if (state is VerifyCodeSuccess) {
      //             if (state.verifyCode.status == AppString.success) {
      //               CacheData.setData(
      //                   key: StringCache.userName,
      //                   value: state.verifyCode.userData?.userName);
      //               CacheData.setData(
      //                   key: StringCache.userEmail,
      //                   value: state.verifyCode.userData?.userEmail);
      //               CacheData.setData(
      //                   key: StringCache.userPhone,
      //                   value: state.verifyCode.userData?.userPhone);
      //               CacheData.setData(
      //                   key: StringCache.userId,
      //                   value: state.verifyCode.userData?.userId);
      //               CacheData.setData(key: StringCache.activeUser, value: true);
      //               Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) {
      //                     return const Layout();
      //                   },
      //                 ),
      //               );
      //               // Navigator.pushReplacementNamed(context, AppRoutes.layout);
      //             } else {
      //               showDialog(
      //                 context: context,
      //                 builder: (context) => CustomCupertinoAlertDialog(
      //                   onPressed: () => Navigator.pop(context),
      //                   alertDialogModel: AlertDialogModel(
      //                     title: 'خـطـاء',
      //                     titleContent: ' !! الكود المدخل خطاء',
      //                     titleButton: 'حاول مرة اخرى ',
      //                   ),
      //                 ),
      //               );
      //             }
      //           }
      //
      //           if (state is VerifyCodeFailure) {
      //             print(state.errorMessage);
      //           }
      //
      //           if (state is VerifyCodeLoading) {
      //             print('loading ....');
      //             showDialog(
      //               barrierDismissible: false,
      //               context: context,
      //               builder: (context) => const CustomProgressIndicator(),
      //             );
      //           }
      //         },
      //         builder: (context, state) {
      //           return Column(
      //             children: [
      //               const SizedBox(
      //                 height: 150,
      //               ),
      //               ImageLogIn(
      //                 logoImage: dataParent.appLogo ?? '',
      //               ),
      //               const SizedBox(
      //                 height: 16,
      //               ),
      //               const Text(
      //                 'قم بإدخال الكود المرسل على \n ',
      //                 style: AppStyles.styleBold14,
      //               ),
      //               Text(
      //                 email,
      //                 style: AppStyles.styleSemiBold16,
      //               ),
      //               const SizedBox(
      //                 height: 25,
      //               ),
      //               OtpTextField(
      //                 fieldWidth: 50,
      //                 borderRadius: BorderRadius.circular(10),
      //                 numberOfFields: 5,
      //                 borderColor: ColorManager.primary,
      //                 fillColor: ColorManager.white,
      //                 enabledBorderColor: ColorManager.grey,
      //                 filled: true,
      //                 showFieldAsBox: true,
      //
      //                 onCodeChanged: (String code) {},
      //
      //                 onSubmit: (String verificationCode) async {
      //                   print(verificationCode);
      //                   print(email);
      //                   await AuthCubit.get(context).verifyCode(
      //                       userVerifyCode: verificationCode, userEmail: email);
      //                 }, // end onSubmit
      //               ),
      //             ],
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
// LogNameAndLogo()
class CustomCupertinoAlertDialog extends StatelessWidget {
  const CustomCupertinoAlertDialog({
    super.key,
    required this.alertDialogModel,
    required this.onPressed,
  });

  final AlertDialogModel alertDialogModel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(alertDialogModel.title,
          style: Theme.of(context).textTheme.bodyLarge),
      content: Text(
        alertDialogModel.titleContent,
        style: AppStyles.styleSemiBold10,
      ),
      actions: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2,
          child: TextButton(
              onPressed: onPressed, child: Text(alertDialogModel.titleButton)),
        )
      ],
    );
  }
}

class AlertDialogModel {
  final String title;
  final String titleContent;
  final String titleButton;

  AlertDialogModel(
      {required this.title,
      required this.titleContent,
      required this.titleButton});
}
