import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/auth_text_form.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/button_Log_in.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/sign_in_body.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/text_form_password.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/verify_code.dart';
import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/function/functions.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../core/utils/widgets/title_auth.dart';
import '../../../parent/data/models/parent_model.dart';
import '../cubit/auth_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key, required this.dataParent});

  final DataParent dataParent;

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late GlobalKey<FormState> formKeyLogUp;
  @override
  void initState() {
   formKeyLogUp = GlobalKey<FormState>();
    super.initState();
  }
  @override
  void dispose() {
    formKeyLogUp.currentState?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              const Center(child: CustomProgressIndicator());
            }
            if (state is AuthFailure) {
              customShowDialog(context,
                  colorIcon: ColorManager.red,
                  icon: Icons.error,
                  content: state.errorMessage,
                  title: '',
                  titleButton: 'OK',
              onPressed: () => Navigator.pop(context),

              );
            }
            if (state is AuthSuccess) {
              print(state.singUpModel.message);
              state.singUpModel.status == AppString.success
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return VerifyCodeView(
                            password: cubit.passwordController.text,
                            phone:  cubit.phoneController.text,
                            dataParent: widget.dataParent,
                            email: cubit.emailController.text,
                          );
                        },
                      ),
                    )
                  : customShowDialog(context,
                  colorIcon: ColorManager.red,
                  icon: Icons.error,
                      onPressed: () => Navigator.pop(context),
                      content: state.singUpModel.message ?? '',
                      title: '',
                      titleButton: 'خروج');
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
                            // margin: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            child: Form(
                              key: formKeyLogUp,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const TitleAuth(title: 'تسجيل جديد',),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'الاسم ',
                                      style: AppStyles.styleBold14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 25),
                                    child: CustomTextForm(
                                      colorIcon: Colors.blue,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value?.trim() == '' ||
                                              value!.isEmpty) {
                                            return 'الاسم';
                                          }
                                          return null;
                                        },
                                        controller: cubit.nameController,
                                        hintText: '',
                                        prefixIcon: Icons.person),
                                  ),
                                  const SizedBox(height: 12),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'رقم الجوال ',
                                      style: AppStyles.styleBold14,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 25),
                                    child: CustomTextForm(
                                        colorIcon: ColorManager.lightGreen,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value?.trim() == '' ||
                                              value!.isEmpty ||
                                              value.length < 10||
                                              value.length > 11) {
                                            return 'رقم الجوال غير كامل';
                                          }
                                          return null;
                                        },
                                        controller: cubit.phoneController,
                                        hintText: '',
                                        prefixIcon: Icons.phone),
                                  ),
                                  const SizedBox(height: 12),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'الايميل',
                                      style: AppStyles.styleBold14,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 25),
                                    child: CustomTextForm(
                                        colorIcon: ColorManager.lightOrange,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'يرجى إدخال عنوان بريد إلكتروني';
                                          }
                                          final bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                                              .hasMatch(value);
                                          if (!emailValid) {
                                            return 'الرجاء إدخال عنوان بريد إلكتروني صالح';
                                          }
                                          return null;
                                        },
                                        controller: cubit.emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        hintText: '',
                                        prefixIcon: Icons.alternate_email),
                                  ),
                                  const SizedBox(height: 12),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'كلمة المرور',
                                      style: AppStyles.styleBold14,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  TextFormPassword(
                                    controller: cubit.passwordController,
                                  ),
                                  const SizedBox(height: 12),
                                  ButtonLogUp(
                                    onPressed: () async {
                                      if(formKeyLogUp.currentState!.validate()){
                                        await AuthCubit.get(context)
                                            .logUpAndValidate(idParent: CacheData.getData(key: StringCache.idParent));
                                      }
                                    },
                                    dataParent: widget.dataParent,
                                  ),
                                  const SizedBox(height: 30),
                    
                                ],
                              ),
                            ),
                          ),
                        )
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
