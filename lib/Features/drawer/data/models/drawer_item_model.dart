import 'package:flutter/cupertino.dart';

class DrawerItemModel{
  final String title;
  final IconData notActiveIcon;
  final IconData isActiveIcon;


  const DrawerItemModel({required this.title, required this.isActiveIcon,required this.notActiveIcon});
}