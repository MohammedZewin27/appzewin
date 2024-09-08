
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../theme/strings_manager.dart';
import '../theme/styles_manager.dart';

class LogNameAndLogo extends StatelessWidget {
  const LogNameAndLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width * .03,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).width * .25,
          width: MediaQuery.sizeOf(context).width * .25,
          child: Image.asset(
            Assets.imagesLogo,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.appNamePremiere,
              style: AppStyles.styleSemiBoldQahiri6.copyWith(
                  color:Colors.white,
                  fontSize: 20
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              AppString.appNameMaster,
              style: AppStyles.styleSemiBoldQahiri3
                  .copyWith(color: Colors.white,fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}