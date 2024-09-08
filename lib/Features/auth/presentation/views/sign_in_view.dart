
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sahel_net/Features/auth/presentation/views/sign_up_view.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/auth_text_form.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/sign_in_body.dart';

import '../../../../core/utils/function/call_me.dart';
import '../../../../core/utils/theme/color_manager.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/log_name_and_logo.dart';
import '../../../../generated/assets.dart';
import '../../../parent/data/models/parent_model.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key, required this.dataParent});

  final DataParent? dataParent;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  void upDateSelected(Set<String> newSelection) {
    setState(() {
      AuthCubit.get(context).selected = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
              height: AuthCubit.get(context).selected.contains('1')
                  ? MediaQuery.sizeOf(context).width * 1.3
                  : MediaQuery.sizeOf(context).width * 1.45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  AuthCubit.get(context).selected.contains('1')
                      ? Expanded(
                          child: SignInBody(dataParent: widget.dataParent!))
                      : Expanded(
                          child: SignUpView(dataParent: widget.dataParent!)),
                  Row(
                    children: [
                      Expanded(
                        child: SegmentedButton(
                            style: ButtonStyle(
                              iconColor: WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Colors.white;
                                  }
                                  return ColorManager.primary;
                                },
                              ),
                              backgroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return ColorManager.primary;
                                  }
                                  return Colors.white;
                                },
                              ),
                              textStyle: WidgetStateProperty.resolveWith(
                                    (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppStyles.styleBoldWhite16;
                                  }
                                  return AppStyles.styleBold16;
                                },
                              ),
                              side: WidgetStateProperty.resolveWith((states) {
                                return const BorderSide(
                                  color: ColorManager.primary,
                                  width: 2,
                                );
                              }),
                              elevation: WidgetStateProperty.resolveWith<double>(
                                      (states) => 10),
                              shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                ),
                              ),
                            ),
                            onSelectionChanged: upDateSelected,
                            segments: [
                              ButtonSegment(
                                value: '1',
                                label: Text(
                                  'تسجيل',
                                  style:
                                  AuthCubit.get(context).selected.contains('2')
                                      ? AppStyles.styleBoldPrimary16
                                      : AppStyles.styleBoldWhite16,
                                ),
                              ),
                              ButtonSegment(
                                value: '2',
                                label: Text(
                                  ' تسجيل جديد',
                                  style:
                                  AuthCubit.get(context).selected.contains('1')
                                      ? AppStyles.styleBoldPrimary16
                                      : AppStyles.styleBoldWhite16,
                                ),
                              ),
                            ],
                            selected: AuthCubit.get(context).selected),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
              LogNameAndLogo(),
              // const SizedBox(
              //   height: 10,
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
// class SignInView extends StatefulWidget {
//   const SignInView({super.key, required this.dataParent});
//
//   final DataParent? dataParent;
//
//   @override
//   State<SignInView> createState() => _SignInViewState();
// }
//
// class _SignInViewState extends State<SignInView> {
//   void upDateSelected(Set<String> newSelection) {
//     setState(() {
//       AuthCubit.get(context).selected = newSelection;
//     });
//   }
// var controllerEmail=TextEditingController();
// var controllerPassword=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: ListView(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Center(
//                     child: Container(
//                         height: 70,
//                         width: 70,
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(70)),
//                         child: Image.asset(
//                           Assets.imagesLogo,
//                           height: 40,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'تسجيل دخول',
//                     style:
//                         AppStyles.styleSemiBold24.copyWith(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'سجل لتتميع بمميزات التطبيق',
//                     style:
//                         AppStyles.styleSemiBold16.copyWith(color: Colors.grey),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'الايميل',
//                     style:
//                         AppStyles.styleSemiBold16.copyWith(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   const CustomTextForm(
//                     hintText: 'ادخل الايميل',
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'كلمة المرور',
//                     style:
//                         AppStyles.styleSemiBold16.copyWith(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   const CustomTextForm(hintText: 'ادخل كلمة المرور'),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     alignment: Alignment.bottomLeft,
//                     child: Text('نسيت كلمة المرور'),
//                   ),
//                 ],
//               ),
//               MaterialButton(
//                 height: 35,
//                 color: ColorManager.lightOrange,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 onPressed: () async{
//
//
//
//
//                 },
//                 child: Text(
//                   'تسجيل',
//                   style:
//                       AppStyles.styleSemiBold16.copyWith(color: Colors.white),
//                 ),
//               ),
//               Text(
//                 'استخدم ',
//                 textAlign: TextAlign.center,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   MaterialButton(
//                     height: 35,
//                     color: ColorManager.lightOrange,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text(
//                       ' GOOGLE',
//                       style: AppStyles.styleSemiBold16
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                   MaterialButton(
//                     height: 35,
//                     color: ColorManager.lightOrange,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text(
//                       'FACEBOOK',
//                       style: AppStyles.styleSemiBold16
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                   MaterialButton(
//                     height: 35,
//                     color: ColorManager.lightOrange,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text(
//                       'APPLE',
//                       style: AppStyles.styleSemiBold16
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SingUp(),
//                         ));
//                   },
//                   child: Text('تسجيل حساب جديد')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SingUp extends StatefulWidget {
//   const SingUp({super.key});
//
//   @override
//   State<SingUp> createState() => _SingUpState();
// }
//
// class _SingUpState extends State<SingUp> {
//   var controllerEmail=TextEditingController();
//
//   var controllerPassword=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: ListView(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Center(
//                     child: Container(
//                         height: 70,
//                         width: 70,
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(70)),
//                         child: Image.asset(
//                           Assets.imagesLogo,
//                           height: 40,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'تسجيل جديد',
//                     style:
//                         AppStyles.styleSemiBold24.copyWith(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//
//
//                   Text(
//                     'اسم المستخدم',
//                     style:
//                         AppStyles.styleSemiBold16.copyWith(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   const CustomTextForm(
//                     hintText: 'اسم المستخدم',
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   const CustomTextForm(
//                     hintText: 'رقم الجوال',
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                    CustomTextForm(
//                     hintText: 'ادخل الايميل',
//                     controller: controllerEmail,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'كلمة المرور',
//                     style:
//                         AppStyles.styleSemiBold16.copyWith(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                    CustomTextForm(hintText: 'ادخل كلمة المرور',controller: controllerPassword,),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     alignment: Alignment.bottomLeft,
//                     child: Text('نسيت كلمة المرور'),
//                   ),
//                 ],
//               ),
//               MaterialButton(
//                 height: 35,
//                 color: ColorManager.lightOrange,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 onPressed: () async{
//                   try {
//                     print('456123');
//                     final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                       email:'mohammedzewin@gmail.com',
//                       password: '0104252746',
//                     );
//                   } on FirebaseAuthException catch (e) {
//                     if (e.code == 'weak-password') {
//                       print('The password provided is too weak.');
//                     } else if (e.code == 'email-already-in-use') {
//                       print('The account already exists for that email.');
//                     }
//                   } catch (e) {
//                     print(e);
//                   }
//
//                 },
//                 child: Text(
//                   ' تسجيل جديد',
//                   style:
//                       AppStyles.styleSemiBold16.copyWith(color: Colors.white),
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
