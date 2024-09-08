import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/color_manager.dart';
import '../theme/styles_manager.dart';

class CustomTitleAndDetails extends StatelessWidget {
  const CustomTitleAndDetails(
      {super.key, required this.text, required this.details, this.copyIconActive=false, this.onTap});

  final String text;
  final String details;
  final bool copyIconActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorManager.backGround),
            child: Row(
              children: [
                copyIconActive?GestureDetector(
                 onTap: onTap,
                 child: const Icon(
                        Icons.copy,
                        size: 16,
                      ),
               ):SizedBox(),
                Expanded(
                  child: AutoSizeText(
                    details,
                    style: AppStyles.styleSemiBold12.copyWith(),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
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
    );
  }
}
