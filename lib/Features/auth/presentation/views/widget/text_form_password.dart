import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';

import 'auth_text_form.dart';

class TextFormPassword extends StatefulWidget {
  const TextFormPassword({
    super.key, this.controller,

  });
final TextEditingController? controller;
  @override
  State<TextFormPassword> createState() => _TextFormPasswordState();
}

class _TextFormPasswordState extends State<TextFormPassword> {

  bool isPassword=true;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomTextForm(
          onPressedSuffixIcon: () {
           setState(() {
             isPassword =!isPassword;
             print(isPassword);
           });
          },
          controller:widget.controller ,
          colorIcon: isPassword?ColorManager.primary:ColorManager.red,
          obscureText:isPassword ,
          validator: (value) {
            if(value==''||value!.trim().isEmpty){
              return 'كلمة المرور';
            }
            return null;
          },
          hintText: '',
          prefixIcon: isPassword?Icons.remove_red_eye:Icons.remove_red_eye_outlined),
    );
  }
}