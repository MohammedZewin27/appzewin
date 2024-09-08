import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/user_info_list_tile.dart';
import '../../../../generated/assets.dart';
import '../../../Layout/presentation/cubit/layout_cubit.dart';
import '../../../home/presentation/widgets/active_inactive_item_drawer.dart';
import '../../../setting/data/models/items_setting_control_model.dart';
import '../../../setting/presentation/widgets/custom_alert_dialog_log_out.dart';
import '../../../splash/splash_view.dart';
import '../../data/models/drawer_item_model.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';
import '../widgets/drawer_items_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      width: MediaQuery.sizeOf(context).width / 1.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
            SliverToBoxAdapter(
              child: UserInfoListTile(
                mail:
                    SettingCubit.get(context).userDataSetting?.userEmail ?? '',
                title:
                    SettingCubit.get(context).userDataSetting?.userName ?? '',
                subtitle:
                    SettingCubit.get(context).userDataSetting?.userPhone ?? '',
              ),
            ),
            const SliverToBoxAdapter(child: Divider()),
            const DrawerItemsListView(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.pistachio,
                      shape: BeveledRectangleBorder(

                        side: const BorderSide(
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(6)
                      )
                    ),
                    onPressed: () {
                      Navigator.pop(context);

                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialogGoSeller(),
                      );
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // const Icon(Icons.logout,color: Colors.red,),
                        Image.asset(
                          Assets.imagesSellers,height: 25,
                          width: 25,

                        ),
                        Text('حساب بائع',   style: AppStyles.styleSemiBold16
                            .copyWith(fontSize: getResponsiveSize(context, size: 14)),
                            textAlign: TextAlign.end)
                      ],
                    )
                    // CacheData.getData(key: StringCache.userId) != 0  ?
                    // const

                    // InActiveDrawerItem(
                    //   itemModel: DrawerItemModel(
                    //       title: 'تسجيل خروج',
                    //       notActiveIcon: Icons.logout,
                    //       isActiveIcon: Icons.logout),
                    // )
                          // :const SizedBox(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary4,
                      shape: BeveledRectangleBorder(

                        side: const BorderSide(
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(6)
                      )
                    ),
                    onPressed: () {
                      Navigator.pop(context);

                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialogGoShop(),
                      );
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Image.asset(
                          Assets.imagesShops,height: 25,
                          width: 25,

                        ),
                        Text('اضافة محل',   style: AppStyles.styleSemiBold16
                            .copyWith(fontSize: getResponsiveSize(context, size: 14)),
                            textAlign: TextAlign.end)
                      ],
                    )
                    // CacheData.getData(key: StringCache.userId) != 0  ?
                    // const

                    // InActiveDrawerItem(
                    //   itemModel: DrawerItemModel(
                    //       title: 'تسجيل خروج',
                    //       notActiveIcon: Icons.logout,
                    //       isActiveIcon: Icons.logout),
                    // )
                          // :const SizedBox(),
                  ),
                  const SizedBox(height: 25,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        // shape: CircleBorder(
                        //
                        //   side: BorderSide(
                        //     color: Colors.white
                        //   ),
                        //
                        // )
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => const CustomAlertDialogLogOut(),
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Icon(Icons.logout,color: Colors.red,),
                            const SizedBox(width: 8,),
                            Text('تسجيل خروج',   style: AppStyles.styleSemiBold16
                                .copyWith(fontSize: getResponsiveSize(context, size: 14)),
                                textAlign: TextAlign.end)
                          ],
                        ),
                      )
                      // CacheData.getData(key: StringCache.userId) != 0  ?
                      // const

                      // InActiveDrawerItem(
                      //   itemModel: DrawerItemModel(
                      //       title: 'تسجيل خروج',
                      //       notActiveIcon: Icons.logout,
                      //       isActiveIcon: Icons.logout),
                      // )
                            // :const SizedBox(),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
