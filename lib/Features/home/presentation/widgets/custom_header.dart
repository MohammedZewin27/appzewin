
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/styles_manager.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            text: text,
            style:AppStyles.styleSemiBold16.copyWith(
              color: ColorManager.primary7,
              fontSize: getResponsiveSize(context, size: 14,
              ),
              // decoration:  TextDecoration.underline,

            ),

          ),
        ),
      ),
    );
  }
}
class CustomHeader2 extends StatelessWidget {
  const CustomHeader2({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
          text: text,
          style:AppStyles.styleSemiBold16.copyWith(
            color: ColorManager.primary7,
            fontSize: getResponsiveSize(context, size: 14),
            // decoration:  TextDecoration.underline,

          ),

        ),
      ),
    );
  }
}