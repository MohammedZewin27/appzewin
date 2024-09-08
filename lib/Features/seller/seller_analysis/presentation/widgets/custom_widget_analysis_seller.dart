import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';

class CustomWidgetAnalysisSeller extends StatelessWidget {
  const CustomWidgetAnalysisSeller(
      {super.key, required this.text, required this.details});

  final String text;
  final String details;

  @override
  Widget build(BuildContext context) {
    return MyBoxContainer(
      radius: 6,
      child: Column(
        children: [
          const SizedBox(
            width: 25,
          ),
          AutoSizeText(
            details,
            style: AppStyles.styleSemiBold20.copyWith(),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            width: 6,
          ),
          const SizedBox(
            width: 6,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                color: ColorManager.primary7),
            child: Center(
              child: AutoSizeText(
                text,
                style: AppStyles.styleSemiBold12
                    .copyWith(color: Colors.white, fontSize: 6),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}