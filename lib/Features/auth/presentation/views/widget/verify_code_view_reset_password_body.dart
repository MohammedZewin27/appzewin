import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/sign_in_body.dart';


import '../../../../../core/utils/function/functions.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/widgets/title_auth.dart';
import '../../../../../core/utils/widgets/validate.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../../cubit/auth_cubit.dart';
import '../sign_in_view.dart';
import 'auth_text_form.dart';
import 'custom_button_auth.dart';

class VerifyCodeViewResetPasswordBody extends StatefulWidget {
  const VerifyCodeViewResetPasswordBody({
    super.key,
    required this.email,
    required this.dataParent,
  });

  final String email;

  final DataParent dataParent;

  @override
  State<VerifyCodeViewResetPasswordBody> createState() =>
      _VerifyCodeViewResetPasswordBodyState();
}

class _VerifyCodeViewResetPasswordBodyState
    extends State<VerifyCodeViewResetPasswordBody> {
  late TextEditingController controllerPassword;
  late TextEditingController controllerCode;
  late GlobalKey<FormState> formKeyCode;

  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerCode = TextEditingController();
    formKeyCode = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerCode.dispose();
    formKeyCode.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is VerifyCodeLoading) {
              const Center(child: CustomProgressIndicator());
            }
            if (state is VerifyCodeSuccess) {
              if (state.verifyCode.status == AppString.success) {
                AuthCubit.get(context).loginNameController.text=state.verifyCode.userData!.userPhone.toString();
                AuthCubit.get(context).loginPasswordController.text=controllerPassword.text;


                customShowDialog(context,
                    content: state.verifyCode.message ?? '',
                    title: 'نجاح',
                    titleButton: 'خروج',
                    icon: Icons.check_circle,
                    colorIcon: ColorManager.lightGreen, onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignInView(dataParent: widget.dataParent),
                    ),
                  );
                });
              } else {
                customShowDialog(
                  context,
                  content: state.verifyCode.message ?? '',
                  title: 'فشل',
                  titleButton: 'خروج',
                  icon: Icons.error,
                  colorIcon: ColorManager.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              }
            }
            if (state is VerifyCodeFailure) {
              customShowDialog(
                context,
                content: 'حدث خطاء ما يرجى المحاولة لاحقاً',
                title: 'فشل',
                titleButton: 'خروج',
                icon: Icons.error,
                colorIcon: ColorManager.red,
                onPressed: () {
                  Navigator.pop(context);
                },
              );

            }
          },
          builder: (context, state) {
            return Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Form(
                      key: formKeyCode,
                      child: Column(
                        children: [
                          const TitleAuth(title: 'تغير كلمة المرور'),
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25)),
                                color: ColorManager.white),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 15,
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('كلمة المرور الجديدة',
                                      style: AppStyles.styleBold14),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextForm(
                                  colorIcon: ColorManager.primary,
                                  hintText: '',
                                  validator: (value) {
                                    return Validate.validatePassword(
                                      value!,
                                    );
                                  },
                                  prefixIcon: Icons.remove_red_eye_outlined,
                                  controller: controllerPassword,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('الكود المرسل على الايميل',
                                      style: AppStyles.styleBold14),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    validator: (value) {
                                      return Validate.validateCode(value!);
                                    },
                                    maxLength: 5,
                                    decoration: const InputDecoration(
                                        hintText: 'X X X X X',
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        )),
                                    keyboardType: TextInputType.number,
                                    controller: controllerCode,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomButtonAuth(
                                  onPressed: () {
                                    if (formKeyCode.currentState!.validate()) {
                                      AuthCubit.get(context).changePassword(
                                        code: controllerCode.text,
                                        email: widget.email,
                                        userPassword: controllerPassword.text,
                                      );
                                    }
                                  },
                                  text: 'ارسال',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
