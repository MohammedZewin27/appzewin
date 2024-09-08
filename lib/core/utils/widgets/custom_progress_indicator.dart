
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';



class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, this.size, this.color});


final double? size;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return
    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(color:color?? ColorManager.primary,size: size ??28,),
          ],


    );
  }
}
