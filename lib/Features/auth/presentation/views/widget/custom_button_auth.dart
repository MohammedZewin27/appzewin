import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';



class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    super.key, required this.text, this.onPressed,
  });
final String text;
final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.styleSemiBold18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}