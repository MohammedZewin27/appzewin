import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';

class CustomSettingWidget extends StatelessWidget {
  const CustomSettingWidget(
      {super.key, required this.text, required this.details});

  final String text;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: Row(
        children: [
          const SizedBox(width: 25,),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorManager.backGround),
              child: AutoSizeText(
                details,
                style: AppStyles.styleSemiBold12.copyWith(),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          AutoSizeText(
            ' : ',
            style: AppStyles.styleSemiBold20.copyWith(color: Colors.black),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorManager.primary7),
              child: Center(
                child: AutoSizeText(
                  text,
                  style: AppStyles.styleSemiBold12.copyWith(color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}