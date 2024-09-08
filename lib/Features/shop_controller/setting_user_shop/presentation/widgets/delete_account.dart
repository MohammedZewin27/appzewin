import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/shop_controller/setting_user_shop/presentation/cubit/setting_shop_user_cubit.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../generated/assets.dart';
import '../../../../setting/presentation/widgets/setting_control/circle_image_stack.dart';
import '../../../../splash/splash_view.dart';

class DeleteAccountShopUser extends StatelessWidget {
  const DeleteAccountShopUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingShopUserCubit, SettingShopUserState>(
      listener: (context, state) {
        if (state is SettingShopLoading) {
          const CustomProgressIndicator();
        }
        if (state is SettingShopSuccess) {
          StringCache.activeShop = false;
          CacheData.setData(key: StringCache.shopActive, value: false);
          CacheData.clearShopItems();

          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashView(),
              ));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Text(
                                'حذف الحساب ',
                                style: AppStyles.styleSemiBold18
                                    .copyWith(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: Text(
                                'اضغط ضغطه مطولة على زر حذف',
                                style: AppStyles.styleSemiBold16
                                    .copyWith(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              child: Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'الغاء',
                                                style: AppStyles.styleRegular15
                                                    .copyWith(
                                                        color: Colors.white),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              onLongPress: () {
                                                SettingShopUserCubit.get(
                                                    context)
                                                    .changeStatus();
                                              },
                                              onPressed: () {

                                                CherryToast.warning(
                                                  title: Text('احترس سوف يتم حذف الحساب, لمتابعة الحذف اضغط ضغطه مطوله '),

                                                ).show(context);
                                              },
                                              child: Text(
                                                'حذف',
                                                style: AppStyles.styleRegular15
                                                    .copyWith(
                                                        color: Colors.white),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: -10,
                    left: 10,
                    child: CircleImageToStack(
                      imageAsset: Assets.imagesLogout,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        );
      },
    );
  }
}
