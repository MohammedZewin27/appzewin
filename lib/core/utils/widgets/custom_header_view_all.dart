import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../responsive size/responsive_size.dart';
import '../theme/valus_manager.dart';

class CustomHeaderViewAll extends StatelessWidget {
  const CustomHeaderViewAll({super.key, required this.title, this.onPressed,  this.showAll=true});
final String title;
final Function()? onPressed;
final bool showAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        showAll?Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: onPressed,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_sharp,
                    size:getResponsiveSize(context, size: 12),
                    color: Colors.black54,
                  ),
                  const SizedBox(
                    width: AppSize.s8,
                  ),
                  const Text(
                    'عرض الكل',
                    style: AppStyles.styleRegular12,
                  ),
                ],
              ),
            ),):const SizedBox(),
         Align(
            alignment: Alignment.topRight,
            child: RichText(
              textAlign: TextAlign.end,
              text: TextSpan(
                text: title,
                style:AppStyles.styleRegular16.copyWith(
                  color: ColorManager.primary7,

                  fontSize: getResponsiveSize(context, size: 14),
                  // decoration:  TextDecoration.underline,

                ),

              ),
            ),
         )
      ],
    );
  }
}