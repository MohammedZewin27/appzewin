import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/point_painter.dart';
import '../../../../setting/data/models/items_setting_control_model.dart';

class TextPieChartSeller extends StatelessWidget {
  const TextPieChartSeller(
      {super.key,
        required this.number,
        required this.text,
        required this.color, required this.isActive, required this.colorIcon, required this.icon});

  final String number;
  final String text;
  final Color color;
  final Color colorIcon;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(

      // padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive?ColorManager.pistachio:Colors.transparent
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: isActive?10:20),
          //   child: Icon(icon,
          //   size:isActive?25:20 ,
          //   color:isActive?Colors.white:colorIcon ,
          //   ),
          // ),
          // Container(
          //   width: isActive?24:20,
          //   height: isActive?24:20,
          //
          //   decoration: BoxDecoration(
          //       color: color,
          //       borderRadius: BorderRadius.circular(6)),
          // ),
          //  SizedBox(
          //   width: isActive?10:20,
          // // ),
          Text(
            number,
            style:isActive? AppStyles.styleSemiBold24.copyWith(
              color:isActive? Colors.white:ColorManager.blue
            ):AppStyles.styleSemiBold20,
          ),


          Text(text,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: isActive? Colors.white:color,
                  fontSize: isActive?14:12,
                  fontWeight: FontWeight.w700)

            // AppStyles.styleSemiBold12.copyWith(),
          ),
          // SizedBox(width: 5,),
          // CustomPaint(
          //   size: const Size(10, 10), // حجم اللوحة
          //   painter: PointPainter(), // فئة الرسام المخصصة
          // ),


        ],
      ),
    );
  }
}