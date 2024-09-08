
import 'package:flutter/material.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../data/models/items_setting_control_model.dart';
import '../../../data/models/user_date.dart';
import '../../cubit/setting_cubit.dart';
import 'items_setting_user_control.dart';

class UserSettingControl extends StatelessWidget {
  const UserSettingControl({super.key, this.dataUser});

  final UserDataSetting? dataUser;

  @override
  Widget build(BuildContext context) {
    SettingCubit.get(context).scaffoldKeySetting = GlobalKey<ScaffoldState>();
    SettingCubit.get(context).isActive=true;
    var items = ItemsSettingControlModel.getItemsSettingControl(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary5,
        key: SettingCubit.get(context).scaffoldKeySetting,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 15,),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * .25,
                  width: MediaQuery.sizeOf(context).width * .25,
                  child:
                     Image.asset(Assets.imagesSetting,),
                ),
                const SizedBox(height: 15,),
                Text(
                  'إعدادات الحساب',
                  style: AppStyles.styleSemiBold18.copyWith(color: ColorManager.white),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).width * .5,

                   ),
                child: Container(

                  padding: const EdgeInsets.only(top: 20,    left: 16,
                      right: 16),
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) => ItemsSettingUserControl(
                          dataUser: dataUser,
                          itemsSettingControl: items[index],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width *
                            .4,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            Positioned (
                left: 5,
                top: 15,
        
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                },icon:const Icon(Icons.arrow_back_rounded,color: ColorManager.white,) ,))
          ],
        ),
      ),
    );
  }
}
