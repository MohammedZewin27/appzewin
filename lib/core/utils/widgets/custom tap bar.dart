// import 'package:flutter/material.dart';
//
// class CustomTapBar2 extends StatelessWidget {
//   const CustomTapBar2({
//     super.key, required this.length, this.labelColor, required this.tabs, this.onTap,
//   });
//   final int length;
//   final Color? labelColor;
//   final List<Widget> tabs;
//   final void Function(int)? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return  DefaultTabController(
//
//       length: length,
//      child: Material(
//
// elevation: 0,
//        surfaceTintColor: Colors.transparent,
//        child:  Directionality(
//        textDirection:TextDirection.rtl ,
//        child: TabBar(
//          onTap: onTap,
//          physics: const BouncingScrollPhysics(),
//          indicatorColor: Colors.transparent,
//          isScrollable: true,
//          labelColor: labelColor,
//
//          tabs: tabs,
//
//        ),
//      ),
//      ),
//     );
//   }
// }