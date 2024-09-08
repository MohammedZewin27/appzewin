import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

class CircleImageToStack extends StatelessWidget {
  const CircleImageToStack({
    super.key, required this.imageAsset,
  });
  final String  imageAsset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: CircleAvatar(
        radius: 40,
        backgroundColor: ColorManager.primary.withOpacity(.2),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: ColorManager.primary.withOpacity(.4),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Image.asset(
                imageAsset,
              ),
            ),
          ),
        ),
      ),
    );
  }
}