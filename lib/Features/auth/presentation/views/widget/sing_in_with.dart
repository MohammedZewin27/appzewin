import 'package:flutter/material.dart';

class SingInWith extends StatelessWidget {
  const SingInWith({
    super.key, required this.icon, required this.colorIcon, required this.color, this.onPressed,
  });
  final IconData icon ;
  final Color colorIcon;
  final Color color;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon,color: colorIcon,),
      ),
    );
  }
}