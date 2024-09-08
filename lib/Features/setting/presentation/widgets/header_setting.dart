import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/font_manager.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../generated/assets.dart';

class HeaderSetting extends StatelessWidget {
  const HeaderSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).width * .40,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: ColorManager.primary7.withAlpha(250),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 5,
                          left: MediaQuery.sizeOf(context).width / 5,
                          child: Row(
                            children: [
                              Text(
                                AppString.appNamePremiere,
                                style: AppStyles.styleSemiBoldQahiri6.copyWith(
                                    color: Colors.white,
                                    fontSize: FontSize.s12),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                AppString.appNameMaster,
                                style: AppStyles.styleSemiBoldQahiri60,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 2,
                  color: ColorManager.primary,
                ),
              ],
            ),
            Opacity(
              opacity: .05,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.imagesLogo,
                  height: MediaQuery.sizeOf(context).width * .40,
                  width: MediaQuery.sizeOf(context).width * .60,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).width * .17,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorManager.primary),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            Assets.imagesLogo,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.appNamePremiere,
                              style: AppStyles.styleSemiBoldQahiri6,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              AppString.appNameMaster,
                              style: AppStyles.styleSemiBoldQahiri3,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  // CachedImage(url: SettingCubit.get(context).urlImage)
                  ,
                ),
              ),
            ),
          ],
        ),

        /// اضافة بيانات
      ],
    );
  }
}
