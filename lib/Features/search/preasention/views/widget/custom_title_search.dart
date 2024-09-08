import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../../core/utils/theme/styles_manager.dart';

class CustomTitleSearch extends StatelessWidget {
  const CustomTitleSearch({
    super.key,
    required this.title, required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorManager.primary7,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Image.asset(image,width: 30,height: 30,),
          Text(
            title,
            style: AppStyles.styleSemiBold12.copyWith(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}