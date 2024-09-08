import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../Features/setting/presentation/cubit/setting_cubit.dart';
import '../../../generated/assets.dart';
import '../cash_data.dart';
import '../theme/color_manager.dart';
import '../theme/strings_manager.dart';
import '../theme/styles_manager.dart';
import '../widgets/logo_app_bar.dart';

AppBar? buildAppBar(BuildContext context) {
  return MediaQuery.sizeOf(context).width - 32 < 900
      ? AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesLogo,
                    height: 38,
                    width: 38,
                  ),
                  const Text(
                    AppString.appNameMaster,
                    style: AppStyles.styleSemiBoldQahiri3,
                  )
                ],
              ),
            )
          ],
          title:
              const Text(AppString.appName, style: AppStyles.styleSemiBold16),
        )
      : null;
}

buildAppBarSliver(BuildContext context) {
  return MediaQuery.sizeOf(context).width - 32 < 900
      ? SliverAppBar(
          backgroundColor: ColorManager.primary7,
          floating: true,
          pinned: false,
          snap: false,
          elevation: 10,
          // foregroundColor: ColorManager.primary7,
          actions: const [
            LogoAppBar(size: 30),
          ],
          title: StringCache.active == true
              ? Text(CacheData.getData(key: StringCache.parentName),
                  style:
                      AppStyles.styleSemiBoldAppBar)
              :  Text(SettingCubit.get(context).parentName),
        )
      : const SliverToBoxAdapter();
}

int lastItems({required List data, required int number}) {
  if (data.length > number) {
    return number;
  } else {
    return data.length;
  }
}

customBuildAppBar(BuildContext context) {
  return MediaQuery.sizeOf(context).width - 32 < 900
      ? SizedBox(
          height: 56,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.imagesLogo,
                      height: 38,
                      width: 38,
                    ),
                    const Text(
                      AppString.appNameMaster,
                      style: AppStyles.styleSemiBoldQahiri3,
                    )
                  ],
                ),
              ),
              const Text(AppString.appName, style: AppStyles.styleSemiBold16),
            ],
          ),
        )
      : null;
}

void customShowDialog(BuildContext context,
    {required String content,
    required String title,
    required String titleButton,
    required IconData icon,
    required Color colorIcon,
    double? sizeIcon,
    required void Function() onPressed}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Icon(
              icon,
              color: colorIcon,
              size: sizeIcon ?? 35,
            ),
            content: Text(
              content,
              style: AppStyles.styleRegular16,
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                  child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary),
                    onPressed: onPressed,
                    child:
                        Text(titleButton, style: AppStyles.styleBoldWhite16)),
              ))
            ],
          )

      //     CustomCupertinoAlertDialog(
      //   onPressed: onPressed,
      //   alertDialogModel: AlertDialogModel(
      //       title: title, titleContent: content, titleButton: titleButton),
      // ),
      );
}

void myDialog(
  BuildContext context, {
  required String content,
  required title,
  required titleButton,
  required void Function() onPressedOk,
  required void Function() onPressedCancel,
  String? image,
  Color? titleColor,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleSemiBold18
                      .copyWith(color: titleColor ?? ColorManager.primary),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content ?? '',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold16.copyWith(color: Colors.black26),
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onPressedCancel();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: ColorManager.grey),
                        child: AutoSizeText(
                          'الغاء',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.styleRegular16
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onPressedOk();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: ColorManager.primary4),
                        child: const AutoSizeText(
                          'تاكيد',
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          style: AppStyles.styleRegular16,
                        ),
                      ),
                    ),
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
                      image ?? Assets.assetsAboutus,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void myDialogInformation(
  BuildContext context, {
  required String content,
  required String title,
  required String titleButton,
  required void Function() onPressedOk,
  String? image,
}) {
  showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
          content: content,
          title: title,
          titleButton: titleButton,
          onPressedOk: onPressedOk));
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.content,
    required this.title,
    required this.titleButton,
    required this.onPressedOk,
    this.image,
  });

  final String content;
  final String title;
  final String titleButton;
  final void Function() onPressedOk;
  final String? image;

  @override
  Widget build(BuildContext context) {
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
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleSemiBold18
                      .copyWith(color: ColorManager.primary),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content ?? '',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold16.copyWith(color: Colors.black26),
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onPressedOk();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: ColorManager.primary4),
                        child: AutoSizeText(
                          titleButton ?? 'تاكيد',
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          style: AppStyles.styleRegular16,
                        ),
                      ),
                    ),
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
                      image ?? Assets.assetsAboutus,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
