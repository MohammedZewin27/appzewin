import 'package:flutter/material.dart';

class MyBoxContainer extends StatelessWidget {
  const MyBoxContainer(
      {super.key,
      required this.child,
      this.radius,
      this.height,
      this.width,
      this.margin,
      this.padding,
      this.color});

  final Widget child;
  final double? radius;
  final double? height;
  final double? width;
  final double? margin;
  final double? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,

        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(margin ?? 0),
        padding: EdgeInsets.all(padding ?? 0),
        decoration: ShapeDecoration(
          color: color ?? Colors.white,
          shadows: const [BoxShadow(offset: Offset(2, 2), color: Colors.white)],
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Color(0xFFF1F1F1)),
            borderRadius: BorderRadius.circular(radius ?? 40),
          ),
        ),
        child: child);
  }
}
