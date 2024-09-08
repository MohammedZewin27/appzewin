// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sahel_net/Features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:sahel_net/Features/auth/presentation/views/widget/button_Log_in.dart';
// import 'package:sahel_net/Features/auth/presentation/views/widget/verify_code.dart';
//
// import '../../../../../core/utils/function/functions.dart';
// import '../../../../../core/utils/theme/strings_manager.dart';
// import '../../../../../core/utils/theme/styles_manager.dart';
// import '../../../../../core/utils/widgets/cashed_image.dart';
// import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
// import '../../../../parent/data/models/parent_model.dart';
// import 'auth_text_form.dart';
// import 'button_active_email.dart';
//
// class ActivateEmail extends StatelessWidget {
//   const ActivateEmail({super.key, required this.dataParent});
//
//   final DataParent dataParent;
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = AuthCubit.get(context);
//     return Scaffold(
//       body: Stack(
//         children: [
//           CachedImage(
//             url: dataParent.backgroundImage ?? '',
//             width: MediaQuery.sizeOf(context).width,
//             height: MediaQuery.sizeOf(context).height,
//           ),
//           BlocConsumer<AuthCubit, AuthState>(
//             listener: (context, state) {
//               if (state is VerifyCodeLoading) {
//                 const Center(child: CustomProgressIndicator());
//               }
//               if (state is VerifyCodeFailure) {
//                 customShowDialog(context,
//                     content: state.errorMessage, title: '', titleButton: 'OK');
//               }
//               if (state is VerifyCodeSuccess) {
//                 print(state.verifyCode.message);
//                 state.verifyCode.status == AppString.success
//                     ? Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                           builder: (context) {
//                             return VerifyCodeView(
//                               dataParent: dataParent,
//                               email: cubit.emailController.text,
//                             );
//                           },
//                         ),
//                       )
//                     : customShowDialog(context,
//                         content: state.verifyCode.message ?? '',
//                         title: '',
//                         titleButton: 'حاول مرة اخرى');
//               }
//             },
//             builder: (context, state) {
//               return Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Form(
//                   key: cubit.formKeyActiveEmail,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'الايميل ',
//                           style: AppStyles.styleBold14,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25),
//                         child: CustomTextForm(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'يرجى إدخال عنوان بريد إلكتروني';
//                               }
//                               final bool emailValid = RegExp(
//                                       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
//                                   .hasMatch(value);
//                               if (!emailValid) {
//                                 return 'الرجاء إدخال عنوان بريد إلكتروني صالح';
//                               }
//                               return null;
//                             },
//                             controller: cubit.activeEmailControllerController,
//                             hintText: '',
//                             prefixIcon: Icons.email),
//                       ),
//                       const SizedBox(height: 8),
//                       ButtonActiveEmail(dataParent: dataParent)
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
