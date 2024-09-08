
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/sign_in_body.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/verify_code_view_reset_password.dart';

import '../../../../../../core/utils/theme/color_manager.dart';
import '../../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/function/functions.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/widgets/log_name_and_logo.dart';
import '../../../../../core/utils/widgets/title_auth.dart';
import '../../../../../generated/assets.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../../cubit/auth_cubit.dart';
import 'auth_text_form.dart';
import 'custom_button_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.dataParent});

  final DataParent dataParent;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController controllerMail;
  late GlobalKey<FormState> formKeyRestPassword;

  @override
  void initState() {
    controllerMail = TextEditingController();
    formKeyRestPassword = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    controllerMail.dispose();
    formKeyRestPassword.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: MediaQuery.sizeOf(context).width * 1.3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: ResetPasswordBody(widget: widget, controllerMail: controllerMail, formKeyRestPassword: formKeyRestPassword));
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
    );


  }
}

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
    required this.widget,
    required this.controllerMail,
    required this.formKeyRestPassword,
  });

  final ResetPassword widget;
  final TextEditingController controllerMail;
  final GlobalKey<FormState> formKeyRestPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendCodeToMailLoading) {
          const Center(child: CustomProgressIndicator());
        }
        if (state is SendCodeToMailSuccess) {
          state.massageModel.status == AppString.success
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyCodeViewResetPassword(
                      dataParent: widget.dataParent,
                      email: controllerMail.text,
                    ),
                  ),
                )
              : customShowDialog(
                  icon: Icons.error,
                  colorIcon: ColorManager.red,
                  context,
                  content: state.massageModel.message ?? '',
                  title: '!',
                  titleButton: 'خروج',
                  onPressed: () => Navigator.pop(context),
                );
        }
        if (state is SendCodeToMailFailure) {
          customShowDialog(
            icon: Icons.error,
            colorIcon: ColorManager.red,
            context,
            content: 'حدث خطاء !!',
            title: '!',
            titleButton: 'خروج',
            onPressed: () => Navigator.pop(context),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: Form(
                    key: formKeyRestPassword,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25),
                      child: Column(
                        children: [
                          const TitleAuth(
                            title: 'استرجاع كلمة المرور',
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text('الايميل الخاص بك',
                                style: AppStyles.styleBold14),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextForm(

                            hintText: '',
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
                            prefixIcon: Icons.alternate_email,
                            keyboardType:
                                TextInputType.emailAddress,
                            controller: controllerMail,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.sizeOf(context).width /
                                    5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25),
                            child: CustomButtonAuth(
                              onPressed: () {
                                if (formKeyRestPassword
                                    .currentState!
                                    .validate()) {
                                  AuthCubit.get(context)
                                      .sendCodeToMail(
                                          email:
                                              controllerMail.text);
                                }
                              },
                              text: 'ارسال',
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: <Widget>[
                                Divider(),
                                Text(
                                  'لاسترجاع كلمة المرور قم بكتابة الايميل الخاص بك ',
                                  style: AppStyles.styleSemiBold16,
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


