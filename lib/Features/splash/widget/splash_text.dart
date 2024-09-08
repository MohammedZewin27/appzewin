import 'package:flutter/material.dart';


import '../../../core/utils/theme/strings_manager.dart';
import '../../../core/utils/theme/valus_manager.dart';



class SplashText extends StatelessWidget {
  const SplashText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppString.appName,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.normal,
            fontSize: MediaQuery.of(context).size.width *
                AppSizeMediaQuery.s0_15),
      ),
    );
  }
}