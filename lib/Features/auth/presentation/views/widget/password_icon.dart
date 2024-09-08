import 'package:flutter/material.dart';

import 'auth_text_form.dart';

class PasswordIcon extends StatefulWidget {
  const PasswordIcon({super.key, this.controller});
  final TextEditingController? controller;
  @override
  State<PasswordIcon> createState() => _PasswordIconState();
}
class _PasswordIconState extends State<PasswordIcon> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      textInputAction: TextInputAction.next,
      controller:widget.controller ,
      hintText: '',
      prefixIcon: isPassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
      obscureText: isPassword,
      onPressedSuffixIcon: () {
        setState(() {
          isPassword =!isPassword;
        });
      },
    );
  }
}