import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../generated/assets.dart';
import '../../../splash/splash_view.dart';

class CustomAlertDialogLogOut extends StatelessWidget {
  const CustomAlertDialogLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 0,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تسجيل خروج',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleSemiBold18
                        .copyWith(color: ColorManager.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'سوف يتم تحويلك إلى صفحة تسجيل الدخول وغلق كافة الصفحات المفتوحة',
                    textAlign: TextAlign.center,
                    style:
                    AppStyles.styleBold16.copyWith(color: Colors.black38),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: () {
                            CacheData.clearUserItems();
                            StringCache.active = false;

                            if (context.mounted) {
                              Navigator.of(context, rootNavigator: true).pop();
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SplashView(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              backgroundColor: ColorManager.red),
                          child: AutoSizeText(
                            'تاكيد',
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            style: AppStyles.styleRegular16
                                .copyWith(color: ColorManager.white),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -70,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        Assets.imagesError,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}