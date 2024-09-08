import 'package:flutter/material.dart';

class MyPageController extends PageController {
  final int index;

  MyPageController({required this.index});

  @override
  int get initialPage => index;
}