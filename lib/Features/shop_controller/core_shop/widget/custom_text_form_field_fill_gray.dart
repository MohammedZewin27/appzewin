import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldFillGray extends StatelessWidget {
  const CustomTextFormFieldFillGray(
      {super.key,
      required this.title,
      this.controller,
      this.validator,
      this.enabled,
      this.keyboardType,
      this.hintText,
      this.prefixIcon,
      this.textInputAction,
       this.obscureText,
      this.onTap,
      this.onEditingComplete,
      this.onPressedSuffixIcon,
      this.colorIcon,
      this.onChanged,
      this.maxLength, this.minLines, this.maxLines});

  final String title;
  final bool? enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final IconData? prefixIcon;

  final TextInputAction? textInputAction;
  final bool? obscureText;

  final void Function()? onTap;
  final void Function()? onEditingComplete;

  final Function()? onPressedSuffixIcon;
  final Color? colorIcon;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomTextForm(
            maxLines:maxLines ,
            minLines: minLines,
            enabled: enabled,
            keyboardType: keyboardType,
            controller: controller,
            onTap: onTap,
            maxLength: maxLength,
            onChanged: onChanged,
            colorIcon: colorIcon,
            hintText: hintText,
            obscureText: obscureText??false,
            onEditingComplete: onEditingComplete,
            onPressedSuffixIcon: onPressedSuffixIcon,
            prefixIcon: prefixIcon,
            textInputAction: textInputAction,
            validator: validator,
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Container(

            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorManager.primary7),
            child: Center(
              child: AutoSizeText(
                title,
                style: AppStyles.styleSemiBold12.copyWith(color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.hintText,
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
    this.onChanged,
    this.enabled, this.minLines, this.maxLines,
  });

  final String? hintText;
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
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(

          maxLines:maxLines ,
          minLines: minLines,
          enabled: enabled,
          style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: ColorManager.primary7,
              fontSize: 18),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          textDirection: TextDirection.rtl,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.backTextFrom,
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
