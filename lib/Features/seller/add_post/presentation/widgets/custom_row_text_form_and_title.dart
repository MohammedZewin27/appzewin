import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';

class CustomRowTextFormAndTitle extends StatelessWidget {
  const CustomRowTextFormAndTitle(
      {super.key,
        this.validator,
        required this.controller,
        required this.title,
        this.flexTextForm,
        this.flexText, this.minLines, this.maxLines=1, this.maxLength});

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String title;
  final int? flexTextForm;
  final int? flexText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: flexTextForm ?? 3,
          child: TextFormField(
            textAlign: TextAlign.justify,
            validator: validator,
            controller: controller,
            maxLength: maxLength,
            minLines: minLines??1,
            maxLines: maxLines??1,
            onChanged: (value) {

            },
            textDirection: TextDirection.rtl,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              filled: true,
              fillColor: ColorManager.backTextFrom,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: flexText ?? 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorManager.primary7.withOpacity(.2),
            ),
            child: AutoSizeText(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.styleSemiBold12.copyWith(color: Colors.black87),
            ),
          ),
        )
      ],
    );
  }
}