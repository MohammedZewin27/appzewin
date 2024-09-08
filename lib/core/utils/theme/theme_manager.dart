import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import 'color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
      useMaterial3: true,

      ///MAIN COLORS
      primaryColor: ColorManager.primary,
      primaryColorDark: ColorManager.darkPrimary,
      primaryColorLight: ColorManager.lightPrimary,
      disabledColor: ColorManager.disableColor,
      splashColor: ColorManager.lightPrimary,


      /// card view theme
      cardTheme: const CardTheme(
          surfaceTintColor: ColorManager.backGround, color: ColorManager.white),

      ///app bar theme

      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary7.withOpacity(.7),
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: ColorManager.primary.withOpacity(.47),
          ),
           backgroundColor: ColorManager.primary7,
          centerTitle: true,
          // elevation:10,
shadowColor: ColorManager.primary7,
          iconTheme: const IconThemeData(
            color:Colors.white,
          ),

          titleTextStyle: AppStyles.styleSemiBoldAppBar),
      scaffoldBackgroundColor: ColorManager.white,

  );
}
