import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/theme/color_manager.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onPressedSuffixIcon,
    this.controller,
    this.validator,
    this.colorIcon,
    this.onTap,
    this.onEditingComplete,
    this.maxLength,
    this.onChanged,  this.enabled,
  });

  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool? enabled;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final Function()? onPressedSuffixIcon;
  final Color? colorIcon;
  final void Function(String)? onChanged;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Material(
        // color: Colors.white.withOpacity(.4),

        // elevation: 10,
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: ColorManager.blue,
              fontSize: 18),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          enabled:enabled??true ,
          controller: controller,
          textDirection: TextDirection.rtl,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: hintText,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            hintStyle: Theme.of(context).textTheme.labelSmall,
            prefixIcon: IconButton(
              // splashColor: ColorManager.primary.withOpacity(.47),
              // focusColor: ColorManager.primary.withOpacity(.47),
              color: ColorManager.primary.withOpacity(.47),
              icon: Icon(
                prefixIcon,
                size: 25,
                color: colorIcon ?? Colors.black54,
              ),
              onPressed: onPressedSuffixIcon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            hintTextDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
