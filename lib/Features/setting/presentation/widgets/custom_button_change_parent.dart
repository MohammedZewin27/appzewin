import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../parent/data/models/parent_model.dart';

class CustomButtonChangeParent extends StatelessWidget {
  const CustomButtonChangeParent({
    super.key,
    required this.parentList, this.onPressed,
  });

  final DataParent parentList;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
       color: Colors.white,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(12), // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          AspectRatio(
          aspectRatio: 1,
          child: CachedImage(
            url: parentList.appLogo ?? '',

          ),
        ),
        const SizedBox(height: 10,),
        AutoSizeText(parentList.name ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: AppStyles.styleSemiBold12.copyWith(color: Colors.black87,),)
          ],
        ),
      ),
    );
  }
}