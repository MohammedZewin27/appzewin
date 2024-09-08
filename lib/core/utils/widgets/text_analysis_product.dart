import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/color_manager.dart';
import '../theme/styles_manager.dart';
import 'my_box_container.dart';

class TextAnalysisProduct extends StatelessWidget {
  const TextAnalysisProduct(
      {super.key, required this.value, required this.title, this.isActive=false, this.color});

  final int value;
  final String title;
  final bool isActive ;
  final Color? color ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color:isActive? color:ColorManager.primary7.withOpacity(.2),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(title,style: AppStyles.styleRegular14.copyWith(
            color: isActive?Colors.white :ColorManager.blue ,
              fontWeight: FontWeight.w700
          ),),
          AutoSizeText(value.toString(),style:  TextStyle(
              fontWeight: FontWeight.w700,
           color:    isActive?Colors.white :ColorManager.blue ,

              fontSize: isActive?16:14
          ),),
        ],
      ),
    );
  }
}