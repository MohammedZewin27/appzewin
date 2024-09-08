import 'package:auto_size_text/auto_size_text.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../generated/assets.dart';
import '../../../splash/splash_view.dart';
import '../presentation/cubit/setting_seller_cubit.dart';

Future<dynamic> customShowModalBottomSheet(BuildContext context,
    {void Function()? onPressed,
    required String title,
    required String buttonRed,
    required String buttonGreen,
    required String subTitle,
    void Function()? cancelPress
    }) {
  return showModalBottomSheet(
    backgroundColor: ColorManager.white,
    elevation: 0,
    context: context,
    clipBehavior: Clip.none,
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                title,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onLongPress: onPressed,
                        onPressed: () {
                          CherryToast.warning(
                            title: Text(subTitle),
                          ).show(context);
                        },
                        child: Text(
                          buttonRed,
                          style: AppStyles.styleSemiBold12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed:cancelPress?? () {
                          Navigator.pop(context);
                        },
                        child: Text(buttonGreen,
                            style: AppStyles.styleSemiBold12
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
              top: -18,
              right: 15,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        AppString.appNameMaster,
                        style: AppStyles.styleSemiBoldQahiri3
                            .copyWith(fontSize: 4),
                      )
                    ],
                  )))
        ],
      );
    },
  );
}
