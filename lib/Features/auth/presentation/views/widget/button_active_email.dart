// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sahel_net/Features/auth/presentation/views/widget/verify_code.dart';
//
// import '../../../../../core/utils/theme/color_manager.dart';
// import '../../../../../core/utils/theme/styles_manager.dart';
// import '../../../../parent/data/models/parent_model.dart';
// import '../../cubit/auth_cubit.dart';
//
// // class ButtonActiveEmail extends StatelessWidget {
// //   const ButtonActiveEmail({
// //     super.key,
// //     required this.dataParent,
// //   });
// //
// //   final DataParent dataParent;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var cubit = AuthCubit.get(context);
// //     return BlocConsumer<AuthCubit, AuthState>(
// //       listener: (context, state) {
// //
// //       },
// //       builder: (context, state) {
// //         return Padding(
// //           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
// //           child: Row(
// //             children: [
// //               const Expanded(child: SizedBox()),
// //               Expanded(
// //                 flex: 2,
// //                 child: ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                       backgroundColor: ColorManager.primary),
// //                   child: Text(
// //                     'تفعيل',
// //                     style: AppStyles.styleMedium16.copyWith(color: Colors.white),
// //                   ),
// //                   onPressed: () async {
// //                     Navigator.pushReplacement(
// //                       context,
// //                       CupertinoPageRoute(
// //                         builder: (context) => VerifyCodeView(
// //                           phone:cubit.userPhone ,
// //                             password: cubit.userPassword,
// //                             email: cubit.activeEmailControllerController.text,
// //                             dataParent: dataParent),
// //                       ),);
// //                   },
// //                 ),
// //               ),
// //               const Expanded(child: SizedBox())
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }