import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/color_manager.dart';

class PointPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // إنشاء فرشاة للرسم
    final paint = Paint()
      ..color = ColorManager.blue // لون النقطة
      ..strokeCap = StrokeCap.butt // جعل النقطة دائرية
      ..strokeWidth = 6; // عرض النقطة

    // رسم نقطة في منتصف اللوحة
    Offset point = Offset(size.width / 2, size.height / 2);
    canvas.drawPoints(PointMode.points, [point], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // لا حاجة لإعادة الرسم
  }
}