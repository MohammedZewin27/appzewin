import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../data/models/user_date.dart';
import '../cubit/setting_cubit.dart';

class BodyCardUserData extends StatelessWidget {
  const BodyCardUserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingCubit.get(context).fetchUserData();

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Card(
              clipBehavior: Clip.none,
              elevation: 10,
              child: InkWell(
                onDoubleTap: () {
                  SettingCubit.get(context).fetchUserData();
                },
                onTap: () {

                },         /// to add color splash to card only
                borderRadius: BorderRadius.circular(8),
                splashColor: ColorManager.primary.withOpacity(.47),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BlocBuilder<SettingCubit, SettingState>(
                    builder: (context, state) {
                      if (state is UserDataSuccess) {
                        HomeCubit.get(context).isSettingDataUserActive=true;
                        UserDataSetting? dataUser =
                            state.userDataModel.userData;
                        SettingCubit.get(context).userDataSetting = dataUser;
                        return state.userDataModel.status==AppString.success?Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dataUser?.userName ?? '',
                              style: AppStyles.styleSemiBold20,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              dataUser?.userPhone ?? '',
                              style: AppStyles.styleBold14
                                  .copyWith(color: Colors.black26),
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              dataUser?.userEmail ?? '',
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.styleBold14
                                  .copyWith(color: Colors.black26),
                            ),
                          ],
                        ):Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'user',
                              style: AppStyles.styleSemiBold20,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '05555555555',
                              style: AppStyles.styleBold14
                                  .copyWith(color: Colors.black26),
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'user@gmail.com',
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.styleBold14
                                  .copyWith(color: Colors.black26),
                            ),
                          ],
                        );
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.black38,
                          highlightColor: Colors.black12,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 25,
                                width: 70,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 25,
                                width: 120,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 25,
                                width: 150,
                              ),
                            ],
                          ),
                        );
                      }

                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
